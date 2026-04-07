# Campus Connect

A comprehensive Flutter social app for Valley View University students. This capstone project demonstrates all concepts learned from Week 2 to Week 9 of the INFT 425 Mobile Application Development course.

## Features

### Core Features
- ✅ **Firebase Authentication** - Sign up/Login with email and password
- ✅ **Event Management** - Create, view, and manage campus events
- ✅ **Real-time Updates** - Live event feed using Firestore
- ✅ **Social Interactions** - Like and comment on events
- ✅ **Device APIs** - Camera integration and GPS location tagging
- ✅ **Motivational Quotes** - Random daily quotes from REST API
- ✅ **User Profiles** - View and manage user information

### Technologies Used
- **Frontend**: Flutter with Provider state management
- **Backend**: Firebase (Authentication, Firestore, Storage)
- **Networking**: HTTP package for REST APIs
- **Local Storage**: Shared Preferences
- **Device APIs**: Image Picker (Camera), Geolocator (GPS)
- **Architecture**: MVVM pattern with Provider

## Project Structure

```
lib/
├── main.dart                 # App entry point with Firebase initialization
├── firebase_options.dart     # Firebase configuration
├── models/
│   ├── event.dart           # Event data model
│   └── quote.dart           # Quote data model
├── services/
│   ├── auth_service.dart    # Firebase authentication
│   ├── event_service.dart   # Firestore event management
│   └── quote_service.dart   # REST API for quotes
├── viewmodels/
│   ├── auth_viewmodel.dart  # Authentication state management
│   ├── event_viewmodel.dart # Events state management
│   └── quote_viewmodel.dart # Quotes state management
├── screens/
│   ├── login_screen.dart    # Authentication UI
│   ├── home_screen.dart     # Main dashboard with quote
│   ├── event_list_screen.dart      # Event feed
│   ├── add_event_screen.dart       # Create new event
│   ├── profile_screen.dart  # User profile
│   └── comment_screen.dart  # Comments on events
└── widgets/
    └── (Custom widgets can be added here)
```

## Getting Started

### Prerequisites
- Flutter SDK 3.11.1+
- Dart SDK
- Firebase Account
- Android Studio or Xcode

### Installation Steps

#### 1. Clone the Project
```bash
cd weekly_project
cd campus_connect
```

#### 2. Install Dependencies
```bash
flutter pub get
```

#### 3. Set Up Firebase

##### Generate Firebase Configuration:
```bash
# Install FlutterFire CLI
dart pub global activate flutterfire_cli

# Configure your project (select Valley View University project)
flutterfire configure
```

This will automatically:
- Download `google-services.json` for Android
- Download `GoogleService-Info.plist` for iOS
- Generate `lib/firebase_options.dart` with your project credentials

#### 4. Enable Firebase Authentication
1. Go to Firebase Console → Your Project
2. Authentication → Sign-in method
3. Enable **Email/Password** authentication

#### 5. Create Firestore Database
1. Firestore Database → Create Database
2. Start in test mode (for development)
3. Select your region

#### 6. Run the App

```bash
# For Android
flutter run

# For iOS (macOS only)
flutter run -d ios

# For specific device
flutter devices  # List available devices
flutter run -d <device_id>
```

## Features in Detail

### 1. Authentication
- Email/password sign up and login
- Firebase Authentication integration
- Secure session management
- Auto-redirect based on login state

### 2. Event Management
- Create events with title, description, date
- Upload photos using device camera
- Tag location using GPS
- View all campus events in real-time

### 3. Social Interactions
- Like/unlike events
- Add comments to events
- View comments with timestamps
- Real-time synchronization

### 4. Notifications & Quotes
- Fetch motivational quotes from Quotable API
- Display quote of the day on home screen
- Refresh quotes on demand

### 5. User Profile
- View user email
- View user avatar (initial from email)
- Logout functionality

## API Integration

### Quotable API
- **Endpoint**: `https://api.quotable.io/random`
- **Method**: GET
- **Response**: JSON with quote text and author

## Firestore Database Structure

### Collections

#### `events`
```json
{
  "id": "timestamp",
  "title": "Event Title",
  "description": "Event Description",
  "date": "2024-03-25T10:00:00.000Z",
  "imageUrl": "/path/to/image",
  "latitude": 6.7275,
  "longitude": -0.2549,
  "createdBy": "user_uid",
  "likes": ["user_uid_1", "user_uid_2"],
  "comments": [
    {
      "userId": "user_uid",
      "userName": "user@example.com",
      "text": "Great event!",
      "timestamp": "2024-03-25T11:00:00.000Z"
    }
  ]
}
```

## Build APK/IPA

### Android
```bash
flutter build apk --release
# Output: build/app/outputs/flutter-apk/app-release.apk
```

### iOS
```bash
flutter build ios --release
```

## Troubleshooting

### Firebase Initialization Error
**Problem**: `FirebaseApp is not initialized`
**Solution**: Ensure `Firebase.initializeApp()` is called before `runApp()`

### Permissions Error (Camera/Location)
**Problem**: Permission denied when using camera or location
**Solution**: Add permissions to AndroidManifest.xml and Info.plist

### Firestore Connection Issues
**Problem**: Can't read/write to Firestore
**Solution**: Check Firebase project ID and verify Firestore security rules

## Support & Contact

For questions or issues:
- Instructor: Prof. Dr. Prince Owusu Amoako
- Assistant: Mr. Kobbina Amoah
- Course: INFT 425 – Mobile Application Development

## License

This project is for educational purposes as part of INFT 425 course.

---

**Last Updated**: March 2024  
**Version**: 1.0.0

