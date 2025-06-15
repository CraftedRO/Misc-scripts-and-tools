@echo off
REM Set the working directory path
set current_folder="D:\xampp\mysql\bin"

REM Set the output folder name
set output_folder=backup

REM Create the folder if it doesn't exist, if exist we delete it
if exist "%current_folder%\%output_folder%" @RD /S /Q "%current_folder%\%output_folder%"
if not exist "%current_folder%\%output_folder%" mkdir "%current_folder%\%output_folder%"

REM Set the username and password
set username="yourusernamehere"
set password="yourpasswordhere"

REM Define the list of databases to export
REM The -r option is a shorthand for --result-file. It tells mysqldump to write the output directly to the specified file rather than printing it to standard output.
REM This can be especially useful on systems (like Windows) where redirection using “>” might behave differently regarding encoding.
set DBS=database_name_1 database_name_2 database_name_3 database_name_4
cd /d %current_folder%
for %%D in (%DBS%) do (
    echo Exporting database %%D...
    mysqldump -u %username% -p%password% "%%D" -r "%output_folder%\%%D.sql"
)

echo All databases exported.

REM Optional: we open generated backup folder
start  "" "%current_folder%\%output_folder%"

pause
