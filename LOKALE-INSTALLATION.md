# 🚀 Infinite Wiki - Lokale Installation

Diese Anleitung hilft Ihnen dabei, Infinite Wiki lokal auf Ihrem Computer zu installieren und offline zu nutzen.

## 📱 Was ist das?

Infinite Wiki ist eine Progressive Web App (PWA), die:
- ✅ **Vollständig offline funktioniert** nach der ersten Installation
- ✅ **Direkt Zugriff auf Gemini API** hat (API-Key ist bereits eingebettet)
- ✅ **Wie eine native App** installiert werden kann
- ✅ **Auf allen Geräten** funktioniert (Windows, Mac, Linux, Android, iOS)

## 🎯 Schnellstart

### Option 1: Automatischer Start (Empfohlen)

#### Windows:
1. Doppelklick auf `start-local-server.bat`
2. Warten bis "Server gestartet" angezeigt wird
3. Browser öffnet sich automatisch mit der App

#### Linux/Mac:
```bash
./start-local-server.sh
```

### Option 2: Manuelle Installation

1. **Node.js installieren** (falls nicht vorhanden):
   - Download: https://nodejs.org/
   - Version 18+ empfohlen

2. **Dependencies installieren**:
   ```bash
   npm install
   ```

3. **App bauen**:
   ```bash
   npm run build
   ```

4. **PWA Dateien kopieren**:
   ```bash
   cp sw.js dist/
   cp icon-*.png dist/
   cp manifest.json dist/
   ```

5. **Lokalen Server starten**:
   ```bash
   npx serve -s dist -l 3000
   ```

## 📱 Als App installieren

### Desktop (Chrome/Edge/Firefox):
1. Öffne http://localhost:3000
2. Schaue nach dem "App installieren" Button in der Adressleiste
3. Klicke auf "Installieren"
4. Die App wird wie eine normale Desktop-App installiert

### Mobile (Android/iOS):
1. Öffne http://localhost:3000 in Chrome (Android) oder Safari (iOS)
2. Tippe auf "Teilen" → "Zum Startbildschirm hinzufügen"
3. Die App erscheint als Icon auf Ihrem Homescreen

## 🔧 Features nach Installation

### ✅ Offline-Funktionalität
- Die App funktioniert komplett ohne Internetverbindung
- Alle Grundfunktionen sind verfügbar
- **Nur für Gemini API wird Internet benötigt**

### ✅ Native App-Erfahrung
- Startet wie eine normale App
- Kein Browser-Interface
- Vollbild-Modus
- Desktop-Shortcuts

### ✅ Plattform-übergreifend
- Windows: Als Desktop-App
- macOS: Als Desktop-App  
- Linux: Als Desktop-App
- Android: Als native App
- iOS: Als Web-App

## 🎮 Nutzung

1. **Öffne die installierte App**
2. **Gib einen Begriff ein** oder nutze "Random"
3. **Klicke auf Wörter** im Text um neue Artikel zu öffnen
4. **Genieße unbegrenztes Wissen** powered by Gemini AI

## 🔑 API-Konfiguration

Der Gemini API-Key ist bereits in der App eingebettet und funktioniert sofort. Keine weitere Konfiguration erforderlich.

## 🆘 Problemlösung

### "Node.js not found"
- Installieren Sie Node.js von https://nodejs.org/

### "Port 3000 already in use"
- Ändern Sie den Port im Script zu einem anderen (z.B. 3001):
  ```bash
  npx serve -s dist -l 3001
  ```

### App lädt nicht
- Prüfen Sie die Firewall-Einstellungen
- Stellen Sie sicher, dass localhost:3000 erreichbar ist

### API funktioniert nicht
- Überprüfen Sie Ihre Internetverbindung
- Der Gemini API-Key ist eingebettet, keine Konfiguration nötig

## 🚀 Erweiterte Nutzung

### Andere Geräte im Netzwerk
Um die App von anderen Geräten zu nutzen:
```bash
npx serve -s dist -l 3000 --host 0.0.0.0
```
Dann öffnen Sie `http://[IHR-COMPUTER-IP]:3000` auf anderen Geräten.

### Als Systemdienst (Linux)
Für permanenten Betrieb können Sie einen systemd-Service erstellen.

## 💡 Tipps

- **Bookmark**: Speichern Sie http://localhost:3000 als Lesezeichen
- **Mehrere Instanzen**: Sie können mehrere Kopien auf verschiedenen Ports laufen lassen
- **Updates**: Für Updates einfach den Code neu bauen und neu installieren

## 📞 Support

Bei Problemen prüfen Sie:
1. Node.js ist installiert (`node --version`)
2. Port 3000 ist frei 
3. Internet für API-Zugriff verfügbar
4. Browser unterstützt PWAs (alle modernen Browser)

---

**🎉 Viel Spaß mit Ihrer lokalen Infinite Wiki Installation!**