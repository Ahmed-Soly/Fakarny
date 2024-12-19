abstract class NoteInsertState{}

class NoteInsertInitial extends NoteInsertState {}

class NoteInsertLoading extends NoteInsertState {}

class NoteInsertSuccess extends NoteInsertState {}

class NoteInsertFailure extends NoteInsertState {
  final String error;
  NoteInsertFailure(this.error);
}

