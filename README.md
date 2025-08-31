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

The client communicates with the [`k3vo-platform`](https://api.k3vo.me.ke:8080/swagger/) backend (Go + Next.js API).

---

## 🚀 Key Features

- ✅ WHOIS data lookup  
- ✅ Domain reputation & trust signals  
- ✅ View KeNIC-accredited registrars  
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
- Android Studio or VS Code  

### Setup

```bash
# Install dependencies
flutter pub get

# Run mobile app
flutter run

# Run web app
flutter run -d chrome
```

### Using Melos

```bash
melos bootstrap
```

### APK

The latest Android APK is available in:  
`apps/k3vo-app/releases/K3VO.apk`

---

## 📝 License

This project is licensed under the **Apache 2.0 License**.  
See [`LICENSE`](./LICENSE) for details.
