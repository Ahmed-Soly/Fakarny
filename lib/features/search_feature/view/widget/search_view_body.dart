import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note/core/widget/customTextForm.dart';
import 'package:note/core/widget/snake_bar.dart';
import 'package:note/features/search_feature/view/widget/search_empty.dart';
import '../../../home_features/view/widget/home_view_body.dart';
import '../../provider/search_cubit.dart';
import '../../provider/search_state.dart';

class SearchViewBody extends StatefulWidget {
  const SearchViewBody({super.key});

  @override
  State<SearchViewBody> createState() => _SearchViewBodyState();
}

class _SearchViewBodyState extends State<SearchViewBody> {
  TextEditingController search=TextEditingController();
  GlobalKey<FormState> formKey=GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Form(
        key: formKey,
        child: Column(
          children: [
            CustomTextForm(
              hintText:'search',
              controller:search,
              suffix: Icons.search,
              fillColor: 0xFF191A1D,
              suffixOnPressed:(){
                if(formKey.currentState!.validate()){
                  BlocProvider.of<SearchCubit>(context).searchNotes(search.text);
                }
              },
            ),
            const SizedBox(height:15,),
            BlocConsumer<SearchCubit,SearchState>(
              listener:(context,state){
                if(state is SearchNotesEmpty){
                  showSnackBar(context, 'No results found');
                }
              },
                builder:(context,state){
                  if(state is SearchNotesLoading){
                    return const Center(child: CircularProgressIndicator(),);
                  }
                  else if(state is SearchNotesSuccess){
                    return Expanded(child: HomeViewBody(notes:state.notes));
                  }else if(state is SearchNotesEmpty){
                    return const SearchEmpty();
                  }
                  return const SearchEmpty();
                }
            ),
          ],
        ),
      ),
    );
  }
}
