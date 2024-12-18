import 'package:flutter/material.dart';
import 'package:note/core/widget/customTextForm.dart';

import '../../../../../generated/assets.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const CustomTextForm(
          hintText:'Search',
          suffix: Icons.search,
          fillColor: 0xFF191A1D,

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
    );
  }
}
