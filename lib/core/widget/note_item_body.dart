import 'package:flutter/material.dart';

import '../model/note_model.dart';


class NoteItemBody extends StatelessWidget {
  const NoteItemBody({super.key, required this.note});
  final NoteModel note;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Container(
        width: double.infinity,
        height: MediaQuery.sizeOf(context).height * 0.3,
        decoration:const BoxDecoration(
          color: Colors.red,
          borderRadius: BorderRadius.all(Radius.circular(8)),
        ),
        child:Column(
          children: [
            Text(note.title),
            const SizedBox(height: 10,),
            Text(note.content),
            const Spacer(),
            Text(note.date),
          ],
        ),
      ),
    );
  }
}
