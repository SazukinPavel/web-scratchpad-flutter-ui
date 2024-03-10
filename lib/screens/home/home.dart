import 'package:flutter/material.dart';
import 'package:web_scratchpad/models/note.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Note> _notes = <Note>[];
  Note _newNote = Note();

  void _addNote() {
    setState(() {
      _notes = [
        ..._notes,
        Note(description: _newNote.description, title: _newNote.title)
      ];
      _newNote = Note();
    });
    Navigator.pop(context);
  }

  void _deleteNote(int index) {
    _notes.remove(_notes[index]);

    setState(() {
      _notes = [
        ..._notes,
      ];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: ListView.builder(
          padding: const EdgeInsets.all(8),
          itemCount: _notes.length,
          itemBuilder: (BuildContext context, int index) {
            return Card(
                child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                ListTile(
                    leading: const Icon(Icons.note),
                    title: Text(
                      _notes[index].title,
                      style: const TextStyle(fontSize: 20.00),
                    ),
                    subtitle: Text(_notes[index].description)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    IconButton(
                      icon: const Icon(Icons.delete),
                      tooltip: 'Delete',
                      onPressed: () => _deleteNote(index),
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
              onPressed: () => showDialog<String>(
                  context: context,
                  builder: (BuildContext context) => Dialog(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
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
                                  onChanged: (text) =>
                                      _newNote.description = text,
                                  decoration: const InputDecoration(
                                    border: OutlineInputBorder(),
                                    labelText: 'Description',
                                  ),
                                ),
                              ),
                              const SizedBox(height: 20),
                              TextButton(
                                onPressed: _addNote,
                                child: const Text('Add'),
                              ),
                            ],
                          ),
                        ),
                      )),
              tooltip: 'Add new note',
              child: const Icon(Icons.add),
            ),
          ),
        ],
      ),
    );
  }
}
