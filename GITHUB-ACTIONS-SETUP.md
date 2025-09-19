# 🤖 GitHub Actions Setup für APK-Erstellung

Da die automatische Workflow-Erstellung aufgrund von GitHub App-Berechtigungen nicht funktioniert, können Sie die GitHub Actions manuell einrichten:

## 📝 Schritt 1: Workflow-Datei manuell erstellen

1. **Gehen Sie zu Ihrem GitHub Repository**
2. **Klicken Sie auf "Actions" Tab**
3. **Klicken Sie auf "New workflow"**
4. **Wählen Sie "set up a workflow yourself"**

## 📋 Schritt 2: Workflow-Code einfügen

Ersetzen Sie den Inhalt der Datei mit folgendem Code:

```yaml
name: 📱 APK Erstellen

on:
  workflow_dispatch:
    inputs:
      version_name:
        description: 'Version Name (z.B. 1.0.0)'
        required: false
        default: '1.0.0'
        type: string

jobs:
  build-apk:
    name: 🔨 APK Build
    runs-on: ubuntu-latest
    
    steps:
    - name: 📥 Code Herunterladen
      uses: actions/checkout@v4
      
    - name: ☕ Java Setup
      uses: actions/setup-java@v4
      with:
        distribution: 'temurin'
        java-version: '17'
        
    - name: 📱 Android SDK Setup
      uses: android-actions/setup-android@v3
      with:
        api-level: 34
        build-tools: 34.0.0
        
    - name: 🟢 Node.js Setup
      uses: actions/setup-node@v4
      with:
        node-version: '20'
        cache: 'npm'
        
    - name: 📦 Dependencies Installieren
      run: npm ci
      
    - name: 🏗️ Web App Bauen
      run: npm run build
      
    - name: ⚡ Capacitor Sync
      run: npx cap sync android
      
    - name: 🔧 Gradlew Berechtigung
      run: chmod +x android/gradlew
      
    - name: 📱 APK Erstellen
      run: |
        cd android
        ./gradlew assembleDebug --no-daemon --stacktrace
        
    - name: ✅ APK Verifizieren
      run: |
        if [ -f android/app/build/outputs/apk/debug/app-debug.apk ]; then
          echo "✅ APK erfolgreich erstellt!"
          ls -lh android/app/build/outputs/apk/debug/app-debug.apk
        else
          echo "❌ APK Erstellung fehlgeschlagen!"
          exit 1
        fi
        
    - name: 📤 APK Hochladen
      uses: actions/upload-artifact@v4
      with:
        name: Infinite-Wiki-${{ github.event.inputs.version_name || '1.0.0' }}-debug.apk
        path: android/app/build/outputs/apk/debug/app-debug.apk
        retention-days: 30
        
    - name: 📊 Build Info
      run: |
        echo "## 🎉 APK Build Erfolgreich!" >> $GITHUB_STEP_SUMMARY
        echo "" >> $GITHUB_STEP_SUMMARY
        echo "**Version:** ${{ github.event.inputs.version_name || '1.0.0' }}" >> $GITHUB_STEP_SUMMARY
        echo "**Build Zeit:** $(date)" >> $GITHUB_STEP_SUMMARY
        echo "**APK Größe:** $(du -h android/app/build/outputs/apk/debug/app-debug.apk | cut -f1)" >> $GITHUB_STEP_SUMMARY
        echo "" >> $GITHUB_STEP_SUMMARY
        echo "Die APK-Datei wurde als Artifact hochgeladen. Sie können sie von der Actions-Seite herunterladen." >> $GITHUB_STEP_SUMMARY
```

## 💾 Schritt 3: Workflow speichern

1. **Dateiname**: `build-apk.yml`
2. **Klicken Sie auf "Commit changes"**
3. **Fügen Sie eine Commit-Nachricht hinzu**: "feat: APK Build Workflow hinzugefügt"
4. **Klicken Sie auf "Commit changes"**

## 🚀 Schritt 4: APK erstellen

1. **Gehen Sie zum "Actions" Tab**
2. **Wählen Sie "📱 APK Erstellen" Workflow**
3. **Klicken Sie auf "Run workflow"**
4. **Geben Sie optional eine Version ein** (z.B. 1.0.0)
5. **Klicken Sie auf "Run workflow"**

## 📥 Schritt 5: APK herunterladen

1. **Warten Sie, bis der Build abgeschlossen ist** (ca. 5-10 Minuten)
2. **Klicken Sie auf den abgeschlossenen Build**
3. **Scrollen Sie nach unten zu "Artifacts"**
4. **Laden Sie die APK-Datei herunter**

## 🎉 Fertig!

Nach diesen Schritten haben Sie:
- ✅ Einen funktionierenden APK-Build-Workflow
- ✅ Die Möglichkeit, APKs per Knopfdruck zu erstellen
- ✅ Automatische APK-Downloads als GitHub Artifacts

Die APK enthält:
- 📱 Vollständige Offline-Funktionalität
- 🤖 Gemini API Integration
- 🇩🇪 Deutsche Benutzeroberfläche
- 🎨 Alle UI-Komponenten und Styles