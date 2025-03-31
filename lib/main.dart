import 'package:flutter/material.dart';
import 'splash_screen.dart';
import 'login_page.dart';
import 'signup_page.dart';
import 'home_screen.dart'; // ✅ Check kiya ki sahi hai
import 'profile_screen.dart';
import 'edit_profile.dart';
import 'ai_page.dart'; // ✅ Check kiya ki sahi hai

void main() {
  runApp(const GlavoxApp());
}

class GlavoxApp extends StatelessWidget {
  const GlavoxApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Glavox App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      initialRoute: '/', // ✅ Start Splash Screen Se Hoga
      routes: {
        '/': (context) => SplashScreen(),
        '/login': (context) => LoginPage(),
        '/signup': (context) => SignupPage(),
        '/home': (context) => HomeScreen(),
        '/profile': (context) => ProfileScreen(),
        '/edit-profile': (context) => EditProfileScreen(),
        '/ai': (context) => AiPage(),
      },
    );
  }
}
