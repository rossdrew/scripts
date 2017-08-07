
@ECHO OFF

::Get our own MAC address, need to search for one of two...
::Find Options: "Local Area Connection" || "Wi-Fi"
FOR /F "usebackq tokens=3 delims=," %%a IN (`getmac /fo csv /v ^| find "Wi-Fi"`) DO SET MAC=%%~a

ECHO ####### Roxoft MAC Renamer v0.1 (%MAC%) #######

SETLOCAL ENABLEDELAYEDEXPANSION

::Get the filename argument
IF "%~1"=="" GOTO :EOF
SET "filename=%~1"

::Start to process the file
SET fcount=0
SET linenum=0
FOR /F "usebackq tokens=1-10 delims=," %%a IN ("%filename%") DO ^
CALL :process "%%a" "%%b" "%%c" "%%d" "%%e" "%%f" "%%g" "%%h" "%%i" "%%j"
GOTO :EOF

:trim
SET "tmp=%~1"
:trimlead
IF NOT "%tmp:~0,1%"==" " GOTO :EOF
SET "tmp=%tmp:~1%"
GOTO trimlead

::Process a line in the file
:process
SET /A linenum+=1
IF "%linenum%"=="1" GOTO picknames
::If it's not the header line...
SET index=0
:perform-action
IF "%fcount%"=="%index%" (ECHO.&GOTO :EOF)
SET /A index+=1
CALL :trim %1
SETLOCAL ENABLEDELAYEDEXPANSION
::Outputs the currently searched key-value pair
ECHO !f%index%! = !tmp!
::This is the actual compare of MAC address and execution of a command based on it
::This needs to use the name, not the max address
IF %MAC% == !tmp! (ECHO Running 'compname /c !tmp!') 
ENDLOCAL
SHIFT
GOTO perform-action

::Extract the header names
:picknames
IF %1=="" GOTO :EOF
CALL :trim %1
SET /a fcount+=1
SET "f%fcount%=%tmp%"
SHIFT
GOTO picknames
