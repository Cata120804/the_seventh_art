#!/usr/bin/env bash
set -e  # Detiene la ejecución si algo falla

echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "🚀 Iniciando setup automático de la aplicación Spring Boot + MySQL"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
sleep 1

# ╔══════════════════════════════════════════════════════╗
# ║ 1️⃣  Cargar variables de entorno desde .env          ║
# ╚══════════════════════════════════════════════════════╝
#if [ -f .env ]; then
#  echo "🔧 Cargando variables desde .env..."
#  set -a
#  source .env
#  set +a
#else
#  echo "❌ No se encontró el archivo .env. Crea uno antes de continuar."
#  exit 1
#fi
#sleep 1

# ╔══════════════════════════════════════════════════════╗
# ║ 2️⃣  Levantar stack con Docker Compose               ║
# ╚══════════════════════════════════════════════════════╝
echo "🐳 Levantando contenedores con Docker Compose..."
if command -v docker compose >/dev/null 2>&1; then
  docker compose up -d --build --wait
else
  docker-compose up -d --build
fi
echo "✅ Contenedores en ejecución."
sleep 1

# ╔══════════════════════════════════════════════════════╗
# ║ 4️⃣  Información final                               ║
# ╚══════════════════════════════════════════════════════╝
echo "🎯 Todo listo. La aplicación está corriendo en:"
echo "👉 http://localhost:8080"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
