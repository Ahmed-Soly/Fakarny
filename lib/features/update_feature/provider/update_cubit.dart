import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note/features/update_feature/provider/update_state.dart';
import '../../../../core/services/database_helper.dart';
import '../../../core/model/note_model.dart';

class NoteUpdateCubit extends Cubit<NoteUpdateState> {
  final DatabaseHelper databaseHelper;

  NoteUpdateCubit(this.databaseHelper) : super(NoteUpdateInitial());

  Future<void> insertNote(NoteModel note) async {
    emit(NoteUpdateLoading());
    try {
      final result = await databaseHelper.insertNote(note);
      if (result > 0) {
        emit(NoteUpdateSuccess());
        await databaseHelper.getAllNotes();
      } else {
        emit(NoteUpdateFailure("Failed to Update the note."));
      }
    } catch (e) {
      emit(NoteUpdateFailure(e.toString()));
    }
  }
}
