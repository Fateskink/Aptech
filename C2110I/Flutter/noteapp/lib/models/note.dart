class Note {
  String content;
  bool isImportant;
  late DateTime createdAt;
  Note({
    required this.content,
    required this.isImportant,
  }) : createdAt = DateTime.now(); // Gán thời gian hiện tại cho createdAt
}