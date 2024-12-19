import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note/core/routes/app_routes.dart';
import 'package:note/features/home_features/view/widget/floating_button_body.dart';
import 'package:note/features/home_features/view/widget/home_empty.dart';
import 'package:note/features/home_features/view/widget/home_view_body.dart';
import '../../../../core/widget/custom_app_bar.dart';
import '../../../core/services/get_it.dart';
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
          icon: const Icon(Icons.search),
      ),
      floatingActionButton:const FloatingButton(),
      body:BlocProvider(
        create: (context) => getIt.get<HomeCubit>()..getAllNotes(),
        child: BlocBuilder<HomeCubit, HomeState>(
          builder: (context, state) {
            if (state is GetAllNotesSuccess) {
              final notes = state.notes;
              return HomeViewBody(notes: notes);
            } else if (state is GetAllNotesLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is GetAllNotesIsEmpty) {
              return const HomeEmpty();
            }else {
              return const Center(child:Text('some thing went wrong',textAlign: TextAlign.center,));
            }
          },
        ),
      ),
    );
  }


}
