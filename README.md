# K3VO Platform Client

**Cross-platform Flutter app for domain management and trust insights, built for KeNIC's Hack-A-Milli competition.**

## 🏆 Built for: KeNIC Hack-A-Milli 2025

<p align="center">
  <img src="./docs/Hack-a-Milli-Poster-3-A2-1589x2048.jpg" alt="Hack-A-Milli Poster" width="400"/>
</p>

This project was submitted as part of the [KeNIC Hack-A-Milli Competition](https://hack-a-milli.kenic.or.ke/), an innovation challenge focused on Kenya’s digital future through open technology, transparency, and public services.

---

## 🧩 Overview

K3VO is a mobile and web Flutter application designed to:

- Perform real-time WHOIS lookups
- Display domain trust indicators
- Show licensed KeNIC registrars and their details
- Empower users to make safe, informed domain decisions

This client interfaces with the [`k3vo-platform`](https://github.com/kevinomyonga/k3vo-platform) Go + Next.js backend API.

---

## 🚀 Features

✅ WHOIS data lookup  
✅ Domain reputation & trust signals  
✅ View KeNIC-accredited registrars  
✅ Mobile and web support via Flutter  
✅ Optimized for Hack-A-Milli 2025 judging

---

## 📦 Directory Structure

```
.
├── apps/             # Flutter apps (web, mobile)
├── packages/         # Shared modules/widgets
├── scripts/          # Automation or setup scripts
├── docs/             # Poster and documentation assets
├── pubspec.yaml
└── melos.yaml        # Monorepo config
```

---

## 🛠️ Getting Started

```bash
# Install dependencies
flutter pub get

# Run on mobile
flutter run

# Run for web
flutter run -d chrome
```

If using `melos`:

```bash
melos bootstrap
```

---

## 📝 License

This project is licensed under the **Apache 2.0 License**.  
See [`LICENSE`](./LICENSE) for more details.
