# SipNudge Machine Task - Hydration Analysis Dashboard

This project is a Flutter-based hydration tracking application developed as part of a technical machine task. It features a comprehensive analysis dashboard that visualizes hydration data using various interactive charts and adheres to clean architecture principles.

## 📋 Task Overview

The primary objective was to build a visually appealing and functional **Hydration Analysis Screen**. Key requirements included:
- Visualizing daily hydration data (Water vs. Food intake).
- Interactive charts (Line, Bar, and Donut/Pie charts).
- Time-based filtering (Weekly, Monthly, Yearly).
- Smooth state management for seamless user experience.
- Adherence to specific design guidelines (Colors, Typography).

## ✨ Features

- **Interactive Charts**:
  - **Line Chart**: Shows hydration trends over time with custom tooltips and touch interactions.
  - **Bar Chart**: Alternative view for daily intake comparison.
  - **Donut Chart**: Visualizes the breakdown of Water vs. Food intake source.
- **Data Filtering**:
  - Toggle between **Weekly**, **Monthly**, and **Yearly** views.
  - Navigate through time intervals (Previous/Next).
  - Dynamic axis labels adjusting to the selected time range.
- **Smart State Management**:
  - Powered by `flutter_bloc` (Cubits) for efficient state handling.
  - Separation of concerns: Logic (`AnalysisCubit`), State (`AnalysisState`), and UI.
- **Dynamic Theming**:
  - Centralized **AppTheme** utilizing `google_fonts` (Urbanist).
  - Custom **AppColors** palette for consistent branding.
  - Dark mode optimized with gradient backgrounds.

## 🛠️ Tech Stack & Packages Used

The project is built with **Flutter** and leverages the following key packages:

| Package | Purpose |
| :--- | :--- |
| **[flutter_bloc](https://pub.dev/packages/flutter_bloc)** | State management using the BLoC/Cubit pattern for predictable state changes. |
| **[fl_chart](https://pub.dev/packages/fl_chart)** | Rendering high-performance, interactive Line, Bar, and Pie charts. |
| **[google_fonts](https://pub.dev/packages/google_fonts)** | Implementing the 'Urbanist' font family directly from Google Fonts. |
| **[equatable](https://pub.dev/packages/equatable)** | (Implicitly used/Best Practice) For value equality comparisons in state objects. |

## 📂 Project Structure

The project follows a scalable folder structure to ensure maintainability:

```plaintext
lib/
├── core/
│   ├── theme/           # AppTheme, AppColors, AppTypography
│   └── utils/           # Helper functions (ChartUtils, DateFormatter)
├── cubit/               # Business Logic components (Cubits & States)
├── data/                # Data generation and mock sources
├── models/              # Data models (DailyHydrationData)
├── screens/             # UI Screens (AnalysisScreen, HomeScreen)
└── widgets/             # Reusable UI components (Charts, Cards, Navigation)
```

## 🚀 Getting Started

1.  **Clone the repository**:
    ```bash
    git clone <repository-url>
    ```
2.  **Install dependencies**:
    ```bash
    flutter pub get
    ```
3.  **Run the app**:
    ```bash
    flutter run
    ```
