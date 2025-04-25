# 💸 SAVE SAVEY – AI-Powered Finance Tracker 🚀

A smart Flutter-based finance tracker app designed to help users manage expenses, monitor subscriptions, and receive AI-based financial advice.  
Originally built in 24 hours during the Google AI Hackathon, then expanded into a complete solution for personal finance management.

[🎥 Watch Demo](https://drive.google.com/file/d/1XVCya93uRgSmb3d-Fi9gjKhHTCT5Bqr8/view?usp=drive_link)

## 🌟 Features

- 🔁 **Track Subscriptions & Bank Cards**  
  Easily manage recurring payments and card activity.

- 🧾 **Real-Time Expense Logging**  
  Add and view daily expenses with clear categorization.

- 💬 **Gemini AI Chatbot**  
  Chat with a built-in assistant for personalized financial advice.

- 🔐 **Cloud-Based Storage**  
  Sync data securely with Firebase Firestore.

- 📊 **Budget Visualization**  
  Monitor budget limits and gain insight into spending patterns.

---


## 📂 Project Structure

```
lib/
│
├── business_logic/     # BLoC, Cubit, and state management
│
├── data/               # Data models, repositories, and services
│
├── helpers/            # Utilities and constants
│
├── presentation/       # UI screens, widgets, and themes
│
├── router/             # App navigation and route management
│
├── firebase_options.dart  # Firebase configuration (auto-generated)
│
├── main.dart              # Main entry point
│
└── save_savey_app.dart     # App widget configuration (MaterialApp, providers, etc.)
```

---

## 🛠️ Packages
```
cloud_firestore: ^5.6.5
cupertino_icons: ^1.0.8
firebase_auth: ^5.5.1
firebase_core: ^3.12.1
flutter_bloc: ^9.0.0
fluttertoast: ^8.2.12
font_awesome_icon_class: ^0.0.6
http: ^1.3.0
image_picker: ^1.1.2
local_auth: ^2.3.0
logger: ^2.5.0
lucide_icons: ^0.257.0
fl_chart: ^0.63.0
google_generative_ai: ^0.4.6
flutter_dotenv: ^5.2.1
flutter_animate: ^2.1.0
dotted_border: ^2.1.0
calendar_agenda: ^0.0.2+3
flutter_credit_card: ^4.1.0

```
