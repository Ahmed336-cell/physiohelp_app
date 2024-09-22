import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../viewModel/pain_assesment_viewModel.dart';

class PreventInstructionScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Example: Call provideExercises with a pain location
    // You might want to trigger this based on user input

    // Example usage (You might want to place this in a method or a button):
    // context.read<PainAssessmentCubit>().provideExercises('Back');

    return Scaffold(
      appBar: AppBar(
        title: const Text("Exercises & Prevention"),
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
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text(
                "Recommended Exercises",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.teal[800],
                ),
              ),
              const SizedBox(height: 10),
              BlocBuilder<PainAssessmentCubit, List<Map<String, String>>>(
                builder: (context, exercises) {
                  return exercises.isNotEmpty
                      ? ListView.builder(
                    itemCount: exercises.length,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      final exercise = exercises[index];
                      return ExerciseCard(exercise: exercise);
                    },
                  )
                      : const Center(
                    child: Text(
                      "Please visit a doctor for chronic pain.",
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.red),
                      textAlign: TextAlign.center,
                    ),
                  );
                },
              ),
              const SizedBox(height: 30),
              Text(
                "Prevention Instructions",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.teal[800],
                ),
              ),
              const SizedBox(height: 10),
              _buildPreventionInstructions(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPreventionInstructions() {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: const Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Here are some instructions to prevent the ache:",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text("1. Maintain proper posture.", style: TextStyle(fontSize: 16)),
            Text("2. Stretch regularly.", style: TextStyle(fontSize: 16)),
            Text("3. Avoid heavy lifting.", style: TextStyle(fontSize: 16)),
            Text("4. Stay hydrated.", style: TextStyle(fontSize: 16)),
            SizedBox(height: 20),
            Text(
              "If you don't feel better after 3 days, please visit a doctor.",
              style: TextStyle(fontSize: 16, color: Colors.red),
            ),
          ],
        ),
      ),
    );
  }
}

class ExerciseCard extends StatelessWidget {
  final Map<String, String> exercise;

  const ExerciseCard({required this.exercise});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      elevation: 5,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            exercise['image']!,
            fit: BoxFit.cover,
            height: 200,
            width: double.infinity,
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              exercise['title']!,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: Text(
              "Instructions: ${exercise['instructions']!}",
              style: TextStyle(fontSize: 18, color: Colors.grey[600]),
            ),
          ),
          if (exercise.containsKey('benefits')) // Display benefits only if available
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: Text(
                "Benefits: ${exercise['benefits']!}",
                style: TextStyle(fontSize: 16, color: Colors.grey[600]),
              ),
            ),
        ],
      ),
    );
  }
}
