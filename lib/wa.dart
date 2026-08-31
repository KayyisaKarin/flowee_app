import 'package:flowee_app/screen/wa_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp()); //inti dari segala inti
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Basic Widget Flutter',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const WaScreen(),
    );
  }
}