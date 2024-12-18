import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:note/core/services/database_helper.dart';
import 'package:note/core/services/get_it.dart';
import 'package:note/features/add_note_feature/view/widget/add_note_view_body.dart';
import 'package:note/features/home_features/provider/home_cubit.dart';
import '../../../../core/widget/snake_bar.dart';
import '../provider/insert_cubit.dart';
import '../provider/insert_state.dart';

class AddNoteView extends StatelessWidget {
  const AddNoteView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NoteInsertCubit(getIt.get<DatabaseHelper>(),getIt.get<HomeCubit>()),
      child: BlocConsumer<NoteInsertCubit,NoteInsertState>(
        listener: (context,state){
          if(state is NoteInsertSuccess){
            showSnackBar(context, "Note Inserted successfully", Colors.teal);
          }
          if(state is NoteInsertFailure){
            showSnackBar(context,state.error, Colors.teal);
          }
        },
        builder: (context,state){
            return ModalProgressHUD(
                inAsyncCall: state is NoteInsertLoading,
                child: const AddNoteBody(),
            );
            },
      ),
    );
  }
}
