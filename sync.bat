@echo off
title Ragav Builders Logo Synchronizer
echo ===================================================
echo   RAGAV BUILDERS - LOGO SYNC UTILITY
echo ===================================================

set "SCRIPT_DIR=%~dp0"
cd /d "%SCRIPT_DIR%"

mkdir "%SCRIPT_DIR%assets" 2>nul
mkdir "%SCRIPT_DIR%images" 2>nul
mkdir "%SCRIPT_DIR%public\images" 2>nul
mkdir "%SCRIPT_DIR%RAGAV_BUILDERS_Scroll_Prototype\assets" 2>nul
mkdir "%SCRIPT_DIR%RAGAV_BUILDERS_Scroll_Prototype\images" 2>nul
mkdir "%SCRIPT_DIR%RAGAV_BUILDERS_Scroll_Prototype\public\images" 2>nul

set "SOURCE=C:\Users\mages\.gemini\antigravity\brain\0542399e-1da1-43ac-819f-3d80acdc46d3\.user_uploaded\media_1794384039966_d25b81ad.png"
if not exist "%SOURCE%" set "SOURCE=C:\Users\mages\.gemini\antigravity\brain\0542399e-1da1-43ac-819f-3d80acdc46d3\.user_uploaded\media_1794379107734_787def9f.png"

if exist "%SOURCE%" (
    echo [FOUND] Master transparent logo: %SOURCE%
    
    :: Copy to prototype folders
    copy /y "%SOURCE%" "%SCRIPT_DIR%RAGAV_BUILDERS_Scroll_Prototype\assets\ragav-builders-chrome-logo.png" >nul
    copy /y "%SOURCE%" "%SCRIPT_DIR%RAGAV_BUILDERS_Scroll_Prototype\assets\ragav-builders-logo.png" >nul
    copy /y "%SOURCE%" "%SCRIPT_DIR%RAGAV_BUILDERS_Scroll_Prototype\assets\ragav-builders-transparent-logo.png" >nul
    copy /y "%SOURCE%" "%SCRIPT_DIR%RAGAV_BUILDERS_Scroll_Prototype\assets\logo.png" >nul
    copy /y "%SOURCE%" "%SCRIPT_DIR%RAGAV_BUILDERS_Scroll_Prototype\images\ragav-builders-logo.png" >nul
    copy /y "%SOURCE%" "%SCRIPT_DIR%RAGAV_BUILDERS_Scroll_Prototype\images\ragav-builders-chrome-logo.png" >nul
    copy /y "%SOURCE%" "%SCRIPT_DIR%RAGAV_BUILDERS_Scroll_Prototype\public\images\ragav-builders-logo.png" >nul
    copy /y "%SOURCE%" "%SCRIPT_DIR%RAGAV_BUILDERS_Scroll_Prototype\public\images\ragav-builders-chrome-logo.png" >nul

    :: Copy to root folders
    copy /y "%SOURCE%" "%SCRIPT_DIR%assets\ragav-builders-chrome-logo.png" >nul
    copy /y "%SOURCE%" "%SCRIPT_DIR%assets\ragav-builders-logo.png" >nul
    copy /y "%SOURCE%" "%SCRIPT_DIR%images\ragav-builders-logo.png" >nul
    copy /y "%SOURCE%" "%SCRIPT_DIR%public\images\ragav-builders-logo.png" >nul

    echo [SUCCESS] Authentic Chrome Logo synchronized to all website asset directories!
) else (
    echo [ERROR] Source file not found: %SOURCE%
)

:: Synchronize footer architectural villa watermark
set "VILLA=C:\Users\mages\.gemini\antigravity\brain\0542399e-1da1-43ac-819f-3d80acdc46d3\footer_villa_clean_1794563024775.jpg"
if not exist "%VILLA%" set "VILLA=C:\Users\mages\.gemini\antigravity\brain\0542399e-1da1-43ac-819f-3d80acdc46d3\.user_uploaded\media_1794559304869_abbc5f0b.jpg"
if not exist "%VILLA%" set "VILLA=C:\Users\mages\.gemini\antigravity\brain\0542399e-1da1-43ac-819f-3d80acdc46d3\.user_uploaded\media_1794556977284_8a004f35.jpg"
if not exist "%VILLA%" set "VILLA=C:\Users\mages\.gemini\antigravity\brain\0542399e-1da1-43ac-819f-3d80acdc46d3\.user_uploaded\media_1794387559795_85944f50.jpg"
if not exist "%VILLA%" set "VILLA=C:\Users\mages\.gemini\antigravity\brain\0542399e-1da1-43ac-819f-3d80acdc46d3\.user_uploaded\media_1794386961128_b723ab48.jpg"

if exist "%VILLA%" (
    echo [FOUND] Master architectural villa background: %VILLA%
    copy /y "%VILLA%" "%SCRIPT_DIR%RAGAV_BUILDERS_Scroll_Prototype\assets\footer-villa-clean.jpg" >nul
    copy /y "%VILLA%" "%SCRIPT_DIR%RAGAV_BUILDERS_Scroll_Prototype\assets\footer-villa-bg.jpg" >nul
    copy /y "%VILLA%" "%SCRIPT_DIR%RAGAV_BUILDERS_Scroll_Prototype\assets\footer-reference.jpg" >nul
    copy /y "%VILLA%" "%SCRIPT_DIR%RAGAV_BUILDERS_Scroll_Prototype\images\footer-villa-clean.jpg" >nul
    copy /y "%VILLA%" "%SCRIPT_DIR%RAGAV_BUILDERS_Scroll_Prototype\images\footer-villa-bg.jpg" >nul
    copy /y "%VILLA%" "%SCRIPT_DIR%RAGAV_BUILDERS_Scroll_Prototype\images\footer-reference.jpg" >nul
    copy /y "%VILLA%" "%SCRIPT_DIR%RAGAV_BUILDERS_Scroll_Prototype\public\images\footer-villa-clean.jpg" >nul
    copy /y "%VILLA%" "%SCRIPT_DIR%RAGAV_BUILDERS_Scroll_Prototype\public\images\footer-villa-bg.jpg" >nul
    copy /y "%VILLA%" "%SCRIPT_DIR%RAGAV_BUILDERS_Scroll_Prototype\public\images\footer-reference.jpg" >nul
    copy /y "%VILLA%" "%SCRIPT_DIR%assets\footer-villa-clean.jpg" >nul
    copy /y "%VILLA%" "%SCRIPT_DIR%assets\footer-villa-bg.jpg" >nul
    copy /y "%VILLA%" "%SCRIPT_DIR%assets\footer-reference.jpg" >nul
    copy /y "%VILLA%" "%SCRIPT_DIR%images\footer-villa-clean.jpg" >nul
    copy /y "%VILLA%" "%SCRIPT_DIR%images\footer-villa-bg.jpg" >nul
    copy /y "%VILLA%" "%SCRIPT_DIR%images\footer-reference.jpg" >nul
    echo [SUCCESS] Clean Architectural Villa Background synchronized!
)

echo.
echo Synchronization complete. You can refresh your browser now.
echo.
pause

