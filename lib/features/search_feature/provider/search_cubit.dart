import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note/core/services/database_helper.dart';
import 'package:note/features/search_feature/provider/search_state.dart';
import '../../../core/model/note_model.dart';


class SearchCubit extends Cubit<SearchState> {
  final DatabaseHelper databaseHelper;

  SearchCubit get(context) => BlocProvider.of(context);

  SearchCubit(this.databaseHelper) : super(InitialSearchState());


  Future<void> searchNotes(String query) async {
    List<NoteModel> notes = await databaseHelper.searchNotes(query);
    if (notes.isEmpty) {
      emit(SearchNotesEmpty());
    } else {
      emit(SearchNotesSuccess(notes: notes));
    }
  }
}