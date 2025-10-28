import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/user_model.dart';
import '../models/note_model.dart';

class ApiService {
  static const String baseUrl = 'http://localhost:4000/api';

  // Create user
  static Future<User?> createUser(String name, String email) async {
    final response = await http.post(
      Uri.parse('$baseUrl/users'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'name': name, 'email': email}),
    );

    if (response.statusCode == 200) {
      return User.fromJson(jsonDecode(response.body));
    } else {
      print('Failed to create user: ${response.body}');
      return null;
    }
  }

  // Get all notes for a user
  static Future<List<Note>> getNotes(int userId) async {
    final response = await http.get(Uri.parse('$baseUrl/notes/$userId'));
    if (response.statusCode == 200) {
      List data = jsonDecode(response.body);
      return data.map((e) => Note.fromJson(e)).toList();
    } else {
      throw Exception('Failed to load notes');
    }
  }

  // Add a new note
  static Future<Note?> addNote(String title, String content, int userId) async {
    final response = await http.post(
      Uri.parse('$baseUrl/notes'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'title': title, 'content': content, 'userId': userId}),
    );

    if (response.statusCode == 200) {
      return Note.fromJson(jsonDecode(response.body));
    } else {
      print('Failed to add note: ${response.body}');
      return null;
    }
  }
}
