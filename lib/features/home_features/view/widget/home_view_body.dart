import 'package:flutter/material.dart';
import 'package:note/core/model/note_model.dart';

import '../../../../core/routes/app_routes.dart';
import '../../../../core/widget/note_item_body.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key, required this.notes});
  final List<NoteModel> notes;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: notes.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: (){
            Navigator.pushNamed(context, AppRoutes.showItemView,arguments: notes[index]);
          },
          child: NoteItemBody(
            note: notes[index],
          ),
        );
      },
    );
  }
}
