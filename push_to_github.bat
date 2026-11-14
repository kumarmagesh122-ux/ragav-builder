@echo off
title Push Ragav Builders to GitHub
color 0b
echo ========================================================
echo   RAGAV BUILDERS - PUSH PROJECT TO GITHUB REPOSITORY
echo   Target: https://github.com/kumarmagesh122-ux/ragav-builder.git
echo ========================================================
echo.

cd /d "%~dp0"

echo [1/5] Checking Git installation...
where git >nul 2>nul
if %errorlevel% neq 0 (
    echo [ERROR] Git is not found in your system PATH.
    echo Please install Git from https://git-scm.com/ and try again.
    pause
    exit /b 1
)

echo [2/5] Syncing full website to root and removing legacy files...
if exist "middleware.ts" del /f /q "middleware.ts"
if exist "utils" rmdir /s /q "utils"
copy /y "RAGAV_BUILDERS_Scroll_Prototype\index.html" "index.html"
copy /y "RAGAV_BUILDERS_Scroll_Prototype\sitemap.xml" "sitemap.xml"
copy /y "RAGAV_BUILDERS_Scroll_Prototype\robots.txt" "robots.txt"

echo [3/5] Initializing Git repository...
if not exist ".git" (
    git init
    echo Repository initialized.
) else (
    echo Repository already initialized.
)

echo [4/5] Configuring remote origin to kumarmagesh122-ux/ragav-builder...
git remote remove origin 2>nul
git remote add origin https://github.com/kumarmagesh122-ux/ragav-builder.git
git branch -M main

echo [5/5] Staging all files and pushing live to GitHub...
git add -A
git commit -m "Mobile: Comprehensive mobile-only responsive optimization (<=767px) preserving 100% desktop website"
echo.
git push -u origin main --force

if %errorlevel% equ 0 (
    echo.
    echo ========================================================
    echo   SUCCESS! Website and Vercel fix pushed to GitHub!
    echo   View repo: https://github.com/kumarmagesh122-ux/ragav-builder
    echo ========================================================
) else (
    echo.
    echo ========================================================
    echo   Push encountered an authentication check.
    echo   Please verify your GitHub credentials in the prompt.
    echo ========================================================
)

echo.
pause
