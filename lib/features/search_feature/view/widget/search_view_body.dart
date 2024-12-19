import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note/core/widget/customTextForm.dart';

import '../../../../../generated/assets.dart';
import '../../provider/search_cubit.dart';

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
            Expanded(
              child: CustomScrollView(
                slivers: [
                  SliverToBoxAdapter(
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Image.asset(Assets.imagesSearch),
                          const SizedBox(height: 10.0,),
                          const Text('No results found',textAlign: TextAlign.center,),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
