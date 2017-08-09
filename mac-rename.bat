@ECHO OFF

::Get our own MAC address, need to search for one of two...
::Find Options: "Local Area Connection" || "Wi-Fi"
FOR /F "usebackq tokens=3 delims=," %%a IN (`getmac /fo csv /v ^| find "Wi-Fi"`) DO ^
SET MAC=%%~a

ECHO ####### Roxoft MAC PC Rename v1.0 ['%MAC%'] #######

ECHO Local MAC : %MAC%

::Get the filename argument
IF "%~1"=="" GOTO :EOF
SET "filename=%~1"
FOR /F "tokens=* delims= " %%a IN ('%filename%') DO SET "filename=%%a"

ECHO Definition File : %filename%

::For each line in the file (skipping the header)
FOR /F "usebackq tokens=1-2 skip=1 delims=," %%a IN ("%filename%") DO ^
CALL :process-line "%%a" "%%b" 
GOTO EOF

::Process a line of the file
:process-line
::If this line matches our MAC, we're in business
IF %1 == "%MAC%" (
	ECHO  - %1 found in definitions, setting Computername to %2
	::This is where the actual command goes.  (%1 is MAC entry in file, %2 is Name, %MAC% is the local MAC Address)
	ECHO Run the command...
	::Example command
	::ECHO  - %1 found in definitions, setting Computername to %2
	::ECHO+
	::WMIC computersystem where caption="%computername%" call rename name='%2'
	::ECHO+
	::ECHO This PC WIll restart in 15 seconds
	::timeout /t 15
	::shutdown /r /t 0
)
	
::Exit point
:EOF