import 'package:flutter/material.dart';
import '../../../add_note_feature/view/add_note_view.dart';


class FloatingButton extends StatelessWidget {
  const FloatingButton({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor:const Color(0xFFD48445),
      onPressed: (){
        showModalBottomSheet(
          context: context,
          isScrollControlled: true,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
          ),
          builder: (context) {
            return const AddNoteView();
          },
        );
      },
      child: const Icon(Icons.add),
    );
  }
}
