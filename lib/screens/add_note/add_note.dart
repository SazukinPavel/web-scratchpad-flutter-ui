import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:web_scratchpad/models/note.dart';
import 'package:web_scratchpad/providers/notes_provider.dart';
import 'package:web_scratchpad/assets/constants.dart' as constants;

class AddNote extends StatefulWidget {
  const AddNote({super.key});

  @override
  State<AddNote> createState() => _AddNoteState();
}

class _AddNoteState extends State<AddNote> {
  Note _newNote = Note();

  void _addNote(NotesProvider provider) {
    provider.addNote(_newNote);
    setState(() {
      _newNote = Note();
    });
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    final notesProvider = Provider.of<NotesProvider>(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text(constants.APP_NAME),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Add new note',
              style: TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: 250,
              child: TextField(
                onChanged: (text) => _newNote.title = text,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Title',
                ),
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: 250,
              child: TextField(
                onChanged: (text) => _newNote.description = text,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Description',
                ),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => _addNote(notesProvider),
              child: const Text('Add'),
            ),
          ],
        ),
      ),
    );
  }
}
