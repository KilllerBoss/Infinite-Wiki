@echo off
echo 🚀 Starte Infinite Wiki...
echo 📱 Die App wird als Progressive Web App (PWA) bereitgestellt
echo.

REM Prüfe ob Node.js verfügbar ist
node --version >nul 2>&1
if %errorlevel% neq 0 (
    echo ❌ Node.js ist nicht installiert. Bitte installieren Sie Node.js um die App zu starten.
    pause
    exit /b 1
)

echo 📦 Installiere Dependencies...
npm install

echo 🏗️ Baue die App...
npm run build

REM Kopiere PWA Dateien
copy sw.js dist\ >nul 2>&1
copy icon-*.png dist\ >nul 2>&1
copy manifest.json dist\ >nul 2>&1

echo.
echo 🌐 Starte lokalen Server auf Port 3000...
echo 📱 Öffnen Sie http://localhost:3000 in Ihrem Browser
echo 💾 Sie können die App auch als PWA installieren (Look for 'Install App' in your browser)
echo.
echo ⚡ Die App funktioniert vollständig offline nach der ersten Installation!
echo 🔄 Drücken Sie Ctrl+C zum Beenden
echo.

REM Starte einfachen HTTP-Server
npx serve -s dist -l 3000