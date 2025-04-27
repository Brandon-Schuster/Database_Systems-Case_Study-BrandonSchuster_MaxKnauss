@echo off
:: Prompt for Admin Rights
:: If not admin, relaunch as admin
fltmc >nul 2>&1 || (
    echo Requesting administrator privileges...
    powershell -Command "Start-Process '%~f0' -Verb runAs"
    exit /b
)

echo Initializing MyMobile Database...

:: Prompt for MySQL credentials
set /p MYSQL_USER=Enter MySQL username: 
set /p MYSQL_PASSWORD=Enter MySQL password: 
set MYSQL_DATABASE=mydb
set MYSQL_PATH="C:\Program Files\MySQL\MySQL Server 8.0\bin\mysql.exe"

:: Set working directory to this batch file's location
cd /d "%~dp0"

:: Step 1: Run setup.sql (create schema and tables)
echo Running setup.sql...
%MYSQL_PATH% -u %MYSQL_USER% -p%MYSQL_PASSWORD% < setup.sql

:: Step 2: Run data_population.sql (insert dummy data)
echo Running data_population.sql...
%MYSQL_PATH% -u %MYSQL_USER% -p%MYSQL_PASSWORD% %MYSQL_DATABASE% < data_population.sql

:: Step 3: Run queries.sql (test database with queries)
echo Running queries.sql...
%MYSQL_PATH% -u %MYSQL_USER% -p%MYSQL_PASSWORD% %MYSQL_DATABASE% < queries.sql

echo Database setup and test complete!
pause
