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
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => HomeScreen()),
            );
          },
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset("assets/LOGO.png", height: 40),
            IconButton(
              icon: Icon(Icons.person, color: Colors.black, size: 28),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ProfileScreen()),
                );
              },
            ),
          ],
        ),
      ),
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
                    if (isListening)
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