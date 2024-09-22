import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../viewModel/pain_assesment_viewModel.dart';
import 'PreventionInstructionsScreen.dart';

class TypeOfAcheScreen extends StatefulWidget {
  @override
  _TypeOfAcheScreenState createState() => _TypeOfAcheScreenState();
}

class _TypeOfAcheScreenState extends State<TypeOfAcheScreen> {
  final List<String> aches = ["Back", "Posterior pelvis", "Neck", "Anterior shoulder"];
  String selectedAche = "Back";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Type of Ache"),
        backgroundColor: Colors.teal[400],
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.teal[100]!, Colors.teal[300]!],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                "Select the type of ache you are experiencing:",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.teal[800],
                  letterSpacing: 0.5,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 30),
              _buildAcheDropdown(),
              SizedBox(height: 20),
              _buildSubmitButton(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAcheDropdown() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            blurRadius: 10,
            spreadRadius: 5,
          ),
        ],
      ),
      child: DropdownButton<String>(
        value: selectedAche,
        isExpanded: true,
        underline: SizedBox(),
        items: aches.map((String ache) {
          return DropdownMenuItem<String>(
            value: ache,
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Text(
                ache,
                style: TextStyle(fontSize: 18),
              ),
            ),
          );
        }).toList(),
        onChanged: (String? newValue) {
          setState(() {
            selectedAche = newValue!;
          });
        },
      ),
    );
  }

  Widget _buildSubmitButton(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        // Call the provideExercises method with the selected ache
        context.read<PainAssessmentCubit>().provideExercises(selectedAche);

        // Navigate to CombinedScreen
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => PreventInstructionScreen()),
        );
      },
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.symmetric(vertical: 16),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        backgroundColor: Colors.teal[600],
        elevation: 5,
      ),
      child: Text(
        "Submit",
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
    );
  }
}
