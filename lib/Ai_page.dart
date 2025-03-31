import 'package:flutter/material.dart';
import 'profile_screen.dart'; // Profile Page import
import 'home_screen.dart'; // Back Navigation ke liye Home Screen import

class AiPage extends StatefulWidget {
  @override
  _AiPageState createState() => _AiPageState();
}

class _AiPageState extends State<AiPage> {
  bool isListening = false;

  void toggleListening() {
    setState(() {
      isListening = !isListening;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background Image
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/light_theme.png"),
                fit: BoxFit.cover,
              ),
            ),
          ),

          // GLAVOX Logo (Top Center)
          Positioned(
            top: 40,
            left: 0,
            right: 0,
            child: Center(
              child: Image.asset(
                "assets/LOGO.png",
                height: 50,
              ),
            ),
          ),

          // Back Button → Home Screen
          Positioned(
            top: 40,
            left: 20,
            child: IconButton(
              icon: Icon(Icons.arrow_back_ios, color: Colors.black, size: 28),
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => HomeScreen()),
                );
              },
            ),
          ),

          // Profile Icon → Profile Screen
          Positioned(
            top: 40,
            right: 20,
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ProfileScreen()),
                );
              },
              child: CircleAvatar(
                radius: 20,
                backgroundImage: AssetImage("assets/profile_icon.png"),
              ),
            ),
          ),

          // Center Content (MetaHuman)
          Align(
            alignment: Alignment.center,
            child: Image.asset(
              "assets/metahuman.png",
              height: MediaQuery.of(context).size.height * 0.5,
              fit: BoxFit.contain,
            ),
          ),

          // Mic Button at Bottom with Simple Wave Effect
          Positioned(
            bottom: 80,
            left: 0,
            right: 0,
            child: GestureDetector(
              onTap: toggleListening,
              child: Center(
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    if (isListening) // Simple wave effect
                      Container(
                        height: 120,
                        width: 120,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.blueAccent.withOpacity(0.3),
                        ),
                      ),
                    Container(
                      height: 100,
                      width: 100,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.grey[800],
                        boxShadow: isListening
                            ? [
                                BoxShadow(
                                  color: Colors.blueAccent.withOpacity(0.6),
                                  spreadRadius: 10,
                                  blurRadius: 30,
                                ),
                              ]
                            : [],
                      ),
                      child: Icon(
                        Icons.mic,
                        size: 50,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
