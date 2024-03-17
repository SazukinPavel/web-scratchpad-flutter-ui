import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:web_scratchpad/providers/notes_provider.dart';
import 'package:web_scratchpad/screens/home/home.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => NotesProvider()),
      ],
      child: const MyApp(),
    ),
  );
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
