class Note {
  final int id;
  final String title;
  final String content;
  final int userId;

  Note({
    required this.id,
    required this.title,
    required this.content,
    required this.userId,
  });

  factory Note.fromJson(Map<String, dynamic> json) {
    return Note(
      id: json['id'],
      title: json['title'],
      content: json['content'],
      userId: json['userId'],
    );
  }
}
