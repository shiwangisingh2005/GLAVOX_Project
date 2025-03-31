import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 40), () {
      Navigator.pushReplacementNamed(context, '/login'); // ✅ Direct login page pe jao
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
                colorFilter: ColorFilter.mode(
                  const Color.fromARGB(255, 245, 243, 243).withOpacity(0.6), 
                  BlendMode.darken,
                ),
              ),
            ),
          ),

          // Content
          SafeArea(
            child: Column(
              children: [
                Expanded(
                  child: Center( 
                    child: Column(
                      mainAxisSize: MainAxisSize.min, 
                      children: [
                        Image.asset(
                          "assets/LOGO.png",
                          height: 180, 
                          width: 280,  
                          fit: BoxFit.contain,
                        ),

                        Transform.translate(
                          offset: Offset(0, -15),
                          child: Text(
                            'where hesitation leaves the chat',
                            textAlign: TextAlign.center,
                            style: GoogleFonts.roboto(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: const Color.fromARGB(255, 13, 12, 12),
                              letterSpacing: 1.2,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                // Get Started Button
                Padding(
                  padding: const EdgeInsets.only(bottom: 50), 
                  child: Center(
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pushReplacementNamed(context, '/login'); // ✅ Direct login page pe jao
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.grey[800], 
                        padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30), 
                        ),
                      ),
                      child: Text(
                        'Get started',
                        style: TextStyle(fontSize: 18, color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
