import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SvgPicture.asset('assets/images/search.svg'),
      ],
    );
  }
}
