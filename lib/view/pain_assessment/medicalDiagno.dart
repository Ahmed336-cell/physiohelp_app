import 'package:flutter/material.dart';

class MedicalDiagnosisScreen extends StatelessWidget {
  final List<String> diagnoses = ["Diagnosis A", "Diagnosis B", "Diagnosis C"];

  @override
  Widget build(BuildContext context) {
    String selectedDiagnosis = diagnoses.first;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Medical Diagnosis"),
        backgroundColor: Colors.teal[400],
        centerTitle: true,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.teal[100]!, Colors.teal[300]!],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Select Your Diagnosis",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.teal[800]),
            ),
            const SizedBox(height: 30),
            DropdownButtonFormField<String>(
              value: selectedDiagnosis,
              items: diagnoses.map((String diagnosis) {
                return DropdownMenuItem<String>(
                  value: diagnosis,
                  child: Text(diagnosis),
                );
              }).toList(),
              onChanged: (String? newValue) {
                selectedDiagnosis = newValue!;
              },
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                filled: true,
                fillColor: Colors.white,
                labelText: "Diagnoses",
              ),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                // Navigate to questions based on diagnosis
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(builder: (context) => QuestionsBasedOnDiagnosisScreen()),
                // );
              },
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
                backgroundColor: Colors.teal[400],
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                textStyle: const TextStyle(fontSize: 18),
              ),
              child: const Text("Submit"),
            ),
          ],
        ),
      ),
    );
  }
}
