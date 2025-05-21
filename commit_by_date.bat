@echo off
setlocal EnableDelayedExpansion

for %%F in (*) do (
  for /f "tokens=1-4 delims=/ " %%a in ("%%~tF") do (
    set file_date=%%c-%%a-%%bT12:00:00
    echo Committing %%F with date !file_date!
    git add "%%F"
    set GIT_AUTHOR_DATE=!file_date!
    set GIT_COMMITTER_DATE=!file_date!
    git commit -m "Added %%F"
  )
)

endlocal
