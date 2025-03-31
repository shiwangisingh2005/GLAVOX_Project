import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SignupPage extends StatelessWidget {
  const SignupPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Signup"),
        leading: IconButton(
          icon: Icon(Icons.arrow_back), // 🔙 Back Button
          onPressed: () {
            Navigator.pop(context); // 🡠 Pichle page pe jao
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
                        Text('Create an Account', style: GoogleFonts.poppins(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black)),
                        Text(
                          'To create an account provide details and verify email and set password',
                          style: GoogleFonts.poppins(fontSize: 14, color: Colors.black87),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 50),

                        TextField(
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white24,
                            hintText: 'Full Name',
                            hintStyle: GoogleFonts.poppins(color: Colors.black54),
                            border: OutlineInputBorder(borderRadius: BorderRadius.circular(20), borderSide: BorderSide.none),
                          ),
                        ),
                        const SizedBox(height: 15),

                        TextField(
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white24,
                            hintText: 'Email',
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
                        const SizedBox(height: 15),

                        const SizedBox(height: 25),

                        SizedBox(
                          width: double.infinity,
                          height: 50,
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.pushReplacementNamed(context, '/home'); // ✅ Signup ke baad Home Page pe jao
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.grey.shade800,
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                            ),
                            child: Text('Sign up', style: GoogleFonts.poppins(color: Colors.white)),
                          ),
                        ),

                        const SizedBox(height: 20),

                        GestureDetector(
                          onTap: () {
                            Navigator.pop(context); // ✅ LoginPage pe wapas jao
                          },
                          child: RichText(
                            text: TextSpan(
                              text: 'Already have an account? ',
                              style: GoogleFonts.poppins(color: Colors.black),
                              children: [
                                TextSpan(
                                  text: 'Log in',
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
