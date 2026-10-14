// =========================================================
// Zoe Pharmacy & General Merchandise - Authentic Product Imagery Engine
// Maps 1,842 products to authentic packaging on clean pure white backgrounds (#ffffff)
// =========================================================

import directRegistry from './productImageRegistry.json';

export interface ProductImageInfo {
  imageUrl: string;
  fallbackUrl: string;
  categoryTag: string;
  brandTag: string;
}

export const POS_FILTER_CATEGORIES = [
  'All',
  'Analgesic',
  'Antibiotic',
  'Vitamins & Supplements',
  'Dermatology',
  'Cough & Cold',
  'Digestive',
  'First Aid',
  'Oral Care',
  'Skin Care',
  'Baby Care',
  'Personal Care'
];

// Helper to escape XML characters for SVG text
function escapeXml(unsafe: string): string {
  return unsafe
    .replace(/&/g, '&amp;')
    .replace(/</g, '&lt;')
    .replace(/>/g, '&gt;')
    .replace(/"/g, '&quot;')
    .replace(/'/g, '&apos;');
}

// Generate unique, variant-aware SVG packaging with exact title, volume & form on pure white background
export function generateVariantPackshot(name: string, sku: string, category: string): string {
  const cleanName = name.replace(/\*/g, '').trim();
  const upper = cleanName.toUpperCase();

  // Extract volume/size if present (e.g. "60mL", "120mL", "500mg", "100 Tablets", "15g", "500mL")
  const volMatch = upper.match(/(\d+(?:\.\d+)?)\s*(ML|G|MG|S|TABLET|CAPSULE|V)/i);
  const volumeText = volMatch ? volMatch[0] : '';

  // Extract primary brand (first 1-2 words)
  const words = cleanName.split(/\s+/);
  const brand = (words[0] || 'Zoe').toUpperCase();
  const subTitle = (words.slice(1, 4).join(' ') || category).substring(0, 24);

  // Determine form factor
  const isSyrup = /SYRUP|SUSPENSION|SUSP|ELIXIR/i.test(upper);
  const isDrops = /DROPS/i.test(upper);
  const isCapsule = /CAPSULE|CAP|SOFTGEL/i.test(upper);
  const isTablet = /TABLET|TAB|CAPLET/i.test(upper);
  const isTube = /CREAM|OINTMENT|GEL|MAXI-PEEL/i.test(upper);
  const isAlcohol = /ALCOHOL|ETHYL|ISOPROPYL|OXIGENADA/i.test(upper);
  const isSpray = /SPRAY/i.test(upper);
  const isSoap = /SOAP|BAR/i.test(upper);
  const isShampoo = /SHAMPOO|CONDITIONER|BATH/i.test(upper);
  const isOil = /OIL|EFFICASCENT|WHITE FLOWER/i.test(upper);

  // Dynamic theme colors by brand
  let primaryColor = '#0284c7'; // default blue
  let accentColor = '#38bdf8';
  if (/ALCOPLUS.*ETHYL|ALAXAN|BETADINE|COLGATE|SAFEGUARD.*RED/i.test(upper)) {
    primaryColor = '#dc2626'; // ruby red
    accentColor = '#f87171';
  } else if (/ALCOPLUS.*ISO|BIOGESIC|ADVIL.*LIQUI/i.test(upper)) {
    primaryColor = '#0369a1'; // sapphire
    accentColor = '#38bdf8';
  } else if (/BIOFLU|SOLMUX|CEELIN|NEOZEP/i.test(upper)) {
    primaryColor = '#15803d'; // emerald green
    accentColor = '#4ade80';
  } else if (/ADVIL.*SUSP|CALPOL|TEMPRA/i.test(upper)) {
    primaryColor = '#9333ea'; // grape / purple
    accentColor = '#c084fc';
  } else if (/JOHNSON|BABY|NIVEA/i.test(upper)) {
    primaryColor = '#0ea5e9'; // sky blue
    accentColor = '#7dd3fc';
  } else if (/WHITE FLOWER|EFFICASCENT/i.test(upper)) {
    primaryColor = '#047857'; // medicated dark teal
    accentColor = '#10b981';
  }

  const safeBrand = escapeXml(brand.substring(0, 14));
  const safeSub = escapeXml(subTitle);
  const safeVol = escapeXml(volumeText || sku);

  // 1. SYRUP / SUSPENSION BOTTLE
  if (isSyrup) {
    const isLarge = /100|120|250/i.test(volumeText);
    const bottleH = isLarge ? 125 : 105;
    const bottleY = isLarge ? 45 : 65;

    return `data:image/svg+xml;utf8,<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 200 200" width="200" height="200"><rect width="200" height="200" fill="%23ffffff"/><g transform="translate(60, 15)"><rect x="25" y="${bottleY - 25}" width="30" height="15" rx="3" fill="%23f8fafc" stroke="%2394a3b8" stroke-width="2"/><rect x="28" y="${bottleY - 10}" width="24" height="10" fill="%23b45309"/><path d="M28 ${bottleY} L10 ${bottleY + 20} L10 ${bottleY + bottleH} Q10 ${bottleY + bottleH + 10} 20 ${bottleY + bottleH + 10} L60 ${bottleY + bottleH + 10} Q70 ${bottleY + bottleH + 10} 70 ${bottleY + bottleH} L70 ${bottleY + 20} L52 ${bottleY} Z" fill="%2378350f"/><rect x="12" y="${bottleY + 25}" width="56" height="${bottleH - 35}" rx="4" fill="%23ffffff"/><rect x="15" y="${bottleY + 30}" width="50" height="14" rx="2" fill="${encodeURIComponent(primaryColor)}"/><text x="40" y="${bottleY + 41}" font-family="system-ui, sans-serif" font-size="8" font-weight="900" fill="%23ffffff" text-anchor="middle">${safeBrand}</text><text x="40" y="${bottleY + 54}" font-family="system-ui, sans-serif" font-size="6" font-weight="bold" fill="%23334155" text-anchor="middle">${safeSub.substring(0, 12)}</text><rect x="20" y="${bottleY + 62}" width="40" height="10" rx="3" fill="%23f1f5f9" stroke="%23cbd5e1"/><text x="40" y="${bottleY + 70}" font-family="system-ui, sans-serif" font-size="6" font-weight="900" fill="${encodeURIComponent(primaryColor)}" text-anchor="middle">${safeVol}</text></g></svg>`;
  }

  // 2. DROPS BOTTLE
  if (isDrops) {
    return `data:image/svg+xml;utf8,<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 200 200" width="200" height="200"><rect width="200" height="200" fill="%23ffffff"/><g transform="translate(65, 20)"><path d="M25 10 Q35 0 45 10 L45 28 L25 28 Z" fill="%23334155"/><rect x="22" y="28" width="26" height="12" rx="2" fill="%23cbd5e1" stroke="%2394a3b8"/><path d="M30 40 L18 52 L18 135 Q18 145 28 145 L42 145 Q52 145 52 135 L52 52 L40 40 Z" fill="%2378350f"/><rect x="20" y="60" width="30" height="65" rx="3" fill="%23ffffff"/><rect x="22" y="65" width="26" height="12" rx="2" fill="${encodeURIComponent(primaryColor)}"/><text x="35" y="74" font-family="system-ui, sans-serif" font-size="6" font-weight="900" fill="%23ffffff" text-anchor="middle">${safeBrand}</text><text x="35" y="86" font-family="system-ui, sans-serif" font-size="5" font-weight="bold" fill="%23334155" text-anchor="middle">DROPS</text><rect x="22" y="96" width="26" height="8" rx="2" fill="%23e0f2fe"/><text x="35" y="103" font-family="system-ui, sans-serif" font-size="5" font-weight="900" fill="${encodeURIComponent(primaryColor)}" text-anchor="middle">${safeVol}</text></g></svg>`;
  }

  // 3. ANTISEPTIC / ALCOHOL BOTTLE
  if (isAlcohol) {
    const isAce = /OXIGENADA|ACE/i.test(upper);
    const badgeColor = isAce ? '%230284c7' : encodeURIComponent(primaryColor);

    return `data:image/svg+xml;utf8,<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 200 200" width="200" height="200"><rect width="200" height="200" fill="%23ffffff"/><g transform="translate(55, 15)"><rect x="32" y="5" width="26" height="20" rx="4" fill="${encodeURIComponent(primaryColor)}"/><path d="M32 25 L15 45 L15 155 Q15 165 25 165 L65 165 Q75 165 75 155 L75 45 L58 25 Z" fill="%23ffffff" stroke="%2394a3b8" stroke-width="2"/><rect x="20" y="55" width="50" height="85" rx="4" fill="%23f8fafc" stroke="%23e2e8f0"/><rect x="23" y="60" width="44" height="16" rx="2" fill="${badgeColor}"/><text x="45" y="72" font-family="system-ui, sans-serif" font-size="7" font-weight="900" fill="%23ffffff" text-anchor="middle">${safeBrand}</text><text x="45" y="86" font-family="system-ui, sans-serif" font-size="6" font-weight="bold" fill="%23334155" text-anchor="middle">${safeSub.substring(0, 14)}</text><path d="M45 95 L45 115 M35 105 L55 105" stroke="%23ef4444" stroke-width="4" stroke-linecap="round"/><rect x="26" y="123" width="38" height="12" rx="3" fill="%23ffffff" stroke="%23cbd5e1"/><text x="45" y="132" font-family="system-ui, sans-serif" font-size="7" font-weight="900" fill="%231e293b" text-anchor="middle">${safeVol}</text></g></svg>`;
  }

  // 4. CAPSULES BOX & BLISTER
  if (isCapsule) {
    return `data:image/svg+xml;utf8,<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 200 200" width="200" height="200"><rect width="200" height="200" fill="%23ffffff"/><g transform="translate(30, 25)"><rect x="15" y="10" width="110" height="135" rx="8" fill="%23ffffff" stroke="%23cbd5e1" stroke-width="2"/><rect x="15" y="10" width="110" height="38" rx="8" fill="${encodeURIComponent(primaryColor)}"/><text x="70" y="28" font-family="system-ui, sans-serif" font-size="11" font-weight="900" fill="%23ffffff" text-anchor="middle">${safeBrand}</text><text x="70" y="40" font-family="system-ui, sans-serif" font-size="7" font-weight="bold" fill="%23ffffff" text-anchor="middle">${safeSub.substring(0, 16)}</text><g transform="translate(35, 62)"><rect x="0" y="5" width="35" height="18" rx="9" fill="${encodeURIComponent(primaryColor)}"/><rect x="25" y="5" width="25" height="18" rx="9" fill="%23fbbf24"/><rect x="42" y="28" width="35" height="18" rx="9" fill="%2310b981"/><rect x="17" y="28" width="25" height="18" rx="9" fill="%23ffffff" stroke="%23cbd5e1"/></g><rect x="30" y="116" width="80" height="18" rx="4" fill="%23f8fafc" stroke="%23e2e8f0"/><text x="70" y="129" font-family="system-ui, sans-serif" font-size="8" font-weight="900" fill="%230f172a" text-anchor="middle">${safeVol || 'CAPSULES'}</text></g></svg>`;
  }

  // 5. TABLETS BOX & BLISTER
  if (isTablet) {
    return `data:image/svg+xml;utf8,<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 200 200" width="200" height="200"><rect width="200" height="200" fill="%23ffffff"/><g transform="translate(30, 25)"><rect x="15" y="10" width="110" height="135" rx="8" fill="%23ffffff" stroke="%23cbd5e1" stroke-width="2"/><rect x="15" y="10" width="110" height="38" rx="8" fill="${encodeURIComponent(primaryColor)}"/><text x="70" y="28" font-family="system-ui, sans-serif" font-size="11" font-weight="900" fill="%23ffffff" text-anchor="middle">${safeBrand}</text><text x="70" y="40" font-family="system-ui, sans-serif" font-size="7" font-weight="bold" fill="%23ffffff" text-anchor="middle">${safeSub.substring(0, 16)}</text><rect x="25" y="58" width="90" height="50" rx="6" fill="%23f8fafc" stroke="%23e2e8f0"/><circle cx="45" cy="74" r="8" fill="%23ffffff" stroke="%23cbd5e1" stroke-width="1.5"/><circle cx="70" cy="74" r="8" fill="%23ffffff" stroke="%23cbd5e1" stroke-width="1.5"/><circle cx="95" cy="74" r="8" fill="%23ffffff" stroke="%23cbd5e1" stroke-width="1.5"/><circle cx="45" cy="94" r="8" fill="%23ffffff" stroke="%23cbd5e1" stroke-width="1.5"/><circle cx="70" cy="94" r="8" fill="%23ffffff" stroke="%23cbd5e1" stroke-width="1.5"/><circle cx="95" cy="94" r="8" fill="%23ffffff" stroke="%23cbd5e1" stroke-width="1.5"/><rect x="30" y="116" width="80" height="18" rx="4" fill="%23f8fafc" stroke="%23e2e8f0"/><text x="70" y="129" font-family="system-ui, sans-serif" font-size="8" font-weight="900" fill="%230f172a" text-anchor="middle">${safeVol || 'TABLETS'}</text></g></svg>`;
  }

  // 6. TUBE / OINTMENT / CREAM
  if (isTube) {
    return `data:image/svg+xml;utf8,<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 200 200" width="200" height="200"><rect width="200" height="200" fill="%23ffffff"/><g transform="translate(35, 40)"><rect x="95" y="45" width="20" height="22" rx="3" fill="${encodeURIComponent(primaryColor)}"/><path d="M95 50 L20 35 L10 60 L20 85 L95 70 Z" fill="%23ffffff" stroke="%23cbd5e1" stroke-width="2"/><rect x="28" y="45" width="55" height="26" fill="${encodeURIComponent(primaryColor)}"/><text x="55" y="58" font-family="system-ui, sans-serif" font-size="8" font-weight="900" fill="%23ffffff" text-anchor="middle">${safeBrand}</text><text x="55" y="67" font-family="system-ui, sans-serif" font-size="6" font-weight="bold" fill="%23ffffff" text-anchor="middle">${safeVol || 'OINTMENT'}</text></g></svg>`;
  }

  // 7. SOAP BAR
  if (isSoap) {
    return `data:image/svg+xml;utf8,<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 200 200" width="200" height="200"><rect width="200" height="200" fill="%23ffffff"/><g transform="translate(35, 45)"><rect x="10" y="10" width="110" height="85" rx="18" fill="%23ffffff" stroke="%23cbd5e1" stroke-width="2"/><rect x="18" y="18" width="94" height="69" rx="14" fill="%23f8fafc" stroke="%23e2e8f0"/><rect x="25" y="28" width="80" height="20" rx="4" fill="${encodeURIComponent(primaryColor)}"/><text x="65" y="42" font-family="system-ui, sans-serif" font-size="10" font-weight="900" fill="%23ffffff" text-anchor="middle">${safeBrand}</text><text x="65" y="65" font-family="system-ui, sans-serif" font-size="7" font-weight="bold" fill="%2364748b" text-anchor="middle">${safeVol || 'BAR SOAP'}</text></g></svg>`;
  }

  // 8. DEFAULT CLEAN PHARMACY PACKAGING
  return `data:image/svg+xml;utf8,<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 200 200" width="200" height="200"><rect width="200" height="200" fill="%23ffffff"/><g transform="translate(35, 25)"><rect x="10" y="10" width="110" height="135" rx="10" fill="%23ffffff" stroke="%23cbd5e1" stroke-width="2"/><rect x="10" y="10" width="110" height="42" rx="10" fill="${encodeURIComponent(primaryColor)}"/><text x="65" y="32" font-family="system-ui, sans-serif" font-size="11" font-weight="900" fill="%23ffffff" text-anchor="middle">${safeBrand}</text><text x="65" y="44" font-family="system-ui, sans-serif" font-size="7" font-weight="bold" fill="%23ffffff" text-anchor="middle">${safeSub.substring(0, 16)}</text><rect x="25" y="65" width="80" height="45" rx="6" fill="%23f8fafc" stroke="%23e2e8f0"/><text x="65" y="88" font-family="system-ui, sans-serif" font-size="7" font-weight="bold" fill="%23334155" text-anchor="middle">${escapeXml(sku)}</text><rect x="20" y="118" width="90" height="18" rx="4" fill="%23ffffff" stroke="%23cbd5e1"/><text x="65" y="131" font-family="system-ui, sans-serif" font-size="8" font-weight="900" fill="${encodeURIComponent(primaryColor)}" text-anchor="middle">${safeVol || 'GENUINE PRODUCT'}</text></g></svg>`;
}

// Main image resolution engine
export function getProductImage(product: { sku: string; name: string; category?: string; description?: string }): ProductImageInfo {
  const name = product.name.replace(/\*/g, '').trim();
  const upper = name.toUpperCase();
  const sku = product.sku || '';

  // 1. Detect Category Tag
  let categoryTag = 'General';
  if (/PARACETAMOL|IBUPROFEN|MEFENAMIC|ALAXAN|BIOGESIC|ADVIL|TEMPRA|CALPOL|ANALGESIC/i.test(upper)) {
    categoryTag = 'Analgesic';
  } else if (/AMOXICILLIN|ANTIBIOTIC|ZITHROMAX|CEFALEXIN|CO-AMOXICLAV/i.test(upper)) {
    categoryTag = 'Antibiotic';
  } else if (/VITAMIN|ENERVON|CENTRUM|POTEN-CEE|CEELIN|CHERIFER|SUPPLEMENT|ZINC/i.test(upper)) {
    categoryTag = 'Vitamins & Supplements';
  } else if (/COUGH|COLD|FLU|NEOZEP|BIOFLU|SOLMUX|ROBITUSSIN|TUSERAN|DECOLGEN|ASCOF/i.test(upper)) {
    categoryTag = 'Cough & Cold';
  } else if (/KREMIL|ANTACID|DIGESTIVE|DIATABS|BUSCOPAN|DULCOLAX/i.test(upper)) {
    categoryTag = 'Digestive';
  } else if (/BETADINE|ALCOHOL|ALCOPLUS|OXIGENADA|BANDAGE|FIRST AID/i.test(upper)) {
    categoryTag = 'First Aid';
  } else if (/COLGATE|ORAL|TOOTHPASTE|HAPEE|SENSODYNE/i.test(upper)) {
    categoryTag = 'Oral Care';
  } else if (/SOAP|SHAMPOO|DOVE|SAFEGUARD|PALMOLIVE|REXONA|CREAMSILK/i.test(upper)) {
    categoryTag = 'Personal Care';
  } else if (/BABY|DIAPER|JOHNSON|EQ|SWEETIES/i.test(upper)) {
    categoryTag = 'Baby Care';
  } else if (/MAXI-PEEL|ESKINOL|NIVEA|SKIN|POND/i.test(upper)) {
    categoryTag = 'Skin Care';
  } else if (/CREAM|OINTMENT|DERMA|FUNGICIDE/i.test(upper)) {
    categoryTag = 'Dermatology';
  } else if (product.category && product.category.toLowerCase().includes('non-pharmaceutical')) {
    categoryTag = 'Personal Care';
  } else if (product.category && product.category.toLowerCase().includes('pharmaceutical')) {
    categoryTag = 'Pharmaceutical';
  }

  // 2. Detect Brand Tag
  let brandTag = 'Generic';
  const brandKeywords = [
    'Advil', 'Alaxan', 'Alcoplus', 'Allerkid', 'Allerta', 'Alnix', 'Amoxicillin',
    'Ascof', 'Betadine', 'Bioderm', 'Biogesic', 'Bioflu', 'Buscopan', 'Calpol', 'Ceelin',
    'Centrum', 'Cherifer', 'Colgate', 'Decolgen', 'Diatabs', 'Dove', 'Efficascent',
    'Enervon', 'Eskinol', 'Johnson', 'Kremil-S', 'Maxi-Peel', 'Neozep', 'Nivea',
    'Poten-Cee', 'Rexona', 'Robitussin', 'Safeguard', 'Solmux', 'Tempra', 'Vicks',
    'White Flower', 'Zithromax', 'Zykast', 'Ace', 'IPI', 'Rhea', 'Pharex', 'RiteMed',
    'Bench', 'Silka', 'Kojiesan', 'Creamsilk', 'Palmolive', 'Strepsils', 'Hapee',
    'Sensodyne', 'Close Up', 'Ponds', 'Olay', 'Myra', 'Charmee', 'Modess', 'EQ', 'Casino', 'Bigen'
  ];

  for (const b of brandKeywords) {
    if (upper.includes(b.toUpperCase())) {
      brandTag = b;
      break;
    }
  }

  // 3. Fallback Dynamic Packshot
  const fallbackUrl = generateVariantPackshot(name, sku, categoryTag);

  // 4. Check Direct Registry (All 1,842 Authentic Scraped & Curated Real Packshots)
  const registry = directRegistry as Record<string, string>;
  const directRealImage = registry[sku];

  const imageUrl = directRealImage || fallbackUrl;

  return {
    imageUrl,
    fallbackUrl,
    categoryTag,
    brandTag
  };
}
