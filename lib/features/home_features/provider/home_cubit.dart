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
      emit(GetAllNotesSuccess(notes: notes));
    } catch (e) {
      emit(GetAllNotesError(error: e.toString()));
    }
  }

}