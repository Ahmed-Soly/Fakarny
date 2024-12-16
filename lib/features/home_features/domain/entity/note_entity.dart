class NoteEntity{
  final int? id;
  final String title;
  final String description;
  final String date;
  final int color;
  NoteEntity({
    this.id,
    required this.title,
    required this.description,
    required this.date,
    required this.color,
  });
}