# Instagramapp



Instagram App is an application developed with SwiftUI that utilizes Firebase solutions. Users can log in, sign up, edit their profiles, upload photos, and view posts from other users.

 # Features

User Login and Signup: Firebase Authentication for user login and registration.

Image Uploading: Firebase Storage allows users to upload and share photos.

Post Feed: Posts are displayed by fetching data from Firebase Firestore.

User Profile: Users can access their profile page, edit profile information, and change their profile photo.

User Search: Search for other users and view their profiles.

Edit Profile: Users can edit their name, bio, and profile photo.

MVVM Architecture: The app follows the MVVM (Model-View-ViewModel) pattern to ensure a maintainable and scalable structure.

 # Technologies Used

SwiftUI: The user interface of the app is built using SwiftUI.

Firebase Authentication: Used for user authentication and management.

Firebase Firestore: The app uses Firestore as the database to store user and post data.

Firebase Storage: Used for storing image and media files.

MVVM Architecture: The app uses the MVVM pattern to separate the business logic from the user interface for better maintainability.


 # Setup

To run this project locally, follow these steps:

1. Clone the Repository

git clone https://github.com/YaremMalta/Instagramapp.git

2. Link Firebase Project
   
Create a new project in Firebase Console.

Enable email authentication under Authentication.

Enable Firestore and Firebase Storage.

Download the GoogleService-Info.plist file from Firebase and add it to the project.

3. Integrate Firebase
   
To integrate Firebase into the project, follow these steps:

Add Firebase SDK to the project using Swift Package Manager or CocoaPods.

pod install

Initialize Firebase in the AppDelegate.swift file:

import Firebase

FirebaseApp.configure()

4. Install Dependencies
   
To install the Firebase and other dependencies, run the following commands in the terminal:

pod install

5. Run with Xcode
   
Open the project in Xcode and run it:

open Instagramapp.xcworkspace

The app connects to Firebase and allows users to log in, upload photos, and access other features.
