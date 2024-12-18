import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note/core/routes/app_routes.dart';
import 'package:note/core/services/database_helper.dart';
import 'package:note/core/widget/note_item_body.dart';
import 'package:note/features/home_features/view/widget/floating_button_body.dart';
import 'package:note/features/home_features/view/widget/home_view_body.dart';
import '../../../../core/widget/custom_app_bar.dart';
import '../provider/home_cubit.dart';
import '../provider/home_state.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:customAppBar(
          text: 'My Notes',
          action: () {
            Navigator.pushNamed(context,AppRoutes.searchView);
          },
          icon: Icons.search
      ),
      floatingActionButton:const FloatingButton(),
      body:BlocProvider(
        create: (context) => HomeCubit(DatabaseHelper())..getAllNotes(),
        child: BlocConsumer<HomeCubit, HomeState>(
          listener: (context, state) {},
          builder: (context, state) {
            if (state is GetAllNotesSuccess) {
              final notes = state.notes;
              return ListView.builder(
                itemCount: notes.length,
                itemBuilder: (context, index) {
                  return NoteItemBody(note: notes[index]);
                },
              );
            } else if (state is GetAllNotesLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is GetAllNotesError) {
              return const HomeViewBody();
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
    );
  }


}
