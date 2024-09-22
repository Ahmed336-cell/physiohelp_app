import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:physiohelp_app/view/auth/login_screen.dart';
import 'package:url_launcher/url_launcher.dart';
import '../options/job_screen.dart';
import '../options/treat_screen.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Home Screen",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
        ),
        backgroundColor: Colors.teal[400],
        centerTitle: true,
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.logout, size: 30,color: Colors.white,),
            onPressed: () {
              // Logout user
              FirebaseAuth.instance.signOut();
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginScreen()));
            },
          ),
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.teal[100]!, Colors.teal[400]!],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset("assets/logoo.png", height: 150),
              const SizedBox(height: 20),
              const Text(
                "Welcome! Get personalized advice to help you stay healthy.",
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 0.5,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 40),
              _buildCustomButton(
                context,
                "Ask for Treatment",
                Icons.medical_services,
                TreatmentScreen(),
              ),
              const SizedBox(height: 20),
              _buildCustomButton(
                context,
                "Ask About Your Job Treatments",
                Icons.work,
                JobScreen(),
              ),
              const SizedBox(height: 50,),
              _buildFacebookIcon(),
            ],
          ),
        ),
      ),
    );
  }

  // Custom button widget for modern look
  Widget _buildCustomButton(
      BuildContext context, String text, IconData icon, Widget screen) {
    return ElevatedButton.icon(
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        elevation: 5,
        shadowColor: Colors.black,
      ),
      icon: Icon(icon, color: Colors.teal[400], size: 28),
      label: Text(
        text,
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: Colors.teal[400],
        ),
      ),
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => screen),
        );
      },
    );
  }

  // Facebook icon at the bottom
  Widget _buildFacebookIcon() {
    return Column(
      children: [
        const Text("Visit us on Facebook", style: TextStyle(color: Colors.white, fontSize: 25,fontWeight: FontWeight.bold)),
        IconButton(
          icon: const Icon(Icons.facebook, size: 50, color: Colors.blue),
          onPressed: () async {
            const url = 'https://www.facebook.com/profile.php?id=61563038982377&mibextid=ZbWKwL'; // Replace with your Facebook page URL
            final Uri uri = Uri.parse(url);

            if (await canLaunchUrl(uri)) {
              await launchUrl(uri,
                mode: LaunchMode.externalApplication,

              );
            } else {
              throw 'Could not launch $url';
            }
          },
        ),
      ],
    );
  }
}
