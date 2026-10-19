let speakTimeout: any = null;
let isLoopingCount: number = 0; // Using a count as an ID to cancel superseded loops
let activeUtterance: SpeechSynthesisUtterance | null = null; // Retain reference to prevent Chrome GC bug

export type VoiceMessage = string | { text: string; pause?: number };

// Auto-unlock speech synthesis on first user interaction
if (typeof window !== 'undefined') {
    const unlockSpeech = () => {
        try {
            if (window.speechSynthesis) {
                if (window.speechSynthesis.paused) {
                    window.speechSynthesis.resume();
                }
            }
        } catch (_) {}
    };
    window.addEventListener('click', unlockSpeech, { passive: true });
    window.addEventListener('keydown', unlockSpeech, { passive: true });
    window.addEventListener('touchstart', unlockSpeech, { passive: true });
}

export const stopSpeaking = () => {
    isLoopingCount++; // invalidate any active loop
    if (speakTimeout) {
        clearTimeout(speakTimeout);
        speakTimeout = null;
    }
    if (typeof window !== 'undefined' && window.speechSynthesis) {
        try {
            window.speechSynthesis.cancel();
            if (window.speechSynthesis.paused) {
                window.speechSynthesis.resume();
            }
        } catch (_) {}
    }
    activeUtterance = null;
};

export const speak = (input: VoiceMessage | VoiceMessage[], options?: { loop?: boolean }) => {
    if (typeof window === 'undefined' || !window.speechSynthesis) return;

    // Cancel any existing speech and timeout
    stopSpeaking();

    const currentLoopId = isLoopingCount;
    const items = Array.isArray(input) ? input : [input];
    let index = 0;

    const speakItem = () => {
        if (currentLoopId !== isLoopingCount) return; // A newer call cancelled this

        if (index >= items.length) {
            if (options?.loop) {
                index = 0; // restart
                // Add a polite 1.5s delay before looping
                speakTimeout = setTimeout(speakItem, 1500);
                return;
            } else {
                activeUtterance = null;
                return; // done
            }
        }

        const current = items[index];
        const text = typeof current === 'string' ? current : current.text;
        const pause = typeof current === 'string' ? 0 : (current.pause || 0);

        if (!text || text.trim() === '') {
            index++;
            speakItem();
            return;
        }

        // Resume if paused (known Chrome bug where synthesis pauses silently)
        try {
            if (window.speechSynthesis.paused) {
                window.speechSynthesis.resume();
            }
        } catch (_) {}

        // Create utterance
        const utterance = new SpeechSynthesisUtterance(text);
        activeUtterance = utterance; // Keep module-level reference so garbage collection doesn't kill it mid-speech

        const voices = window.speechSynthesis.getVoices();

        // Search for pleasant natural/female English voices
        const preferredVoice = voices.find(v => {
            const name = v.name.toLowerCase();
            if (!v.lang.startsWith('en')) return false;

            return (
                name.includes('female') ||
                name.includes('zira') ||
                name.includes('samantha') ||
                name.includes('google us english') ||
                name.includes('victoria') ||
                name.includes('hazel') ||
                name.includes('susan') ||
                name.includes('natural') ||
                name.includes('aria') ||
                name.includes('jenny')
            );
        }) || voices.find(v => v.lang.startsWith('en')) || voices[0];

        if (preferredVoice) {
            utterance.voice = preferredVoice;
        }

        utterance.rate = 0.92;
        utterance.pitch = 1.05;
        utterance.volume = 1.0;

        utterance.onend = () => {
            if (currentLoopId !== isLoopingCount) return;
            index++;
            // Apply pause before next message
            if (pause > 0) {
                speakTimeout = setTimeout(speakItem, pause);
            } else {
                speakItem();
            }
        };

        // Handle errors (e.g. if autoplay policy blocked audio)
        utterance.onerror = (e) => {
            if (currentLoopId !== isLoopingCount) return;
            console.warn("Speech synthesis notice:", e.error);

            if (e.error === 'not-allowed') {
                // Browser autoplay blocked unprompted speech; retry on next user click
                const retryOnClick = () => {
                    window.removeEventListener('click', retryOnClick);
                    window.removeEventListener('keydown', retryOnClick);
                    if (currentLoopId === isLoopingCount) {
                        try {
                            if (window.speechSynthesis.paused) {
                                window.speechSynthesis.resume();
                            }
                        } catch (_) {}
                        speakItem();
                    }
                };
                window.addEventListener('click', retryOnClick, { once: true, passive: true });
                window.addEventListener('keydown', retryOnClick, { once: true, passive: true });
                return;
            }

            // For other interruptions, proceed to next item
            index++;
            speakItem();
        };

        try {
            window.speechSynthesis.speak(utterance);
            // Chrome bug: Speech can pause immediately after speak()
            if (window.speechSynthesis.paused) {
                window.speechSynthesis.resume();
            }
        } catch (err) {
            console.error("Speech synthesis invocation failed:", err);
            index++;
            speakItem();
        }
    };

    // Small delay ensures previous cancel() message has cleared the browser IPC queue
    setTimeout(() => {
        if (currentLoopId !== isLoopingCount) return;

        if (window.speechSynthesis.getVoices().length === 0) {
            let fired = false;
            const onVoices = () => {
                if (fired) return;
                fired = true;
                window.speechSynthesis.onvoiceschanged = null;
                speakItem();
            };
            window.speechSynthesis.onvoiceschanged = onVoices;
            // Fallback timeout in case onvoiceschanged event is not fired by the browser
            setTimeout(onVoices, 80);
        } else {
            speakItem();
        }
    }, 40);
};
