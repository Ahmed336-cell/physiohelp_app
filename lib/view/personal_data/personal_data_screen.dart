import 'package:flutter/material.dart';
import '../../model/patient.dart';
import '../pain_assessment/pain_assessment_screen.dart';

class PersonalDataScreen extends StatefulWidget {
  @override
  _PersonalDataScreenState createState() => _PersonalDataScreenState();
}

class _PersonalDataScreenState extends State<PersonalDataScreen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController locationController = TextEditingController();
  final TextEditingController ageController = TextEditingController();
  final TextEditingController occupationController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true, // Allows the background to extend behind the AppBar
      appBar: AppBar(
        title: const Text(
          "Personal Data",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
        ),
        backgroundColor: Colors.transparent,
        centerTitle: true,
        elevation: 0,
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.teal[100]!, Colors.teal[400]!],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 100), // Provides space between AppBar and content
              _buildInputField(
                controller: nameController,
                label: "Name",
                icon: Icons.person,
              ),
              SizedBox(height: 16),
              _buildInputField(
                controller: locationController,
                label: "Location",
                icon: Icons.location_on,
              ),
              SizedBox(height: 16),
              _buildInputField(
                controller: ageController,
                label: "Age",
                icon: Icons.cake,
                keyboardType: TextInputType.number,
              ),
              SizedBox(height: 16),
              _buildInputField(
                controller: occupationController,
                label: "Occupation",
                icon: Icons.work,
              ),
              SizedBox(height: 30),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(vertical: 16, horizontal: 32),
                  backgroundColor: Colors.white,
                  foregroundColor: Colors.teal[400],
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  elevation: 5,
                  shadowColor: Colors.black,
                ),
                onPressed: () {
                  // Capture patient data and pass to next screen
                  final patient = Patient(
                    name: nameController.text,
                    location: locationController.text,
                    age: int.tryParse(ageController.text) ?? 0,
                    occupation: occupationController.text,
                    painDuration: "",
                    painLocation: "",
                    painType: "",
                    previousInjury: false,
                    movementImpact: false,
                  );

                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          PainAssessmentScreen(patient: patient),
                    ),
                  );
                },
                child: const Text(
                  "Next",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Custom input field builder
  Widget _buildInputField({
    required TextEditingController controller,
    required String label,
    required IconData icon,
    TextInputType keyboardType = TextInputType.text,
  }) {
    return TextField(
      controller: controller,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        labelText: label,
        labelStyle: const TextStyle(color: Colors.black),
        filled: true,
        fillColor: Colors.white.withOpacity(0.3),
        prefixIcon: Icon(icon, color: Colors.black),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: const BorderSide(color: Colors.black),
        ),
      ),
      style: const TextStyle(color: Colors.black),
    );
  }
}
