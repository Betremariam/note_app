import 'package:flutter/material.dart';
import '../models/user_model.dart';
import '../models/note_model.dart';
import '../services/api_service.dart';
import 'add_notes_screen.dart';

class NotesScreen extends StatefulWidget {
  final User user;
  const NotesScreen({super.key, required this.user});

  @override
  State<NotesScreen> createState() => _NotesScreenState();
}

class _NotesScreenState extends State<NotesScreen> {
  List<Note> _notes = [];

  Future<void> _fetchNotes() async {
    final notes = await ApiService.getNotes(widget.user.id);
    setState(() => _notes = notes);
  }

  @override
  void initState() {
    super.initState();
    _fetchNotes();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${widget.user.name}\'s Notes'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () async {
              await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => AddNoteScreen(user: widget.user),
                ),
              );
              _fetchNotes();
            },
          ),
        ],
      ),
      body:
          _notes.isEmpty
              ? const Center(child: Text('No notes yet'))
              : ListView.builder(
                itemCount: _notes.length,
                itemBuilder: (context, index) {
                  final note = _notes[index];
                  return Card(
                    margin: const EdgeInsets.all(8),
                    child: ListTile(
                      title: Text(note.title),
                      subtitle: Text(note.content),
                    ),
                  );
                },
              ),
    );
  }
}
