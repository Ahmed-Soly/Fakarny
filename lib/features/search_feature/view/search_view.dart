import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note/core/services/get_it.dart';
import 'package:note/features/search_feature/view/widget/search_view_body.dart';

import '../../../core/services/database_helper.dart';
import '../provider/search_cubit.dart';



class SearchView extends StatelessWidget {
  const SearchView({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SearchCubit(getIt.get<DatabaseHelper>()) ,
      child: const Scaffold(
        body: SafeArea(
            child: SearchViewBody()
        ),
      ),
    );
  }
}
