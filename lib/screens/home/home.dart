import 'package:flutter/material.dart';
import 'package:web_scratchpad/providers/notes_provider.dart';
import 'package:web_scratchpad/screens/add_note/add_note.dart';
import 'package:provider/provider.dart';
import 'package:web_scratchpad/assets/constants.dart' as constants;

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  void _addNote() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const AddNote()),
    );
  }

  @override
  Widget build(BuildContext context) {
    final notesProvider = Provider.of<NotesProvider>(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text(constants.APP_NAME),
      ),
      body: ListView.builder(
          padding: const EdgeInsets.all(8),
          itemCount: notesProvider.value.length,
          itemBuilder: (BuildContext context, int index) {
            return Card(
                child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                ListTile(
                    leading: const Icon(Icons.note),
                    title: Text(
                      notesProvider.value[index].title,
                      style: const TextStyle(fontSize: 20.00),
                    ),
                    subtitle: Text(notesProvider.value[index].description)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    IconButton(
                      icon: const Icon(Icons.delete),
                      tooltip: 'Delete',
                      onPressed: () => notesProvider.deleteNote(index),
                    ),
                  ],
                ),
              ],
            ));
          }),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            padding: const EdgeInsets.all(2.50),
            child: FloatingActionButton(
              onPressed: _addNote,
              tooltip: 'Add new note',
              child: const Icon(Icons.add),
            ),
          ),
        ],
      ),
    );
  }
}
