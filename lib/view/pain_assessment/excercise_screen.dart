import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../viewModel/pain_assesment_viewModel.dart';

class ExerciseScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final exercises = context.watch<PainAssessmentViewModel>().exercises;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Recommended Exercises"),
        backgroundColor: Colors.teal[400],
        elevation: 0,
        centerTitle: true,
      ),
      body: Container(
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.teal[100]!, Colors.teal[300]!],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: exercises.isNotEmpty
            ? ListView.builder(
          itemCount: exercises.length,
          itemBuilder: (context, index) {
            final exercise = exercises[index];
            return ExerciseCard(exercise: exercise);
          },
        )
            : const Center(
          child: Text(
            "Please visit a doctor for chronic pain.",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.red),
            textAlign: TextAlign.center,
          ),
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
            child: Text("Instructions: ${exercise['instructions']!}",
              style: TextStyle(fontSize: 18, color: Colors.grey[600]),
            ),
          ),
          if (exercise.containsKey('benefits')) // Display benefits only if available
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: Text("Benefits: ${exercise['benefits']!}",
                style: TextStyle(fontSize: 16, color: Colors.grey[600]),
              ),
            ),
        ],
      ),
    );
  }
}
