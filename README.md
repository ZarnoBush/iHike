iHike - Ride Request App

🚀 Overview

iHike is a ride request application designed to connect riders and drivers efficiently. Riders can search for available rides or request a specific ride, while drivers can browse ride requests or schedule rides for future trips. The app ensures a seamless and secure experience using modern authentication and data management techniques.

_________________________________________

📌 Features

Ride Request System – Riders can request rides, and drivers can accept or schedule rides.

Real-time Ride Matching – Find available rides or ride requests dynamically.

Secure Authentication – JWT-based authentication ensures safe and verified access.

User Role Management – Separate functionalities for Riders and Drivers.

Ride History – View past and upcoming rides.

Secure Data Storage – Flutter Secure Storage ensures safe handling of tokens and user credentials.

_________________________________________

🛠️ Tech Stack

The iHike app is built using the following technologies:

Frontend

Flutter (Dart)

GetX for state management

Flutter Secure Storage for secure local storage

Backend

PHP (MySQLi) for database operations

MySQL for data storage

JWT Authentication for user security

🏗️ Setup and Installation

Prerequisites

Install Flutter (Flutter Installation Guide)

Install PHP and MySQL (XAMPP, MAMP, or any server stack)

______________________________________

Clone the Repository

$ git clone https://github.com/your-repository/ihike.git
$ cd ihike


Backend Setup

Create a MySQL database and import the provided SQL file.

Configure database credentials in config.php.

Start your PHP server.

Frontend Setup

Install Flutter dependencies:
$ flutter pub get

Run the application:
$ flutter run


🔑 Authentication & Security

JWT Authentication: Used for secure login/logout.

Flutter Secure Storage: Stores tokens and sensitive data securely.




🚀 Features in This Login Implementation
✅ User authentication with MySQL & PHP
✅ Stores login session securely using Flutter Secure Storage
✅ Uses GetX for state management & navigation

🎯 Summary
1️⃣ Created a PHP login API
2️⃣ Built a login screen using GetX
3️⃣ Stored login session using Secure Storage
4️⃣ Added a home screen & logout functionality
5️⃣ Defined routes in main.dart

🚀 Next Steps
🔹 Implement Remember Me functionality (store session permanently)
🔹 Use JSON Web Tokens (JWT) for better security
🔹 Improve UI with animations & themes
Would you like me to add a JWT-based authentication next? 😊

___________________________________
📌 Steps to Implement Auto-Login
1️⃣ Check SecureStorage when the app starts.
2️⃣ If user data exists, navigate to Home automatically.
3️⃣ If no session is found, stay on the Login screen.


🎯 Final Behavior
✅ When the app opens, it automatically checks login status.
✅ If the user is logged in, it goes to the Home screen.
✅ If no session is found, it stays on the Login screen.
✅ Users can log out, which clears the session.


___________________________
🚀 Implementing JWT Authentication in Flutter (GetX, PHP, MySQL)
JWT (JSON Web Token) authentication helps secure API communication by verifying user identity without storing session data on the server.


🔹 Steps to Implement JWT Authentication
1️⃣ Modify PHP Backend to Generate & Validate JWT
2️⃣ Store JWT Token in SecureStorage in Flutter
3️⃣ Attach JWT Token to API Requests
4️⃣ Auto-Login Using JWT





