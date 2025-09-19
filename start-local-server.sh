#!/bin/bash

# Infinite Wiki - Lokaler Server Starter
# Dieses Script startet die App lokal für die Offline-Nutzung

echo "🚀 Starte Infinite Wiki..."
echo "📱 Die App wird als Progressive Web App (PWA) bereitgestellt"
echo ""

# Prüfe ob Node.js verfügbar ist
if ! command -v node &> /dev/null; then
    echo "❌ Node.js ist nicht installiert. Bitte installieren Sie Node.js um die App zu starten."
    exit 1
fi

# Wechsel ins Projektverzeichnis
cd "$(dirname "$0")"

echo "📦 Installiere Dependencies..."
npm install

echo "🏗️ Baue die App..."
npm run build

# Kopiere PWA Dateien
cp sw.js dist/
cp icon-*.png dist/ 2>/dev/null || true
cp manifest.json dist/

echo ""
echo "🌐 Starte lokalen Server auf Port 3000..."
echo "📱 Öffnen Sie http://localhost:3000 in Ihrem Browser"
echo "💾 Sie können die App auch als PWA installieren (Look for 'Install App' in your browser)"
echo ""
echo "⚡ Die App funktioniert vollständig offline nach der ersten Installation!"
echo "🔄 Drücken Sie Ctrl+C zum Beenden"
echo ""

# Starte einfachen HTTP-Server
npx serve -s dist -l 3000