ECHO OFF
CLS
setlocal EnableDelayedExpansion 

REM Detect JVM Version
for /f tokens^=2-5^ delims^=.-_^" %%j in ('java -fullversion 2^>^&1') do set "jver=%%j%%k%%l%%m"

REM Detect JVM Runtime Architecture
java -version 2>&1 | find "64-Bit" >nul:
if errorlevel 1 (
    set jarch=32
) else (
    set jarch=64
)

Echo Java Version: %jver%
Echo JVM Runtime Architecture: %jarch% bit
Echo Java path: "%java_home%"

if %jver% LSS 18000 ( 
	Echo ERROR: Attempted to run software with Java Version %jver%. This software is only compatible with Java 8 Runtime enviroments. 
) else ( 
	Echo Java version %jver% is compatible with this software
	if "%tmp%"=="" ( 
		set temploc=C:/Temp
	) else ( 
		set temploc=%tmp%
	)
)
Echo Temp directory: %temploc%

if %jarch%==32 (
	set "Path=%temploc%\RTI_Native_Libs;%PATH%"
) else (
	set "Path=%temploc%\RTI_Native_Libs_64;%PATH%"
)

java -jar DaExecutive.jar %*