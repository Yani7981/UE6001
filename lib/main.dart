import 'package:flutter/material.dart';
import 'home_page.dart';

void main() {
  runApp(const PrakritiApp());
}

class PrakritiApp extends StatelessWidget {
  const PrakritiApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Know Your Prakriti',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.teal,
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}
