# 📱 APK Erstellung für Infinite Wiki

Diese Anleitung erklärt, wie Sie eine lokale APK-Datei der Infinite Wiki App erstellen können.

## 🚀 Automatische APK-Erstellung (Empfohlen)

### Über GitHub Actions

1. **Gehen Sie zu GitHub Actions**:
   - Öffnen Sie Ihr Repository auf GitHub
   - Klicken Sie auf den Tab "Actions"

2. **Starten Sie die APK-Erstellung**:
   - Wählen Sie "📱 APK Erstellen" aus der Liste der Workflows
   - Klicken Sie auf "Run workflow"
   - Geben Sie optional eine Versionsnummer ein (z.B. 1.0.0)
   - Klicken Sie auf "Run workflow"

3. **APK herunterladen**:
   - Warten Sie, bis der Build abgeschlossen ist (ca. 5-10 Minuten)
   - Scrollen Sie nach unten zu "Artifacts"
   - Laden Sie die `Infinite-Wiki-X.X.X-debug.apk` Datei herunter

## 🏠 Lokale APK-Erstellung

### Voraussetzungen
- Node.js (Version 20+)
- Java JDK 17
- Android SDK (API Level 34)
- Git

### Schritt-für-Schritt Anleitung

1. **Repository klonen**:
   ```bash
   git clone <ihr-repository-url>
   cd infinite-wiki
   ```

2. **Dependencies installieren**:
   ```bash
   npm install
   ```

3. **Web-App bauen**:
   ```bash
   npm run build
   ```

4. **Capacitor synchronisieren**:
   ```bash
   npx cap sync android
   ```

5. **APK erstellen**:
   ```bash
   cd android
   ./gradlew assembleDebug
   ```

6. **APK finden**:
   Die APK-Datei befindet sich in:
   ```
   android/app/build/outputs/apk/debug/app-debug.apk
   ```

## 📋 Wichtige Hinweise

### ✅ Was ist enthalten:
- Vollständige Offline-Funktionalität
- Gemini API Integration (mit eingebettetem API-Key)
- Alle UI-Komponenten und Styles
- Deutsche Benutzeroberfläche

### ⚠️ Sicherheitshinweis:
Der Gemini API-Key ist direkt in die APK eingebettet. Für Produktionsumgebungen sollten Sie:
- Einen separaten API-Key verwenden
- Den Key über sichere Konfiguration laden
- Rate Limits implementieren

### 📱 Installation der APK:
1. **Android-Gerät vorbereiten**:
   - Einstellungen → Sicherheit → "Unbekannte Quellen" aktivieren
   
2. **APK installieren**:
   - APK-Datei auf das Gerät übertragen
   - Auf die Datei tippen und Installation bestätigen

3. **App verwenden**:
   - Die App funktioniert vollständig offline
   - API-Aufrufe erfordern Internetverbindung

## 🔧 Troubleshooting

### Build-Fehler:
- Stellen Sie sicher, dass alle Dependencies installiert sind
- Löschen Sie `node_modules` und führen Sie `npm install` erneut aus
- Überprüfen Sie die Java- und Android SDK-Installation

### APK-Installation Probleme:
- Aktivieren Sie "Installation aus unbekannten Quellen"
- Stellen Sie sicher, dass genügend Speicherplatz verfügbar ist
- Deinstallieren Sie eventuelle vorherige Versionen

### API-Probleme:
- Überprüfen Sie die Internetverbindung
- Der API-Key ist bereits konfiguriert und sollte funktionieren

## 📞 Support

Bei Problemen:
1. Überprüfen Sie die GitHub Actions Logs
2. Stellen Sie sicher, dass alle Voraussetzungen erfüllt sind
3. Öffnen Sie ein Issue im Repository

---

**Viel Erfolg mit Ihrer Infinite Wiki APK! 🎉**