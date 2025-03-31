import 'package:flutter/material.dart';

class EditProfileScreen extends StatefulWidget {
  @override
  _EditProfileScreenState createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  bool isDarkMode = false; // ✅ Fix: Define Dark Mode Variable

  void toggleTheme() {
    // ✅ Fix: Function to toggle theme
    setState(() {
      isDarkMode = !isDarkMode;
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

          // Back Button
          Positioned(
            top: 40,
            left: 20,
            child: IconButton(
              icon: Icon(Icons.arrow_back_ios, color: Colors.black, size: 28),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),

          // Centered Edit Profile Box
          Center(
            child: Container(
              width: MediaQuery.of(context).size.width * 0.85,
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white, // White background fix
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 10,
                    spreadRadius: 2,
                  ),
                ],
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "Edit Profile",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 20),

                  // Profile Image with Edit Icon (MetaHuman)
                  Stack(
                    children: [
                      CircleAvatar(
                        radius: 60,
                        backgroundImage: AssetImage("assets/metahuman.png"),
                      ),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: GestureDetector(
                          onTap: () {
                            // Yaha image change logic add karna hai
                          },
                          child: CircleAvatar(
                            radius: 18,
                            backgroundColor: Colors.white,
                            child: Icon(Icons.edit, color: Colors.black, size: 18),
                          ),
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: 20),

                  // Name Field
                  TextField(
                    controller: nameController,
                    style: TextStyle(color: Colors.black),
                    decoration: InputDecoration(
                      labelText: "Name",
                      labelStyle: TextStyle(color: Colors.black),
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(height: 15),

                  // Email Field
                  TextField(
                    controller: emailController,
                    style: TextStyle(color: Colors.black),
                    decoration: InputDecoration(
                      labelText: "Email",
                      labelStyle: TextStyle(color: Colors.black),
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(height: 20),

                  // ✅ Dark Mode Toggle Fixed
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Light", style: TextStyle(color: Colors.black)),
                      Switch(
                        value: isDarkMode,
                        onChanged: (value) {
                          toggleTheme();
                        },
                        activeColor: Colors.black,
                        activeTrackColor: Colors.grey[400], // Light Gray Background in Dark Mode
                      ),
                      Text("Dark", style: TextStyle(color: Colors.black)),
                    ],
                  ),
                  SizedBox(height: 20),

                  // Save Button
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                    ),
                    child: Text("Save", style: TextStyle(fontSize: 18, color: Colors.white)),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
