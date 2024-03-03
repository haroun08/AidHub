import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'SignInPage.dart';
import 'SplashScreen.dart';
import 'Homepage.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: FirebaseOptions(
      projectId: 'e-business-80787',
      apiKey: 'AIzaSyDy3cOJNE-tY_VuTZbFwiuRSvVxAPgUEGE',
      appId: '1:400898808343:android:219d64944f701aba4fda52',
      messagingSenderId: '400898808343',
      storageBucket: 'e-business-80787.appspot.com',
    ),
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sign In / Sign Up Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // Use SplashScreen as the initial route
      initialRoute: '/splash',
      routes: {
        // Define routes for all pages
        '/splash': (context) => SplashScreen(),
        '/home': (context) => MyHomePage(),
        '/signin': (context) => SignInPage(),
        '/signup': (context) => SignUpPage(),
      },
    );
  }
}
