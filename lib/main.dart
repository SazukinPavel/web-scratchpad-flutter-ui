import 'package:flutter/material.dart';
import 'package:web_scratchpad/screens/home/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Web Scratchpad Flutter UI',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromARGB(255, 111, 4, 133)),
        useMaterial3: true,
      ),
      home: const HomePage(title: 'Web Scratchpad Flutter UI'),
    );
  }
}