
# Chat App

A Flutter-based chat application that enables real-time messaging and user authentication using Firebase. This app allows users to chat securely, authenticate using email and password, and store messages in Firebase Firestore.

## Table of Contents

- [Features](#features)
- [Technology Stack](#technology-stack)
- [Pages and Functionality](#pages-and-functionality)
- [Setup](#setup)
- [Contributors](#contributors)
- [License](#license)

## Features

- **User Authentication**: Secure login and registration for chat users.
- **Real-Time Messaging**: Send and receive messages instantly.
- **Chat Rooms**: Users can join or create chat rooms for group conversations.
- **Profile Management**: Users can update their display names and status.
- **MVVM Architecture**: Ensures a clean separation between logic and UI.
- **Provider for State Management**: Efficient and scalable state management.

## Technology Stack

- **Framework**: Flutter
- **Language**: Dart
- **Architecture**: Model-View-ViewModel (MVVM)
- **State Management**: Provider
- **Backend**: Firebase Authentication, Firebase Firestore

## Pages and Functionality

### Login Page

- Users can log in using email and password.
- Secure authentication handled by Firebase.

### Register Page

- New users can sign up with email, password, and display name.
- Input validation ensures correct data entry.

### Chat Room

- Users can join existing chat rooms or create new ones.
- Real-time messaging with messages displayed in a list.
- Messages are stored in Firebase Firestore.

## Setup

To set up and run the project locally, follow the steps below:

1. **Clone the repository**:

   ```bash
   git clone https://github.com/your-username/chat-app.git
   ```

2. **Navigate to the project directory**:

   ```bash
   cd chat-app
   ```

3. **Install dependencies**:

   ```bash
   flutter pub get
   ```

4. **Set up Firebase**:

   - Go to the [Firebase Console](https://console.firebase.google.com/).
   - Create a new Firebase project.
   - Enable Firebase Authentication and Firestore.
   - Download `google-services.json` for Android and place it in `android/app/`.
   - For iOS, download `GoogleService-Info.plist` and add it to your iOS project.

5. **Run the app**:

   ```bash
   flutter run
   ```

   Ensure your Firebase backend is properly set up for user authentication and real-time messaging.

## Contributors

- **Rohit Prajapati** -  Junior Developer

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

