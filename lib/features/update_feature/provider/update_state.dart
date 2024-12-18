abstract class NoteUpdateState{}

class NoteUpdateInitial extends NoteUpdateState {}

class NoteUpdateLoading extends NoteUpdateState {}

class NoteUpdateSuccess extends NoteUpdateState {}

class NoteUpdateFailure extends NoteUpdateState {
  final String error;
  NoteUpdateFailure(this.error);
}
