import 'package:flutter/material.dart';
import 'edit_profile.dart';
import 'home_screen.dart'; // ✅ Home screen ka import
import 'splash_screen.dart'; // ✅ Splash screen ka import

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  String profileImage = "assets/metahuman.png"; // Default profile image

  void changeProfileImage() {
    setState(() {
      profileImage = "assets/new_profile.png"; // Dummy change for now
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

          // Back Button (Home Screen pe wapas)
          Positioned(
            top: 40,
            left: 20,
            child: IconButton(
              icon: Icon(Icons.arrow_back_ios, color: Colors.black, size: 28),
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => HomeScreen()), // ✅ HomeScreen pe le jayega
                );
              },
            ),
          ),

          // Logout Button (Right Side) - Confirmation Dialog ke saath
          Positioned(
            top: 40,
            right: 20,
            child: IconButton(
              icon: Icon(Icons.logout, color: Colors.black, size: 28),
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text("Logout"),
                      content: Text("Are you sure you want to logout?"),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context); // Dialog close karega
                          },
                          child: Text("Cancel"),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context); // Dialog close
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(builder: (context) => SplashScreen()), // SplashScreen pe le jayega
                            );
                          },
                          child: Text("OK"),
                        ),
                      ],
                    );
                  },
                );
              },
            ),
          ),

          // Centered Profile Box
          Center(
            child: Container(
              width: MediaQuery.of(context).size.width * 0.85,
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.85),
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
                    "Profile",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 20),

                  // Profile Image with Camera Icon
                  Stack(
                    children: [
                      CircleAvatar(
                        radius: 60,
                        backgroundImage: AssetImage(profileImage),
                      ),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: GestureDetector(
                          onTap: changeProfileImage,
                          child: CircleAvatar(
                            radius: 18,
                            backgroundColor: Colors.black,
                            child: Icon(Icons.camera_alt, color: Colors.white, size: 18),
                          ),
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: 20),

                  Text("User Name",
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black)),
                  Text("user@example.com", style: TextStyle(fontSize: 16, color: Colors.black)),
                  SizedBox(height: 15),

                  Text("Topics Covered",
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500, color: Colors.black)),
                  Text("Flutter, Dart, Firebase", style: TextStyle(fontSize: 16, color: Colors.black)),
                  SizedBox(height: 10),

                  Text("Feedback",
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500, color: Colors.black)),
                  Text("Great learning experience!", style: TextStyle(fontSize: 16, color: Colors.black)),
                  SizedBox(height: 20),
                ],
              ),
            ),
          ),

          // Edit Profile Button
          Positioned(
            bottom: 50,
            left: 0,
            right: 0,
            child: Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => EditProfileScreen()), // ✅ Edit Profile pe jayega
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                ),
                child: Text("Edit Profile", style: TextStyle(fontSize: 18, color: Colors.white)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
