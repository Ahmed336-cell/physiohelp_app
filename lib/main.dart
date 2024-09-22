import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:physiohelp_app/repo/auth_repository.dart';
import 'package:physiohelp_app/view/auth/login_screen.dart';
import 'package:physiohelp_app/view/home/home_screen.dart';
import 'package:physiohelp_app/viewModel/pain_assesment_viewModel.dart';
import 'package:provider/provider.dart';
import 'cubits/auth_cubit.dart';
import 'firebase_options.dart'; // Ensure you have this file for Firebase options

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(
    MultiProvider(
      providers: [
        Provider<AuthRepository>(create: (_) => AuthRepository()), // Provide AuthRepository
        BlocProvider(create: (context) => AuthCubit(authRepository: context.read<AuthRepository>())), // Pass it to AuthCubit
        BlocProvider(create: (context) => PainAssessmentCubit()), // Pass it to AuthCubit

      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Physical Therapy App',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: SplashScreen(),
    );
  }
}

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => LoginScreen()),
      );
    });

    return SafeArea(
      child: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.teal[100]!, Colors.teal[400]!],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset("assets/logoo.png"),
              const SizedBox(height: 16),
              const Text(
                "PhysioHelp",
                style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 25),
              const Center(
                child: Text(
                  "Welcome to Our Application\nPhysioHelp aims to\ncreate a world free of\nmusculoskeletal disorders.",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.w400),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
