import 'package:flutter_bloc/flutter_bloc.dart';

class PainAssessmentCubit extends Cubit<List<Map<String, String>>> {
  PainAssessmentCubit() : super([]);

  // Function to provide specific exercises based on pain location
  void provideExercises(String painLocation) {
    List<Map<String, String>> exercises = [];

    switch (painLocation) {
      case "Back":
        exercises = [
          {
            'title': 'Cat-Cow Stretch',
            'image': 'assets/back/catcow.PNG',
            'instructions': 'Start on your hands and knees. Arch your back towards the ceiling (Cat), then dip your back towards the floor while lifting your head and tailbone (Cow).',
            'benefits': 'Improves flexibility and relieves tension in the spine.',
          },
          {
            'title': 'Child’s Pose',
            'image': 'assets/back/childes.PNG',
            'instructions': 'From a kneeling position, sit back on your heels, then reach forward with your arms and lower your forehead to the floor.',
            'benefits': 'Stretches the lower back and helps relax the muscles',
          },
          {
            'title': 'Knee-to-Chest Stretch',
            'image': 'assets/back/kneepose.png',
            'instructions': 'Lie on your back with your knees bent. Bring one knee towards your chest and hold it with both hands for 20-30 seconds. Switch legs.',
            'benefits': 'Stretches the lower back and glutes',
          },
          {
            'title': 'Seated Forward Bend',
            'image': 'assets/back/seated.jpg',
            'instructions': 'Sit with your legs extended in front of you. Slowly reach towards your toes, keeping your back straight.',
            'benefits': 'Stretches the lower back and hamstrings.',
          },
        ];
        break;
      case "Neck":
        exercises = [
          {
            'title': 'Neck Flexion',
            'image': 'assets/exercises/neck_exercise1.png',
            'instructions': 'Gently flex your neck to relieve tension.',
            'benefits': 'Relieves tension in the neck muscles.',
          },
          {
            'title': 'Neck Rotation',
            'image': 'assets/exercises/neck_exercise2.png',
            'instructions': 'Rotate your neck slowly to increase mobility.',
            'benefits': 'Improves neck flexibility and reduces stiffness.',
          },
        ];
        break;
    // Add more cases for other locations if needed
    }

    // Emit the list of exercises
    emit(exercises);
  }

  void notifyDoctorVisit() {
    emit([]);
    print("Please visit a doctor for chronic pain.");
  }
}
