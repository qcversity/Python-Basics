@echo off
setlocal enabledelayedexpansion

REM Check if Python is installed

python --version 2>NUL

if %errorlevel%==0 (
    echo Python is already installed.
) else (
    echo Python is not installed.

    REM Check if Chocolatey (choco) is installed
    choco --version 2>NUL
    if %errorlevel%==0 (
        echo Chocolatey (choco) is already installed.
    ) else (
        echo Chocolatey (choco) is not installed. Installing Chocolatey...
        @"%SystemRoot%\System32\WindowsPowerShell\v1.0\powershell.exe" -NoProfile -InputFormat None -ExecutionPolicy Bypass -Command "[System.Net.ServicePointManager]::SecurityProtocol = 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))" && SET "PATH=%PATH%;%ALLUSERSPROFILE%\chocolatey\bin"
    )

    REM Use Chocolatey to install Python
    echo Installing Python using Chocolatey...
    choco install python -y
)

echo All done.
pause
