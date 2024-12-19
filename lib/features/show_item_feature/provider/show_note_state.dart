abstract class ShowNoteState{}

class ShowNoteInitial extends ShowNoteState{}

class NoteUpdateLoading extends ShowNoteState{}

class NoteUpdateSuccess extends ShowNoteState{}

class NoteUpdateFailure extends ShowNoteState{
  final String error;
  NoteUpdateFailure(this.error);
}


class NoteDeletedLoading extends ShowNoteState{}

class NoteDeletedSuccess extends ShowNoteState{}

class NoteDeletedFailure extends ShowNoteState{
  final String error;
  NoteDeletedFailure(this.error);
}

class ChangeVisibleState extends ShowNoteState{}
class ChangeFavoriteState extends ShowNoteState{}
