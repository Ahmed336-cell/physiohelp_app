// models/user_model.dart
class UserModel {
  String uid;
  String email;
  String name;
  String location;
  int age;
  String occupation;
  String role; // e.g., "Patient" or "Doctor"

  UserModel({
    required this.uid,
    required this.email,
    required this.name,
    required this.location,
    required this.age,
    required this.occupation,
    required this.role,
  });

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'email': email,
      'name': name,
      'location': location,
      'age': age,
      'occupation': occupation,
      'role': role,
    };
  }

  // Optionally, add a method to create an instance from Firestore document data
  factory UserModel.fromMap(Map<String, dynamic> data) {
    return UserModel(
      uid: data['uid'],
      email: data['email'],
      name: data['name'],
      location: data['location'],
      age: data['age'],
      occupation: data['occupation'],
      role: data['role'],
    );
  }
}
