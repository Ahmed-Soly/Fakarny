import 'package:flutter/material.dart';
import 'package:note/core/utils/app_text_styles.dart';
import '../model/note_model.dart';
import '../routes/app_routes.dart';

class NoteItemBody extends StatelessWidget {
  const NoteItemBody({super.key, required this.note});
  final NoteModel note;

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Stack(
        alignment: AlignmentDirectional.bottomEnd,
        children: [
          Container(
            width: double.infinity,
            height: height * 0.15,
            decoration: BoxDecoration(
              color: Color(note.color),
              borderRadius: const BorderRadius.all(Radius.circular(8)),
            ),
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                          child: Text(
                        note.title,
                        style:AppTextStyles.bold16,
                        overflow: TextOverflow.ellipsis,
                      )
                      ),
                      const SizedBox(
                        width: 5.0,
                      ),
                      Text(note.date),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Expanded(
                    child: Text(
                      note.content,
                      style:AppTextStyles.regular14,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
          ),
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, AppRoutes.showItemView,arguments: note);
            },
            icon: note.pin == 1 ?
            const Icon(Icons.push_pin) :
            const SizedBox.shrink(),
          )
        ],
      ),
    );
  }
}
