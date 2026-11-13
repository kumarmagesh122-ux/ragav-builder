@echo off
title Ragav Builders Prototype
cd /d "%~dp0"

if not exist "%~dp0RAGAV_BUILDERS_Scroll_Prototype\assets" mkdir "%~dp0RAGAV_BUILDERS_Scroll_Prototype\assets"

:: Synchronize uploaded official logo
if exist "C:\Users\mages\.gemini\antigravity\brain\0542399e-1da1-43ac-819f-3d80acdc46d3\.user_uploaded\media_1793705488943_ba74624f.jpg" (
    copy /y "C:\Users\mages\.gemini\antigravity\brain\0542399e-1da1-43ac-819f-3d80acdc46d3\.user_uploaded\media_1793705488943_ba74624f.jpg" "%~dp0RAGAV_BUILDERS_Scroll_Prototype\assets\ragav-builders-logo.jpg" >nul 2>nul
    copy /y "C:\Users\mages\.gemini\antigravity\brain\0542399e-1da1-43ac-819f-3d80acdc46d3\.user_uploaded\media_1793705488943_ba74624f.jpg" "%~dp0RAGAV_BUILDERS_Scroll_Prototype\assets\logo.jpg" >nul 2>nul
)

:: Synchronize newest clean background video
if exist "C:\Users\mages\.gemini\antigravity\brain\0542399e-1da1-43ac-819f-3d80acdc46d3\.user_uploaded\media_1793704973030_23b3c1e9.mp4" (
    copy /y "C:\Users\mages\.gemini\antigravity\brain\0542399e-1da1-43ac-819f-3d80acdc46d3\.user_uploaded\media_1793704973030_23b3c1e9.mp4" "%~dp0RAGAV_BUILDERS_Scroll_Prototype\assets\ragav-builders-cinematic.mp4" >nul 2>nul
    copy /y "C:\Users\mages\.gemini\antigravity\brain\0542399e-1da1-43ac-819f-3d80acdc46d3\.user_uploaded\media_1793704973030_23b3c1e9.mp4" "%~dp0RAGAV_BUILDERS_Scroll_Prototype\assets\RAGAV_BUILDERS_Cinematic_Clean_No_Audio.mp4" >nul 2>nul
)

cd /d "%~dp0RAGAV_BUILDERS_Scroll_Prototype"
call run.bat
