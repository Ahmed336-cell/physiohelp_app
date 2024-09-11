import 'package:flutter/material.dart';
import 'package:physiohelp_app/view/home/home_screen.dart';
import 'package:physiohelp_app/viewModel/pain_assesment_viewModel.dart';
import 'package:provider/provider.dart';


void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => PainAssessmentViewModel()),
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
        MaterialPageRoute(builder: (context) => HomeScreen()),
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
              )
            ),
          child: Column(
            children: [
              Image.asset("assets/logoo.png" ,),
              const SizedBox(height: 16,),
              const Text("PhysioHelp",style: TextStyle(fontSize: 40 , fontWeight: FontWeight.bold),),
              const SizedBox(height: 25,),
              const Center(
                child: Text(
                  textAlign: TextAlign.center,
                  "Welcome to Our Application\nPhysioHelp our aim is to\ncreate a world free of\nmusculoskeletal disorders.",
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
