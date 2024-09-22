import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../model/patient.dart';

class AuthRepository {
  final FirebaseAuth _firebaseAuth;
  final FirebaseFirestore _firestore;

  AuthRepository({
    FirebaseAuth? firebaseAuth,
    FirebaseFirestore? firestore,
  })  : _firebaseAuth = firebaseAuth ?? FirebaseAuth.instance,
        _firestore = firestore ?? FirebaseFirestore.instance;

  Future<void> login(String email, String password) async {
    await _firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
  }

  Future<void> signup(
      String email,
      String password,
      String role, {
        required String name,
        required String location,
        required String occupation,
        required int age,
      }) async {
    // Create user with Firebase Auth
    UserCredential userCredential = await _firebaseAuth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );

    // Create UserModel instance
    UserModel user = UserModel(
      uid: userCredential.user!.uid,
      email: email,
      name: name,
      location: location,
      age: age,
      occupation: occupation,
      role: role,
    );

    // Add user data to Firestore
    await _firestore.collection('users').doc(user.uid).set(user.toMap());
  }

  User? get currentUser => _firebaseAuth.currentUser;
}
