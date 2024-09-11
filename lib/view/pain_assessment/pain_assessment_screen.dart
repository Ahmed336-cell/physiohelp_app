import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../model/patient.dart';
import '../../viewModel/pain_assesment_viewModel.dart';
import 'excercise_screen.dart';

class PainAssessmentScreen extends StatelessWidget {
  final Patient patient;
  final TextEditingController durationController = TextEditingController();
  final TextEditingController locationController = TextEditingController();
  final TextEditingController painTypeController = TextEditingController();

  PainAssessmentScreen({required this.patient});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Pain Assessment", style: TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: Colors.teal[400],
        elevation: 0,
        centerTitle: true,
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.teal[100]!, Colors.teal[300]!],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _buildPatientInfo(),
              SizedBox(height: 20),
              _buildDropdownField(
                controller: durationController,
                label: "Pain Duration",
                items: ["Acute", "Chronic"],
              ),
              SizedBox(height: 16),
              _buildDropdownField(
                controller: locationController,
                label: "Pain Location",
                items: ["Back", "Posterior pelvis", "Hand", "Anterior shoulder"],
              ),
              SizedBox(height: 16),
              _buildDropdownField(
                controller: painTypeController,
                label: "Pain Type",
                items: ["Localized pain", "Tingling pain"],
              ),
              SizedBox(height: 30),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(vertical: 16),
                  backgroundColor: Colors.teal[600],
                  overlayColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  elevation: 5,
                ),
                onPressed: () {
                  // Update patient with the assessment data
                  patient.painDuration = durationController.text;
                  patient.painLocation = locationController.text;
                  patient.painType = painTypeController.text;

                  context.read<PainAssessmentViewModel>().assessPatientCondition(patient);
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ExerciseScreen()),
                  );
                },
                child: Text("Submit", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPatientInfo() {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 20),
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Patient Name: ${patient.name}", style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
            Text("Age: ${patient.age}", style: TextStyle(fontSize: 16)),
          ],
        ),
      ),
    );
  }

  Widget _buildDropdownField({
    required TextEditingController controller,
    required String label,
    required List<String> items,
  }) {
    return DropdownButtonFormField<String>(
      items: items
          .map((e) => DropdownMenuItem(value: e, child: Text(e)))
          .toList(),
      onChanged: (value) => controller.text = value!,
      decoration: InputDecoration(
        labelText: label,
        labelStyle: TextStyle(color: Colors.grey[600]),
        filled: true,
        fillColor: Colors.white.withOpacity(0.8),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
        contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      ),
    );
  }
}
