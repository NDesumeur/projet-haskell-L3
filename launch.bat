@echo off
setlocal enabledelayedexpansion

set GHC=ghc
set SRC=main.hs
set TARGET=main
set OUTDIR=load

:: Collecte des fichiers source dans epreuve\
set EPREUVE_SRC=
for %%f in (epreuve\*.hs) do (
    set EPREUVE_SRC=!EPREUVE_SRC! %%f
)

:: Commande par défaut : all
if "%1"=="" goto all
if "%1"=="all" goto all
if "%1"=="compil" goto compil
if "%1"=="run" goto run
if "%1"=="clean" goto clean

echo Cible inconnue : %1
exit /b 1

:all
call :clean
call :compil
call :run
goto :eof

:compil
if not exist "%OUTDIR%" (
    mkdir "%OUTDIR%"
    echo Dossier 'load' cree
)
%GHC% %SRC% %EPREUVE_SRC% -o %OUTDIR%\%TARGET% -outputdir %OUTDIR%
goto :eof

:run
if not exist "%OUTDIR%\%TARGET%.exe" (
    echo Executable introuvable. Lancez d'abord la compilation.
    exit /b 1
)
%OUTDIR%\%TARGET%.exe
goto :eof

:clean
if exist "%OUTDIR%" (
    rmdir /s /q "%OUTDIR%"
)
goto :eof