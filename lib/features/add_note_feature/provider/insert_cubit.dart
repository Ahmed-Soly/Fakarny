import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note/features/home_features/provider/home_cubit.dart';
import '../../../../core/model/note_model.dart';
import '../../../../core/services/database_helper.dart';
import 'insert_state.dart';

class NoteInsertCubit extends Cubit<NoteInsertState> {
  final DatabaseHelper databaseHelper;
  final HomeCubit homeCubit;

  NoteInsertCubit(this.databaseHelper, this.homeCubit) : super(NoteInsertInitial());

  static NoteInsertCubit get(context) => BlocProvider.of(context);

  Future<void> insertNote(NoteModel note) async {
    emit(NoteInsertLoading());
    try {
      final result = await databaseHelper.insertNote(note);
      if (result > 0) {
        emit(NoteInsertSuccess());
        homeCubit.refreshNotes();
      } else {
        emit(NoteInsertFailure("Failed to insert the note."));
      }
    } catch (e) {
      emit(NoteInsertFailure(e.toString()));
    }
  }
}
