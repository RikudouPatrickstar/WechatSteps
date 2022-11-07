@echo off

set WORK_DIR=%~dp0
set LOG_FILE=%WORK_DIR%/data/log

cd %WORK_DIR% || exit
python --version >nul 2>nul
if %ERRORLEVEL% == 1 (
    echo Python 环境未安装
    exit /b 1
)
if not exist %LOG_FILE% (
    python -m pip install -r requirements.txt
)
python wechat_steps.py >> %LOG_FILE%
