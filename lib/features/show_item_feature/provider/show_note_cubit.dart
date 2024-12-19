import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note/features/home_features/provider/home_cubit.dart';
import 'package:note/features/show_item_feature/provider/show_note_state.dart';
import '../../../../core/services/database_helper.dart';
import '../../../core/model/note_model.dart';

class ShowNoteCubit extends Cubit<ShowNoteState> {
  final DatabaseHelper databaseHelper;
  final HomeCubit homeCubit;

  static ShowNoteCubit get(context) => BlocProvider.of(context);

  ShowNoteCubit(this.databaseHelper, this.homeCubit) : super(ShowNoteInitial());

  Future<void> updateNote(NoteModel note) async {
    emit(NoteUpdateLoading());
    try {
      final result = await databaseHelper.updateNote(note);
      log(result.toString());
      if (result > 0) {
        emit(NoteUpdateSuccess());
         homeCubit.refreshNotes();
      } else {
        emit(NoteUpdateFailure("Failed to Update the note."));
      }
    } catch (e) {
      emit(NoteUpdateFailure(e.toString()));
    }
  }

  Future<void> deleteNote(int id) async {
    emit(NoteDeletedLoading());
    try {
      final result = await databaseHelper.deleteNote(id);
      if (result > 0) {
        emit(NoteDeletedSuccess());
        homeCubit.refreshNotes();
      } else {
        emit(NoteDeletedFailure("Failed to delete the note."));
      }
    } catch (e) {
      emit(NoteDeletedFailure(e.toString()));
    }
  }

  bool visible=true;

  void changeEdit(){
    visible=!visible;
    emit(ChangeVisibleState());
  }

  bool isFavourite=false;

  void toggleFavourite(val){
    isFavourite=val;
    emit(ChangeFavoriteState());
  }
}
