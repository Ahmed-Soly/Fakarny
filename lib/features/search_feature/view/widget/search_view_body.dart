import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note/core/widget/customTextForm.dart';
import '../../../../../generated/assets.dart';
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
      padding: const EdgeInsets.all(12.0),
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
            BlocBuilder<SearchCubit,SearchState>(
                builder:(context,state){
                  if(state is SearchNotesLoading){
                    return const Center(child: CircularProgressIndicator(),);
                  }
                  else if(state is SearchNotesSuccess){
                    return Expanded(child: HomeViewBody(notes:state.notes));
                  }else if(state is SearchNotesEmpty){
                    Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Image.asset(Assets.imagesSearch),
                          const SizedBox(height: 10.0,),
                          const Text('No results found',textAlign: TextAlign.center,),
                        ],
                      ),
                    );
                  }
                  return Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Image.asset(Assets.imagesSearch),
                        const SizedBox(height: 10.0,),
                        const Text('Search to find notes',textAlign: TextAlign.center,),
                      ],
                    ),
                  );
                }
            ),

          ],
        ),
      ),
    );
  }
}
