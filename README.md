# 🏞️ TravelBlog App

A Flutter-based mobile application for discovering and exploring popular travel destinations, with travel tips, wishlist functionality, and Thai language support.

![Flutter](https://img.shields.io/badge/Flutter-3.0+-02569B?style=flat-square&logo=flutter&logoColor=white)
![Dart](https://img.shields.io/badge/Dart-2.19+-0175C2?style=flat-square&logo=dart&logoColor=white)
![Android](https://img.shields.io/badge/Android-5.0+-3DDC84?style=flat-square&logo=android&logoColor=white)

---

## 📋 Table of Contents

- [Features](#-features)
- [Requirements](#-requirements)
- [Installation](#-installation)
- [Building APK](#-building-apk)
- [Usage Guide](#-usage-guide)
- [Project Structure](#-project-structure)
- [Download APK](#-download-apk)

---

## ✨ Features

### 📱 Core Features
- ✅ Browse popular travel destinations
- ✅ Detailed information about each place
- ✅ Travel tips and recommendations
- ✅ Wishlist functionality to save favorite places
- ✅ Thai language interface
- ✅ Beautiful carousel slider for place images
- ✅ Responsive design for mobile devices

### 🎨 UI/UX
- ✅ Modern Material Design
- ✅ Custom Thai fonts (MN MINI)
- ✅ Splash screen
- ✅ Intuitive navigation
- ✅ Image galleries for destinations

---

## 💻 Requirements

| Item | Minimum Version |
|------|-----------------|
| Flutter SDK | 3.0 or higher |
| Dart SDK | 2.19 or higher |
| Android Studio | Latest stable |
| Android SDK | API 21+ (Android 5.0+) |
| Device | Android phone/tablet |

---

## 🚀 Installation

### Step 1: Install Flutter
Download and install [Flutter SDK](https://flutter.dev/docs/get-started/install)

### Step 2: Clone the Project
```bash
git clone https://github.com/pawit5001/TravelBlog.git
cd TravelBlog
```

### Step 3: Install Dependencies
```bash
flutter pub get
```

### Step 4: Run the App
```bash
flutter run
```

---

## 📱 Building APK

### For Development
```bash
flutter build apk --debug
```

### For Release
```bash
flutter build apk --release
```

The APK file will be generated in `build/app/outputs/flutter-apk/`

---

## 📖 Usage Guide

### Getting Started
1. Launch the app
2. Browse through popular destinations on the home screen
3. Tap on any place to view detailed information
4. Add places to your wishlist by tapping the heart icon
5. Access your wishlist from the menu
6. Use the help section for app guidance

### Navigation
- **Home**: Browse popular places
- **All Popular**: View all destinations
- **Wishlist**: Your saved places
- **Help**: App usage instructions
- **Info**: App information
- **Credits**: Developer credits

---

## 📁 Project Structure

```
TravelBlog/
├── android/                     # Android platform code
├── ios/                         # iOS platform code
├── lib/                         # Flutter source code
│   ├── core/                    # Core utilities
│   ├── data/                    # Data models and services
│   ├── page/                    # App pages/screens
│   │   ├── splash_page.dart     # Splash screen
│   │   ├── home_page.dart       # Home screen
│   │   ├── all_popular_page.dart # All places screen
│   │   ├── details_page.dart    # Place details
│   │   ├── wishlist_page.dart   # Wishlist screen
│   │   ├── help_page.dart       # Help screen
│   │   ├── info_page.dart       # Info screen
│   │   ├── credit_page.dart     # Credits screen
│   │   └── wishlist_provider.dart # State management
│   ├── widgets/                 # Reusable widgets
│   └── main.dart                # App entry point
├── assets/                      # Static assets
│   ├── images/                  # Place images
│   ├── icons/                   # App icons
│   └── fonts/                   # Custom fonts
├── test/                        # Unit tests
├── pubspec.yaml                 # Flutter dependencies
└── README.md                    # This file
```

---

## 📥 Download APK

Download the latest APK for Android devices:

[![Download APK](https://img.shields.io/badge/Download-APK-blue?style=for-the-badge&logo=android)](https://www.mediafire.com/file/v2oec2xoyqh92op/TravelBlog.apk/file)

**Note**: Make sure to enable "Install from unknown sources" in your Android settings before installing.

---

## 🔧 Troubleshooting

### ❌ Flutter not recognized
- Ensure Flutter is added to your system PATH
- Run `flutter doctor` to check installation

### ❌ Build fails
- Run `flutter clean` then `flutter pub get`
- Check Android SDK installation
- Ensure minimum SDK version is met

### ❌ Images not loading
- Verify `assets/images/` folder exists
- Check pubspec.yaml asset declarations

---

## 👥 Developer

- **Project Name**: TravelBlog
- **GitHub**: [pawit5001/TravelBlog](https://github.com/pawit5001/TravelBlog)

---

## 📄 License

MIT License - Free to use and modify
