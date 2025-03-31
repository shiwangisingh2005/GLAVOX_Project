import 'package:flutter/material.dart';
import 'package:glavox_app/splash_screen.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login"), // ✅ AppBar Add kiya
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => SplashScreen()),
                );
          },
        ),
      ),
      body: Column(
        children: [
          const SizedBox(height: 50),
          Center(
            child: Image.asset("assets/LOGO.png", height: 85),
          ),
          const SizedBox(height: 30),

          Expanded(
            child: Stack(
              children: [
                Positioned.fill(
                  child: Image.asset("assets/light_theme.png", fit: BoxFit.cover),
                ),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const SizedBox(height: 40),
                        Text('Hi there!', style: GoogleFonts.poppins(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black)),
                        Text('Please enter required details', style: GoogleFonts.poppins(fontSize: 14, color: Colors.black87)),
                        const SizedBox(height: 50),

                        TextField(
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white24,
                            hintText: 'Username/email',
                            hintStyle: GoogleFonts.poppins(color: Colors.black54),
                            border: OutlineInputBorder(borderRadius: BorderRadius.circular(20), borderSide: BorderSide.none),
                          ),
                        ),
                        const SizedBox(height: 15),

                        TextField(
                          obscureText: true,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white24,
                            hintText: 'Password',
                            hintStyle: GoogleFonts.poppins(color: Colors.black54),
                            border: OutlineInputBorder(borderRadius: BorderRadius.circular(20), borderSide: BorderSide.none),
                          ),
                        ),
                        const SizedBox(height: 10),

                        Align(
                          alignment: Alignment.centerRight,
                          child: Text('Forgot Password?', style: GoogleFonts.poppins(color: Colors.black)),
                        ),
                        const SizedBox(height: 25),

                        // **Login Button**
                        SizedBox(
                          width: double.infinity,
                          height: 50,
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.pushReplacementNamed(context, '/home'); // ✅ Home Page pe jao
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.grey.shade800,
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                            ),
                            child: Text('Log in', style: GoogleFonts.poppins(color: Colors.white)),
                          ),
                        ),

                        const SizedBox(height: 20),

                        // **Sign Up Navigation**
                        GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, '/signup'); // ✅ Signup pe jao
                          },
                          child: RichText(
                            text: TextSpan(
                              text: 'Create an account? ',
                              style: GoogleFonts.poppins(color: Colors.black),
                              children: [
                                TextSpan(
                                  text: 'Sign up',
                                  style: GoogleFonts.poppins(color: Colors.blueAccent, fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
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
