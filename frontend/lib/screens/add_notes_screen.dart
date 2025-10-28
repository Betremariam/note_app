import 'package:flutter/material.dart';
import '../models/user_model.dart';
import '../services/api_service.dart';

class AddNoteScreen extends StatefulWidget {
  final User user;
  const AddNoteScreen({super.key, required this.user});

  @override
  State<AddNoteScreen> createState() => _AddNoteScreenState();
}

class _AddNoteScreenState extends State<AddNoteScreen> {
  final _titleController = TextEditingController();
  final _contentController = TextEditingController();
  bool _loading = false;

  Future<void> _addNote() async {
    setState(() => _loading = true);
    await ApiService.addNote(
      _titleController.text,
      _contentController.text,
      widget.user.id,
    );
    setState(() => _loading = false);
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Add Note')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _titleController,
              decoration: const InputDecoration(labelText: 'Title'),
            ),
            TextField(
              controller: _contentController,
              decoration: const InputDecoration(labelText: 'Content'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _loading ? null : _addNote,
              child:
                  _loading
                      ? const CircularProgressIndicator()
                      : const Text('Save'),
            ),
          ],
        ),
      ),
    );
  }
}
