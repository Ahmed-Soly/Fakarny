import 'package:note/core/model/note_model.dart';

abstract class SearchState {}

class InitialSearchState extends SearchState {}

class SearchNotesLoading extends SearchState {}

class SearchNotesSuccess extends SearchState {
  final List<NoteModel> notes;
  SearchNotesSuccess({required this.notes});
}
class SearchNotesEmpty extends SearchState {}
class SearchNotesFailure extends SearchState {}