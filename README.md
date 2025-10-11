# Infrastructure Reporting App

[![Flutter Version](https://img.shields.io/badge/Flutter-3.x-blue.svg)](https://flutter.dev)

An open-source, cross-platform application built with Flutter, designed for efficient monitoring, reporting, and management of public infrastructure projects. This app provides a seamless interface for field officers and administrators to track project progress, manage assets, and ensure transparency.

## 🎯 About The Project

This application aims to solve the challenge of tracking decentralized infrastructure projects by providing a unified digital platform. It connects on-ground realities with central monitoring dashboards, enabling data-driven decisions and accountability. The hierarchical structure (State, District, Village) makes it ideal for governmental and public administration bodies in India.

---

## ✨ Core Features

* **🗺️ GIS Asset Tagging:** Map-based GIS tagging of infrastructure assets for precise location tracking and management.
* **📊 Real-time Project Tracking:** Monitor the status, progress, and milestones of multiple projects.
* **👤 Secure Authentication:** Role-based access for authorized personnel to ensure data security.
* **📈 Centralized Dashboard:** An intuitive dashboard presenting key performance indicators, project summaries, and alerts.
* **📍 Hierarchical Management:** Organize and filter data by State, District, and Village for granular oversight.
* **📝 On-Site Assessments:** A dedicated module for conducting field assessments and submitting reports with evidence.
* **💬 Integrated Feedback System:** A mechanism for citizens or field officers to submit feedback and grievances.

---

## 🛠️ Technology Stack

* **Framework:** [Flutter](https://flutter.dev/)
* **Language:** [Dart](https://dart.dev/)
* **State Management:** Riverpod, Provider, BLoC
* **Routing:** [GoRouter](https://pub.dev/packages/go_router) 
* **Backend:** Firebase, Supabase

---

## 🚀 Getting Started

To get a local copy up and running, follow these simple steps.

### Prerequisites

* **Flutter SDK:** Make sure you have the Flutter SDK installed. [Installation Guide](https://flutter.dev/docs/get-started/install)
* An IDE like **VS Code** or **Android Studio**.

### Installation & Setup

1.  **Clone the repository:**
    ```sh
    git clone [https://github.com/reeshavsinha/Infrastructure-Reporting-App.git](https://github.com/reeshavsinha/Infrastructure-Reporting-App.git)
    ```
2.  **Navigate to the project directory:**
    ```sh
    cd Infrastructure-Reporting-App
    ```
3.  **Install dependencies:**
    ```sh
    flutter pub get
    ```
4.  **Run the code generator (if using packages like GoRouter, Freezed, etc.):**
    ```sh
    dart run build_runner build --delete-conflicting-outputs
    ```
5.  **Run the app:**
    ```sh
    flutter run
    ```

---

## 📂 Project Structure

The project follows a feature-first architectural pattern to ensure scalability and maintainability.

```plaintext
lib/
├── core/               # Core services, models, theme, and router
├── features/           # All application features as separate modules
│   ├── auth/
│   ├── dashboard/
│   ├── gis/
│   ├── project_tracking/
│   └── village_management/
├── shared/             # Shared widgets and utilities used across features
└── main.dart           # The main entry point of the application
```

## 📧 Contact

Reeshav Sinha - reeshavsinhawork@gmail.com

Project Link: [https://github.com/reeshavsinha/Infrastructure-Reporting-App](https://github.com/reeshavsinha/Infrastructure-Reporting-App)
