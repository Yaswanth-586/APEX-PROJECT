# DIGI-NOTES

A production-quality Flutter app for digital notes and study materials, designed to help students access comprehensive study resources including notes, important questions, previous year papers, and formulas.

## 🚀 Features

- **9 Complete Screens**: Splash, Login, Signup, Home, Year Selection, Subjects, Settings, Edit Profile, and Change Password
- **Material 3 Design**: Modern UI with custom theme, rounded corners, and shadows
- **State Management**: Flutter Riverpod for efficient state management
- **Navigation**: Go Router with typed routes and parameters
- **Data Persistence**: Shared Preferences for local storage
- **Responsive Design**: Optimized for various phone sizes
- **Accessibility**: Proper semantics and sufficient contrast ratios

## 📱 Screens

1. **Splash Screen** - App introduction with animated logo
2. **Login Page** - Email and password authentication
3. **Sign Up Page** - User registration with validation
4. **Home Page** - Stream selection (Intermediate, B.Tech, Degree)
5. **Year Page** - Semester grid (SEM1-SEM8)
6. **Subjects Page** - Subject cards with study material links
7. **Settings Page** - App preferences and account management
8. **Edit Profile Page** - Update user information
9. **Change Password Page** - Secure password management

## 🏗️ Architecture

The app follows a clean MVVM architecture with the following structure:

```
lib/
├── core/                    # Core functionality
│   ├── constants/          # App constants and configuration
│   ├── providers/          # Riverpod providers
│   ├── theme/              # App theme and styling
│   ├── utils/              # Utility functions
│   └── widgets/            # Reusable UI components
├── data/                   # Data layer
│   ├── models/             # Data models
│   └── repositories/       # Data repositories
├── features/               # Feature modules
│   ├── auth/              # Authentication screens
│   ├── home/              # Home screen
│   ├── years/             # Year/semester selection
│   ├── subjects/          # Subject management
│   ├── settings/          # Settings and preferences
│   └── profile/           # Profile management
├── app.dart               # Main app configuration
├── main.dart              # App entry point
└── routes.dart            # Routing configuration
```

## 🛠️ Tech Stack

- **Flutter**: 3.19.0+
- **State Management**: Flutter Riverpod
- **Navigation**: Go Router
- **Local Storage**: Shared Preferences
- **UI**: Material 3 + Custom Theme
- **Fonts**: Google Fonts (Poppins)
- **Validation**: Custom validators
- **Testing**: Flutter Test

## 📦 Dependencies

```yaml
dependencies:
  flutter: >=3.19.0
  go_router: ^13.2.0
  flutter_riverpod: ^2.4.9
  shared_preferences: ^2.2.2
  google_fonts: ^6.1.0
  intl: ^0.19.0
  url_launcher: ^6.2.4
```

## 🚀 Getting Started

### Prerequisites

- Flutter SDK 3.19.0 or higher
- Android Studio / VS Code
- Android SDK (for Android development)
- Git

### Installation

1. **Clone the repository**
   ```bash
   git clone <repository-url>
   cd digi-notes
   ```

2. **Install dependencies**
   ```bash
   flutter pub get
   ```

3. **Run the app**
   ```bash
   flutter run
   ```

### Demo Credentials

For testing purposes, use these demo credentials:
- **Email**: `john@example.com`
- **Password**: `password123`

## 🔧 Configuration

### Adding Firebase (Future Enhancement)

The app is designed to easily integrate with Firebase:

1. **Install Firebase CLI**
   ```bash
   npm install -g firebase-tools
   ```

2. **Initialize Firebase**
   ```bash
   firebase init
   ```

3. **Update repositories** to use Firebase instead of mock data
4. **Configure authentication** with Firebase Auth
5. **Set up Firestore** for data storage

### Customizing Mock Data

Edit `lib/core/constants/app_constants.dart` to modify:
- Available streams
- Semester subjects
- Subject links
- Validation rules

## 🧪 Testing

Run the test suite:

```bash
flutter test
```

The app includes unit tests for validation utilities and is structured to support widget and integration tests.

## 📱 Platform Support

- **Android**: ✅ Fully supported
- **iOS**: 🔄 Scaffolded (requires iOS-specific setup)
- **Web**: 🔄 Scaffolded (requires web-specific setup)
- **Desktop**: 🔄 Scaffolded (requires desktop-specific setup)

## 🎨 UI/UX Features

- **Responsive Design**: Adapts to different screen sizes
- **Material 3**: Modern design system with dynamic colors
- **Custom Theme**: Consistent branding and styling
- **Accessibility**: Proper contrast ratios and touch targets
- **Animations**: Smooth transitions and micro-interactions

## 🔒 Security Features

- **Input Validation**: Comprehensive form validation
- **Password Requirements**: Strong password enforcement
- **Secure Storage**: Local data encryption (when Firebase is added)
- **Biometric Support**: Framework for biometric authentication

## 📊 Data Models

### User Model
```dart
class UserModel {
  final String id;
  final String name;
  final String email;
  final String phone;
  final DateTime joinedAt;
}
```

### Subject Model
```dart
class SubjectModel {
  final String id;
  final String title;
  final String bannerAsset;
  final Map<String, String> links;
}
```

## 🚀 Deployment

### Android APK
```bash
flutter build apk --release
```

### Android App Bundle
```bash
flutter build appbundle --release
```

## 🤝 Contributing

1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Add tests if applicable
5. Submit a pull request

## 📄 License

This project is licensed under the MIT License - see the LICENSE file for details.

## 🆘 Support

For support and questions:
- Create an issue in the repository
- Contact: support@digi-notes.com

## 🔮 Roadmap

- [ ] Firebase integration
- [ ] Dark theme support
- [ ] Offline mode
- [ ] Push notifications
- [ ] File upload/download
- [ ] Social authentication
- [ ] Multi-language support
- [ ] Advanced search
- [ ] Study progress tracking

## 📝 Changelog

### Version 1.0.0
- Initial release
- Complete 9-screen implementation
- Material 3 design
- Mock data and repositories
- Basic authentication flow
- Local data persistence

---

**Built with ❤️ using Flutter**
