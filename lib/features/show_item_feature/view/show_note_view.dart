import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note/core/routes/app_routes.dart';
import 'package:note/core/services/get_it.dart';
import 'package:note/core/widget/snake_bar.dart';
import 'package:note/features/show_item_feature/view/widget/show_item_view_body.dart';
import '../../../core/model/note_model.dart';
import '../../../core/services/database_helper.dart';
import '../../../core/widget/show_note_app_bar.dart';
import '../../home_features/provider/home_cubit.dart';
import '../provider/show_note_cubit.dart';
import '../provider/show_note_state.dart';

class ShowItemView extends StatelessWidget {
  const ShowItemView({super.key, required this.note});
  final NoteModel note;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ShowNoteCubit(getIt.get<DatabaseHelper>(),getIt.get<HomeCubit>()),
      child: BlocConsumer<ShowNoteCubit, ShowNoteState>(
        listener: (context, state) {
          if(state is NoteDeletedSuccess){
            showSnackBar(context,'Note Deleted Successfully');
            Navigator.pop(context);
          }
          if(state is NoteUpdateSuccess){
            showSnackBar(context,'Note Updated Successfully');
            Navigator.pushReplacementNamed(context, AppRoutes.homeView);
          }
          if(state is NoteUpdateFailure){
            showSnackBar(context,state.error);
            Navigator.pushReplacementNamed(context, AppRoutes.homeView);
          }
        },
        builder:(context, state) {
          return Scaffold(
            appBar: customViewNoteAppBar(
              text:note.title,
              action: () {
                ShowNoteCubit.get(context).changeEdit();
              },
              icon: Visibility(
                visible:ShowNoteCubit.get(context).visible,
                child:const Icon(Icons.edit),
              ),
              widget: BackButton(onPressed: () => Navigator.pop(context)),
            ),
            body: ShowNoteViewBody(note: note,),
          );
        },
      ),
    );
  }
}
