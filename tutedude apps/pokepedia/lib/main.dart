import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:pokepedia/screens/home_screen.dart';
import 'package:pokepedia/screens/login_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const Pokedex());
}

class Pokedex extends StatelessWidget {
  const Pokedex({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: FirebaseAuth.instance.currentUser != null
          ? const HomeScreen()
          : const LoginScreen(),
    );
  }
}
