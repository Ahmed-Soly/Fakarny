import 'package:note/features/home_features/domain/entity/note_entity.dart';

class NoteModel extends NoteEntity{
  NoteModel({
    required super.id,
    required super.title,
    required super.description,
    required super.date,
    required super.color,
  });

  factory NoteModel.fromJson(Map<String, dynamic> json) => NoteModel(
    id: json['id'] as int,
    title: json['title'] as String,
    description: json['description'] as String,
    date: json['date'] as String,
    color: json['color'] as int,
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'title': title,
    'description': description,
    'date': date,
    'color': color,
  };
}