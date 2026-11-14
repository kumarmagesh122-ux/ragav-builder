@echo off
title Deploy Ragav Builders to Vercel
color 0a
echo ========================================================
echo   RAGAV BUILDERS - DIRECT DEPLOY TO VERCEL
echo ========================================================
echo.

cd /d "%~dp0"

echo [1/2] Syncing latest HTML, sitemap and robots.txt...
copy /y "RAGAV_BUILDERS_Scroll_Prototype\index.html" "index.html"
copy /y "RAGAV_BUILDERS_Scroll_Prototype\sitemap.xml" "sitemap.xml"
copy /y "RAGAV_BUILDERS_Scroll_Prototype\robots.txt" "robots.txt"

echo.
echo [2/2] Triggering Vercel Production Deployment...
call npx --yes vercel --prod

echo.
echo ========================================================
echo   Deployment Process Finished!
echo ========================================================
pause
