import '../../../../core/model/note_model.dart';

abstract class HomeState {}

class HomeInitial extends HomeState {}

class GetAllNotesLoading extends HomeState {}

class GetAllNotesIsEmpty extends HomeState {}
class GetAllNotesSuccess extends HomeState {
  List<NoteModel> notes;
  GetAllNotesSuccess({required this.notes});
}
class GetAllNotesError extends HomeState {
  final String error;
  GetAllNotesError({required this.error});
}

class DeleteNoteLoading extends HomeState {}
class DeleteNoteSuccess extends HomeState {}
class DeleteNoteError extends HomeState {
  final String error;
  DeleteNoteError({required this.error});
}


