import 'package:flutter/material.dart';
import 'package:web_scratchpad/screens/add_note/add_note.dart';
import 'package:web_scratchpad/screens/home/home.dart';

Map<String, Widget Function(BuildContext)> appRoutes = {
  '/notes': (context) => const HomePage(),
  '/notes/add': (context) => const AddNote(),
};
