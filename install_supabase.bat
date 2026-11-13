@echo off
title Install Supabase Dependencies & Skills
cd /d "%~dp0"
echo ===================================================
echo   INSTALLING SUPABASE DEPENDENCIES
echo ===================================================
call npm install @supabase/supabase-js @supabase/ssr
echo.
echo ===================================================
echo   INSTALLING SUPABASE AGENT SKILLS
echo ===================================================
call npx --yes skills add supabase/agent-skills
echo.
echo ===================================================
echo   SUPABASE SETUP COMPLETE
echo ===================================================
pause

