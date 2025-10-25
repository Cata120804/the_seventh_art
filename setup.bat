@echo off
chcp 65001 >nul

REM ╔══════════════════════════════════════════════════════╗
REM ║ 1️⃣  Cargar variables desde .env                     ║
REM ╚══════════════════════════════════════════════════════╝
if exist ".env" (
    for /f "usebackq tokens=1,2 delims==" %%A in (".env") do (
        if "%%A" equ "HOST_PORT" set HOST_PORT=%%B
    )
)



echo ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
echo 🚀 Iniciando setup automático de la aplicación Spring Boot + MySQL
echo ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
timeout /t 1 >nul

REM ╔══════════════════════════════════════════════════════╗
REM ║ 2️⃣  Levantar stack con Docker Compose               ║
REM ╚══════════════════════════════════════════════════════╝
where docker >nul 2>nul || (echo ❌ Docker no está disponible. Instálalo o agrégalo al PATH. & exit /b 1)
echo 🐳 Levantando contenedores con Docker Compose...
docker compose up -d --build --wait 2>nul || docker-compose up -d --build
echo ✅ Contenedores en ejecución.
timeout /t 1 >nul

REM ╔══════════════════════════════════════════════════════╗
REM ║ 4️⃣  Información final                               ║
REM ╚══════════════════════════════════════════════════════╝
echo 🎯 Todo listo. La aplicación está corriendo en:
echo 👉 http://localhost:%HOST_PORT%
echo ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
pause