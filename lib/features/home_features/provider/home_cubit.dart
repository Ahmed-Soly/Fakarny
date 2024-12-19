import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note/core/services/database_helper.dart';
import 'home_state.dart';

class HomeCubit extends Cubit<HomeState>{
  HomeCubit(this.databaseHelper):super(HomeInitial());

  final DatabaseHelper databaseHelper;
  static HomeCubit get(context) => BlocProvider.of(context);

  Future<void> getAllNotes() async {
    emit(GetAllNotesLoading());
    try {
      final notes = await databaseHelper.getAllNotes();
      if(notes.isEmpty){
        emit(GetAllNotesIsEmpty());
      }else
      {
        emit(GetAllNotesSuccess(notes: notes));
      }
    } catch (e) {
      emit(GetAllNotesError(error: e.toString()));
    }
  }

  Future<void> deleteNote(id) async {
    emit(DeleteNoteLoading());
    try {
      await databaseHelper.deleteNote(id);
      refreshNotes();
      emit(DeleteNoteSuccess());
    } catch (e) {
      emit(DeleteNoteError(error: e.toString()));
    }
  }


  void refreshNotes() {
    getAllNotes();
    log('refresh is done');// Re-fetch notes after an insert
  }
}