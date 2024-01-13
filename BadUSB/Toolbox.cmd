@echo off
title BadUSB
echo.
echo Loading...
chcp 65001 >nul & rem UniCode darstellen

for /f "delims=;" %%. in ('"prompt $H; & for %%. in (nul) do call"') do (set "bkspc=%%.")

set "ASCII176=░"
set "ASCII177=▒"
set "ASCII178=▓"
set "ASCII219=█"
set "ASCII220=▄"
set "ASCII223=▀"

for %%a in (%ASCII178%) do (
    for /l %%b in (1,1,10) do (
        <nul set /p "=%%a"||ver>nul
        timeout 1 >nul
    )
    echo:
    echo:
)

@echo off
setlocal enabledelayedexpansion
set "scriptFolder=scripts/Windows"
set "counter=0"
cd %scriptFolder%
echo Durchsuche den Ordner %scriptFolder% nach Skripten...
echo Liste der verfügbaren Dateien:
echo -----------------------------

for %%f in (*.vbs *.bat) do (
    set /a "counter+=1"
    echo !counter!. %%f
    set "file[!counter!]=%%f"
)

echo -----------------------------
set /p "choice=Bitte geben Sie die Nummer der auszuführenden Datei ein: "

if not defined file[%choice%] (
    echo Ungültige Auswahl. Das Skript wird beendet.
    goto :eof
)

set "selectedFile=!file[%choice%]!"
echo Ausführen von: %selectedFile%
start %selectedFile%
echo Ausführung abgeschlossen.
endlocal
