class NoteModel {
  final int? id;
  final String title;
  final String content;
  final String date;
  final int pin;
  final int color;

  NoteModel({
    this.id,
    required this.title,
    required this.content,
    required this.date,
    required this.color,
    required this.pin,
  });

  factory NoteModel.fromJson(Map<String, dynamic> json) => NoteModel(
    id: json['id'] as int,
    title: json['title'] as String,
    content: json['content'] as String,
    date: json['date'] as String,
    color: json['color'] as int,
    pin: json['pin'] as int,
  );

  // to handle list of Notes come from database

  static List<NoteModel> fromList(List<Map<String, dynamic>> jsonList) {
    return jsonList.map((json) => NoteModel.fromJson(json)).toList();
  }

  Map<String, dynamic> toMap() => {
    'id': id,
    'title': title,
    'content': content,
    'date': date,
    'color': color,
    'pin': pin,
  };
}