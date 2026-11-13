@echo off
title Ragav Builders Prototype
cd /d "%~dp0"

echo ===================================================
echo   RAGAV BUILDERS - PROTOTYPE LAUNCHER
echo ===================================================

if not exist "%~dp0assets" mkdir "%~dp0assets"
if not exist "%~dp0images" mkdir "%~dp0images"
if not exist "%~dp0public\images" mkdir "%~dp0public\images"
if not exist "%~dp0assets\outro-frames" mkdir "%~dp0assets\outro-frames"

:: Synchronize uploaded official transparent chrome logo (Ragav Builders Chrome Logo(1).png / (2).png / latest)
set "LOGO_SRC=C:\Users\mages\.gemini\antigravity\brain\0542399e-1da1-43ac-819f-3d80acdc46d3\.user_uploaded\media_1794384039966_d25b81ad.png"
if not exist "%LOGO_SRC%" set "LOGO_SRC=C:\Users\mages\.gemini\antigravity\brain\0542399e-1da1-43ac-819f-3d80acdc46d3\.user_uploaded\media_1794379107734_787def9f.png"

if exist "%LOGO_SRC%" (
    copy /y "%LOGO_SRC%" "%~dp0assets\ragav-builders-chrome-logo.png" >nul 2>nul
    copy /y "%LOGO_SRC%" "%~dp0assets\ragav-builders-logo.png" >nul 2>nul
    copy /y "%LOGO_SRC%" "%~dp0assets\ragav-builders-transparent-logo.png" >nul 2>nul
    copy /y "%LOGO_SRC%" "%~dp0assets\logo.png" >nul 2>nul
    copy /y "%LOGO_SRC%" "%~dp0assets\ragav-builders-logo.jpg" >nul 2>nul
    copy /y "%LOGO_SRC%" "%~dp0assets\logo.jpg" >nul 2>nul
    copy /y "%LOGO_SRC%" "%~dp0images\ragav-builders-logo.png" >nul 2>nul
    copy /y "%LOGO_SRC%" "%~dp0public\images\ragav-builders-logo.png" >nul 2>nul
)

:: Synchronize uploaded animated outro video
if exist "C:\Users\mages\.gemini\antigravity\brain\0542399e-1da1-43ac-819f-3d80acdc46d3\.user_uploaded\media_1794371653239_9d1cf532.mp4" (
    copy /y "C:\Users\mages\.gemini\antigravity\brain\0542399e-1da1-43ac-819f-3d80acdc46d3\.user_uploaded\media_1794371653239_9d1cf532.mp4" "%~dp0assets\ragav_builders_animated_outro_v2.mp4" >nul 2>nul
    copy /y "C:\Users\mages\.gemini\antigravity\brain\0542399e-1da1-43ac-819f-3d80acdc46d3\.user_uploaded\media_1794371653239_9d1cf532.mp4" "%~dp0assets\ragav_builders_animated_outro_v2(1).mp4" >nul 2>nul
)

:: Synchronize uploaded footer reference & architectural villa image (Clean original without blue artifact)
set "VILLA_SRC=C:\Users\mages\.gemini\antigravity\brain\0542399e-1da1-43ac-819f-3d80acdc46d3\footer_villa_clean_1794563024775.jpg"
if not exist "%VILLA_SRC%" set "VILLA_SRC=C:\Users\mages\.gemini\antigravity\brain\0542399e-1da1-43ac-819f-3d80acdc46d3\.user_uploaded\media_1794378533979_7dfa59c4.jpg"
if not exist "%VILLA_SRC%" set "VILLA_SRC=C:\Users\mages\.gemini\antigravity\brain\0542399e-1da1-43ac-819f-3d80acdc46d3\.user_uploaded\media_1794387559795_85944f50.jpg"
if not exist "%VILLA_SRC%" set "VILLA_SRC=C:\Users\mages\.gemini\antigravity\brain\0542399e-1da1-43ac-819f-3d80acdc46d3\.user_uploaded\media_1794386961128_b723ab48.jpg"

if exist "%VILLA_SRC%" (
    copy /y "%VILLA_SRC%" "%~dp0assets\footer-villa-clean.jpg" >nul 2>nul
    copy /y "%VILLA_SRC%" "%~dp0assets\footer-villa-bg.jpg" >nul 2>nul
    copy /y "%VILLA_SRC%" "%~dp0assets\footer-reference.jpg" >nul 2>nul
    copy /y "%VILLA_SRC%" "%~dp0images\footer-villa-clean.jpg" >nul 2>nul
    copy /y "%VILLA_SRC%" "%~dp0images\footer-villa-bg.jpg" >nul 2>nul
    copy /y "%VILLA_SRC%" "%~dp0images\footer-reference.jpg" >nul 2>nul
    copy /y "%VILLA_SRC%" "%~dp0public\images\footer-villa-clean.jpg" >nul 2>nul
    copy /y "%VILLA_SRC%" "%~dp0public\images\footer-villa-bg.jpg" >nul 2>nul
    copy /y "%VILLA_SRC%" "%~dp0public\images\footer-reference.jpg" >nul 2>nul
)

:: Extract 180 outro frames if needed
if not exist "%~dp0assets\outro-frames\frame_180.jpg" (
    where ffmpeg >nul 2>nul
    if %ERRORLEVEL% equ 0 (
        echo Extracting 180 outro frames via ffmpeg...
        ffmpeg -y -i "%~dp0assets\ragav_builders_animated_outro_v2.mp4" -vf "fps=30,scale=1920:1080" -frames:v 180 -q:v 2 "%~dp0assets\outro-frames\frame_%%03d.jpg"
    ) else (
        where python >nul 2>nul
        if %ERRORLEVEL% equ 0 (
            echo Extracting 180 outro frames via Python...
            python "%~dp0extract_frames.py"
        ) else (
            where node >nul 2>nul
            if %ERRORLEVEL% equ 0 (
                echo Extracting 180 outro frames via Node...
                node "%~dp0extract_frames.js"
            )
        )
    )
)

echo Opening website in your default browser...
start "" "%~dp0index.html"

where python >nul 2>nul
if %ERRORLEVEL% equ 0 (
    echo Python server starting on http://localhost:8000
    python -m http.server 8000
    goto end
)

where npx >nul 2>nul
if %ERRORLEVEL% equ 0 (
    echo Node server starting on http://localhost:3000
    npx serve -l 3000
    goto end
)

:end
pause
