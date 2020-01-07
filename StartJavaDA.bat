@ECHO OFF
@title DaExecutive (Java Data Adapter)
REM
REM Many of the environental settings below were/are intended as aids in the debugging
REM process and should be commented out for production. Although there are probably
REM other variables that could be used when running the AppHM Application (in either
REM test or production mode), the variables below are among the most common.
REM
REM set FBNOANNOUNCEMENTS=true
REM set FBDISKDRIVE=F

if "%FBHOME%"=="" (set FBHOME=C:\FB20)
if "%SSDHOME%"=="" (set SSDHOME=D:\FB20)

REM change directory to folder where this batch file is located 
cd %~dp0

REM Start Java Data Adapter
java -jar DaExecutive.jar

exit