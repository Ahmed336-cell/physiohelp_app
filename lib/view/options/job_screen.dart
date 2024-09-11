import 'package:flutter/material.dart';

class JobScreen extends StatefulWidget {
  @override
  _JobScreenState createState() => _JobScreenState();
}

class _JobScreenState extends State<JobScreen> {
  String? selectedJob;
  List<Map<String, String>>? exercises;

  // List of jobs and their corresponding exercises
  final jobExercises = {
    "Office Worker": [
      {
        'title': 'Desk Stretch',
        'image': 'assets/exercises/office_worker_exercise1.png',
        'instructions': 'Sit up straight, reach your arms overhead, and stretch.',
        'benefits': 'Relieves tension and improves posture.'
      },
      {
        'title': 'Wrist Stretch',
        'image': 'assets/exercises/office_worker_exercise2.png',
        'instructions': 'Extend your arm, use your other hand to gently pull back your fingers.',
        'benefits': 'Reduces wrist strain and improves flexibility.'
      }
    ],
    "Driver": [
      {
        'title': 'Neck Stretch',
        'image': 'assets/exercises/driver_exercise1.png',
        'instructions': 'Tilt your head towards one shoulder and hold for 20 seconds.',
        'benefits': 'Alleviates neck stiffness from long periods of driving.'
      },
      {
        'title': 'Shoulder Roll',
        'image': 'assets/exercises/driver_exercise2.png',
        'instructions': 'Roll your shoulders forward and backward in a circular motion.',
        'benefits': 'Relieves shoulder tension and improves circulation.'
      }
    ],
    "Teacher": [
      {
        'title': 'Upper Back Stretch',
        'image': 'assets/exercises/teacher_exercise1.png',
        'instructions': 'Clasp your hands together and stretch them out in front of you.',
        'benefits': 'Stretches the upper back and reduces tension.'
      },
      {
        'title': 'Hamstring Stretch',
        'image': 'assets/exercises/teacher_exercise2.png',
        'instructions': 'While seated, extend one leg and reach towards your toes.',
        'benefits': 'Relieves tightness in the hamstrings from prolonged standing.'
      }
    ],
    "Construction Worker": [
      {
        'title': 'Back Stretch',
        'image': 'assets/exercises/construction_worker_exercise1.png',
        'instructions': 'Bend forward at the waist and try to touch your toes.',
        'benefits': 'Helps to relieve lower back tension and improve flexibility.'
      },
      {
        'title': 'Forearm Stretch',
        'image': 'assets/exercises/construction_worker_exercise2.png',
        'instructions': 'Extend your arm with palm facing up, use your other hand to gently pull back on your fingers.',
        'benefits': 'Reduces forearm strain from heavy lifting.'
      }
    ],
    "Programmer": [
      {
        'title': 'Neck Stretches',
        'image': 'assets/programmer/neck.jpg',
        'instructions': 'Sit up straight and gently tilt your head towards one shoulder, holding the stretch for 15-30 seconds. Repeat on the other side.',
        'benefits': 'Reduces tension in the neck and shoulders.'
      },
      {
        'title': 'Shoulder Shrugs and Rolls',
        'image': 'assets/programmer/shoulder.jpg',
        'instructions': 'Lift your shoulders towards your ears, hold for a few seconds, then lower them back down. Additionally, roll your shoulders forward and backward in a circular motion.',
        'benefits': 'Relieves shoulder tension and improves circulation.'
      },
      {
        'title': 'Upper Back Stretch',
        'image': 'assets/programmer/upperback.PNG',
        'instructions': 'Sit upright and clasp your hands together, then reach forward and round your upper back. Hold for 15-30 seconds.',
        'benefits': 'Stretches the upper back and helps counteract poor posture.'
      }
    ],
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Job-based Exercises", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
        backgroundColor: Colors.teal,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            DropdownButtonFormField<String>(
              decoration: InputDecoration(
                labelText: "Select your Job",
                labelStyle: const TextStyle(color: Colors.teal),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              ),
              items: jobExercises.keys
                  .map((job) => DropdownMenuItem(value: job, child: Text(job)))
                  .toList(),
              onChanged: (value) {
                setState(() {
                  selectedJob = value;
                  exercises = jobExercises[value!];
                });
              },
            ),
            const SizedBox(height: 20),
            if (exercises != null && exercises!.isNotEmpty)
              Expanded(
                child: ListView.builder(
                  itemCount: exercises!.length,
                  itemBuilder: (context, index) {
                    final exercise = exercises![index];
                    return ExerciseCard(exercise: exercise);
                  },
                ),
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
        borderRadius: BorderRadius.circular(15),
      ),
      elevation: 4,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(15)),
            child: Image.asset(
              exercise['image']!,
              fit: BoxFit.cover,
              height: 180,
              width: double.infinity,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  exercise['title']!,
                  style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                Text(
                  "Instructions: ${exercise['instructions']!}",
                  style: const TextStyle(fontSize: 16, color: Colors.black87),
                ),
                const SizedBox(height: 8),
                Text(
                  "Benefits: ${exercise['benefits']!}",
                  style: const TextStyle(fontSize: 16, color: Colors.teal),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}