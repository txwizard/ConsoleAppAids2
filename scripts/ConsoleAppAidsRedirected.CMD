@echo off
goto SKIPREM

::  ============================================================================
::
::  Script Name:        ConsoleAppAidsRedirected.CMD
::
::  Script Synopsis:    Run the ConsoleAppAids test stand with output redirected
::                      to a file.
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
::  2015/11/14 DAG Initial implementation created, tested, and deployed.
::  2016/06/09 DAG Add support for running individual tests.
::  ============================================================================


:SKIPREM

    echo BOJ %~0, version %~t0
    echo.
    echo Script Directory = %~dp0
    setlocal
    pushd %~dp0
    cd ..\NOTES\Test_Data

    if exist %~n0.LOG (
        echo Preserving the existing %~n0.LOG.
        echo.
        Date2FN.EXE -r %~n0.LOG
        echo.
    ) else (
        echo There is no %~n0.LOG.
        echo.
    )

    echo.
    echo -------------------------------------

    if "%2" equ "" (
        echo All tests will execute.
    ) else (
        echo Only test %2 will execute.
    )

    echo -------------------------------------
    echo.

    if "%1" equ "" (
        set TestPgm=..\..\TestStand\bin\Debug\TestStand.exe
    ) else (
        if /i "%1" equ "r" (
            set TestPgm=..\..\TestStand\bin\Release\TestStand.exe
        ) else (
            if /i "%1" equ "rel" (
                set TestPgm=..\..\TestStand\bin\Release\TestStand.exe
            ) else (
                if /i "%1" equ "release" (
                    set TestPgm=..\..\TestStand\bin\Release\TestStand.exe
                ) else (
                    set TestPgm=..\..\TestStand\bin\Debug\TestStand.exe
                )
            )
        )
    )

    echo.
    echo Working Directory = %CD%
    echo Test Program      = %TestPgm%
    call ShowTime.CMD

    if "%2" equ "" (
        %TestPgm%      > %~n0.LOG
    ) else (
        %TestPgm% -t%2 > %~n0.LOG
    )

    call ShowTime.CMD
    echo.
    echo %~nx0 Done
    WWPause.EXE
