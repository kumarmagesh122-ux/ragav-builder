@echo off
title Push Ragav Builders to GitHub
color 0b
echo ========================================================
echo   RAGAV BUILDERS - PUSH PROJECT TO GITHUB REPOSITORY
echo   Target: https://github.com/Magesh13-ms/Ragav-builder.git
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

echo [2/5] Initializing Git repository...
if not exist ".git" (
    git init
    echo Repository initialized.
) else (
    echo Repository already initialized.
)

echo [3/5] Configuring remote origin...
git remote remove origin 2>nul
git remote add origin https://github.com/Magesh13-ms/Ragav-builder.git
git branch -M main

echo [4/5] Staging required deployment files and creating commit...
git add -A
git commit -m "Deploy Ragav Builders project with Supabase and WhatsApp enquiry system"

echo [5/5] Pushing to GitHub (main branch)...
echo.
git push -u origin main

if %errorlevel% equ 0 (
    echo.
    echo ========================================================
    echo   SUCCESS! All files pushed to GitHub successfully!
    echo   View repo: https://github.com/Magesh13-ms/Ragav-builder
    echo ========================================================
) else (
    echo.
    echo ========================================================
    echo   If GitHub requires force overwrite for initial commit:
    echo   git push -u origin main --force
    echo ========================================================
)

echo.
pause
