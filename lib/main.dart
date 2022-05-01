import 'package:firebasetest/app-body/screens/HomeScreen.dart';
import 'package:flutter/material.dart';

import 'package:firebase_core/firebase_core.dart';

import 'app-body/screens/test.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

// Only update the name, leave the age and address!

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}
