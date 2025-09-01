# K3VO Platform Client

**Cross-platform Flutter app for domain management and trust insights, built for KeNIC Hack-A-Milli 2025.**

## 🏆 Built for: KeNIC Hack-A-Milli 2025

<p align="center">
  <img src="./docs/Hack-a-Milli-Poster-3-A2-1589x2048.jpg" alt="Hack-A-Milli Poster" width="400"/>
</p>

This project was submitted as part of the [KeNIC Hack-A-Milli Competition](https://hack-a-milli.kenic.or.ke/), an innovation challenge focused on Kenya’s digital future through open technology, transparency, and public services.

---

## 🧩 Overview

K3VO is a cross-platform Flutter application (mobile + web) that enables users to:

- Perform real-time WHOIS lookups  
- Display domain trust and reputation indicators  
- Show licensed KeNIC registrars and their details  
- Empower users to make safe, informed domain decisions

The project uses the domain `k3vo.me.ke` and its various features and services are split into:

- [`Backend API`](https://api.k3vo.me.ke:8080/swagger/) built with Go/Golang
- [`Frontend Web App`](https://app.k3vo.me.ke) built with Flutter
- [`Website`](https://k3vo.me.ke) built with Next.js

---

## 🚀 Key Features

- ✅ WHOIS data lookup  
- ✅ Domain availability check  
- ✅ Domain reputation & trust signals  
- ✅ View KeNIC-accredited registrars  
- ✅ AI-powered domain name suggestions 
- ✅ Domain management & registration support  
- ✅ Multi-language support: English, Swahili, French  
- ✅ Cross-platform: Mobile & Web  
- ✅ Optimized for Hack-A-Milli judging  

---

## 🎥 Demo Video

[![Watch the K3VO Demo](https://img.youtube.com/vi/MDw6e3F-EmA/0.jpg)](https://youtu.be/MDw6e3F-EmA)

---

## 📂 Repository Structure

```
.
├── apps/
│   ├── k3vo-app/    # Flutter mobile app
│   │   └── releases/  # APK files for Android
├── packages/          # Shared modules/widgets
├── scripts/           # Automation or setup scripts
├── docs/              # Poster, screenshots, documentation
├── pubspec.yaml
└── melos.yaml         # Monorepo configuration
```

---

## 🛠️ Getting Started

### Prerequisites

- Flutter SDK >=3.x  
- Dart >=3.x  
- Android Studio or VS Code (Preferred) 

### Setup

```bash
# Install dependencies
flutter pub get

# Install fvm
dart pub global activate fvm

# Install Flutter version
fvm install
```

### Using Melos

```bash
melos bootstrap
```

### Running the App

To run the app in VS Code, use the launch configuration specified in `.vscode/launch.json`.

You can run the app in different environments (mobile/web) by selecting the appropriate configuration, the desired device, and clicking the run button. Or by pressing `F5`.

### APK

The latest Android APK is available at this link on [Google Drive](https://drive.google.com/file/d/1nCsEGe4jg3vT8f__IOubLH3pYxboM6x4/view?usp=share_link) 

### Web

You can access the web version of the app at [https://app.k3vo.me.ke](https://app.k3vo.me.ke).

---

## 📝 License

This project is licensed under the **Apache 2.0 License**.  
See [`LICENSE`](./LICENSE) for details.
