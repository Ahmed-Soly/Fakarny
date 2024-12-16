import 'package:flutter/material.dart';
import 'package:note/features/search_feature/presentation/view/widget/search_view_body.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SearchViewBody(),
    );
  }
}
