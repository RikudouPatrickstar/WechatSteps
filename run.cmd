@echo off

set WORK_DIR=%~dp0
set LOG_FILE=%WORK_DIR%/data/log

cd %WORK_DIR% || exit
if not exist %LOG_FILE% (
    python -m pip install -r requirements.txt
)
python wechat_steps.py >> %LOG_FILE%
