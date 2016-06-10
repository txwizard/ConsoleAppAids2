@echo off
goto SKIPREM

::  ============================================================================
::
::  Script Name:        Activate_Regressions.CMD
::
::  Script Synopsis:    Activate the Regressions test set.
::
::  Remarks:            This script uses long established techniques to identify
::                      the directory from which a shell script was loaded that
::                      only recently came to my attention.
::
::  Script Author:      David A. Gray
::
::  ----------------------------------------------------------------------------
::  Revision History
::  ----------------------------------------------------------------------------
::
::  Date       By  Synopsis
:;  ---------- --- -------------------------------------------------------------
::  2014/03/22 DAG Initial implementation created, tested, and deployed.
::  ============================================================================


:SKIPREM

    echo %~0 Begin
    echo.
    echo Script Directory = %~dp0
    setlocal
    pushd %~dp0
    cd ..\NOTES\Test_Data

    echo.
    echo Working Directory = %CD%
    set TESTFILENAME=TimedWaitTests_Regression.TXT

    echo.
    echo Making %TESTFILENAME% the active test data set.


    if exist "%~dp0XcopyDestIsFile.TXT" goto CHK_REQ2

    echo.
    echo Response file XcopyDestIsFile.TXT is missing from
    echo script directory %~dp0.
    echo.
    echo This file is required for the script to operate correctly.

    goto DONE


:CHK_REQ2

    if exist %TESTFILENAME% goto FOUND_IT

    echo.
    echo     ERROR: %TESTFILENAME%
    echo            not found in test data directory.
    goto DONE


:FOUND_IT

    echo.
    echo.
    echo Activating %TESTFILENAME% 
    echo for use with the ConsoleAppAids test stand.
    echo.

    xcopy %TESTFILENAME% TimedWaitTests.TXT /f /k /r /v /y < "%~dp0XcopyDestIsFile.TXT"

    if ERRORLEVEL 5 goto COPY_ERR5
    if ERRORLEVEL 5 goto COPY_ERR4
    if ERRORLEVEL 5 goto COPY_ERR3
    if ERRORLEVEL 5 goto COPY_ERR2
    if ERRORLEVEL 5 goto COPY_ERR1

    fc    %TESTFILENAME% TimedWaitTests.TXT /b
    goto DONE


:COPY_ERR5

    echo.
    echo     ERROR: The XCOPY system utility reported a disk write error.
    echo            File copying failed.
    goto DONE


:COPY_ERR4

    echo.
    echo     ERROR: The XCOPY system utility reported an initialization error.
    echo            There is not enough memory or disk space, or you entered
    echo            an invalid drive name or invalid syntax on the command line.
    echo            File copying failed.
    goto DONE


:COPY_ERR2

    echo.
    echo     ERROR: The XCOPY system utility returned status code 3, which is
    echo            undocumented. File copying failed.
    goto DONE


:COPY_ERR2

    echo.
    echo     ERROR: The XCOPY system utility detected a CTRL-C to terminate the
    echo            task. File copying failed.
    goto DONE


COPY_ERR1

    echo.
    echo     ERROR: The XCOPY system utility found no files that matched the
    echo            source file specification. File copying failed.
    goto DONE


:DONE

    echo.
    echo %~fx0 Done
    echo.
    WWPause
