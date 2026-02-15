@echo off
title Revenue Guard - Local Server
cd /d "%~dp0"

echo.
echo ============================================
echo   Revenue Guard - Starting local server
echo ============================================
echo.

where node >nul 2>nul
if %ERRORLEVEL% neq 0 (
  echo ERROR: Node.js is not installed or not in PATH.
  echo Install from https://nodejs.org/ then try again.
  goto :end
)

if not exist "node_modules" (
  echo Installing dependencies first...
  call npm install
  if %ERRORLEVEL% neq 0 (
    echo ERROR: npm install failed.
    goto :end
  )
  echo.
)

echo Open in your browser: http://localhost:3001
echo.
echo Press Ctrl+C to stop the server.
echo --------------------------------------------
echo.

call npm run dev:3001
if %ERRORLEVEL% neq 0 (
  echo.
  echo Trying alternative start method...
  node node_modules\next\dist\bin\next dev -p 3001 -H 127.0.0.1
)

if %ERRORLEVEL% neq 0 (
  echo.
  echo --------------------------------------------
  echo If you see "EPERM" or "spawn" errors:
  echo   1. Close other terminals/Node windows.
  echo   2. Try running this .bat as Administrator.
  echo   3. Or move the project to C:\revenue-guard
  echo      and run start-server.bat from there.
  echo.
  echo If the page is blank: delete the .next folder,
  echo then run start-server.bat again.
  echo --------------------------------------------
)

:end
echo.
pause
