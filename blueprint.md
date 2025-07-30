# Application Blueprint

## Overview

This document outlines the key design and architectural features of the application, providing a comprehensive guide to its structure, styling, and functionality. It serves as a living document that will be updated with each new feature or modification.

## Current Implementation (v1)

### 1. **Project Structure**
- **`lib/main.dart`**: Main application entry point.
- **`lib/splash_screen.dart`**: Initial screen displayed on app launch.
- **`lib/auth_wrapper.dart`**: Handles authentication state and navigates to the appropriate screen (login or home).
- **`lib/loginPage.dart`**: User login screen.
- **`lib/registrasiUser.dart`**: User registration screen.
- **`lib/forgotPassword.dart`**: Password recovery screen.
- **`lib/changePassword.dart`**: Screen for changing the user's password.
- **`lib/homeScreenPage.dart`**: The primary home screen of the application.
- **`lib/bottom_nav_screen.dart`**: Manages the bottom navigation bar and its associated screens.
- **`lib/profilePage.dart`**: User profile screen.
- **`lib/api_service.dart`**: Service for handling API requests.
- **`lib/auth_provider.dart`**: Manages user authentication state.
- **`lib/secure_storage_service.dart`**: Service for secure data storage.

### 2. **Design and Styling**
- **UI Components**: The UI is built with modern components, including a search bar, discount banners, product cards, and interactive icons.
- **Icons**: SVG icons are used throughout the application for a clean and scalable look. The `flutter_svg` package is used to render these icons.
- **Layout**: The layout is designed to be responsive and visually balanced, with clean spacing and a modern aesthetic.
- **Navigation**: The app uses a bottom navigation bar for easy access to the main sections (Home, Favorites, Cart, Profile).

### 3. **Features**
- **User Authentication**: The application includes a complete authentication flow with screens for login, registration, password recovery, and password changes.
- **Home Screen**:
  - **Dynamic Content**: The home screen features dynamic sections, including special offers and popular products, to provide fresh and relevant content to the user.
  - **Interactive Search**: A search bar is prominently displayed at the top of the home screen, allowing users to quickly find products.
  - **Categorized Navigation**: Categories are displayed with icons, providing a visual and intuitive way for users to browse different product types.
- **Bottom Navigation**: A persistent bottom navigation bar allows for seamless switching between the main sections of the app.

## Current Task: Integrating the New Home Screen UI and Error Rectification

### Plan and Steps:
1. **Add `flutter_svg` Dependency**: Added the `flutter_svg` package to `pubspec.yaml` to support the use of SVG icons in the new UI.
2. **Update Home Screen**: Replaced the content of `lib/homeScreenPage.dart` with the new UI code, ensuring the main widget is named `HomeScreen` (was `HomeScreenPage`).
3. **Correct Bottom Navigation**: Fixed the `lib/bottom_nav_screen.dart` file:
    - Corrected the typo `omeScreenPage` to `HomeScreen`.
    - Removed the unnecessary `title` parameter from `HomeScreen()` constructor.
    - Ensured `Auth.error` was corrected to `AuthStatus.error`.
    - Re-created the `lib/bottom_nav_screen.dart` file as it was not found previously.
4. **Create/Update `blueprint.md`**: This document has been updated to log the project's current state and the changes made during this task.
