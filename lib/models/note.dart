class Note {
  String title;

  String description;

  int? createdAt;

  Note({
    this.title = '',
    this.description = '',
  }) {
    createdAt = DateTime.now().millisecondsSinceEpoch;
  }
}