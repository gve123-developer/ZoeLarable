@echo off
title PostgreSQL Console - zoe_pos_system_db
color 0A
set PGPASSWORD=postgres
echo ========================================================
echo   CONNECTED TO POSTGRESQL (zoe_pos_system_db)
echo ========================================================
echo Type SQL queries or commands (e.g. \dt, \d products, etc.)
echo.
" C:\Program Files\PostgreSQL\18\bin\psql.exe\ -h 127.0.0.1 -p 5432 -U postgres -d zoe_pos_system_db
pause
