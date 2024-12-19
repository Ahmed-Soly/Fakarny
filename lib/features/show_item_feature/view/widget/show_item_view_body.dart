import 'package:flutter/material.dart';
import 'package:note/core/function_helper/get_date_now.dart';
import 'package:note/core/widget/customTextForm.dart';
import '../../../../core/model/note_model.dart';
import '../../../../core/widget/custom_elevated_button.dart';
import '../../../../core/widget/delete_dialog.dart';
import '../../../../core/widget/typing_icon.dart';
import '../../provider/show_note_cubit.dart';

class ShowNoteViewBody extends StatefulWidget {
  const ShowNoteViewBody({super.key, required this.note});
  final NoteModel note;

  @override
  State<ShowNoteViewBody> createState() => _ShowNoteViewBodyState();
}

class _ShowNoteViewBodyState extends State<ShowNoteViewBody> {
  late TextEditingController titleController;
  late TextEditingController contentController;
  @override
  void initState() {
    titleController = TextEditingController(text: widget.note.title);
    contentController = TextEditingController(text: widget.note.content);
    ShowNoteCubit.get(context).isFavourite=widget.note.pin==1?true:false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var cubit=ShowNoteCubit.get(context);
    return CustomScrollView(
      slivers: [
        SliverFillRemaining(
          hasScrollBody: false,
          child:  Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment:CrossAxisAlignment.start,
              children: [
                CustomTextForm(
                  fillColor: 0xFF191A1D,
                  prefix:Visibility(
                      visible: !cubit.visible,
                      child: const TypingIcon(),
                  ),
                  enable: !cubit.visible,
                  controller:titleController,
                ),
                const SizedBox(height: 15),
                CustomTextForm(
                  fillColor: 0xFF191A1D,
                  enable: !cubit.visible,
                  controller:contentController,
                  max: 15,
                  length:300,
                  prefix:Visibility(
                    visible: !cubit.visible,
                    child: const TypingIcon(),
                  ),
                  textInputType:TextInputType.multiline,
                ),
                Visibility(
                  visible: !cubit.visible,
                  child: Row(
                    children: [
                      Checkbox(
                        value: cubit.isFavourite,
                        onChanged:(value){
                          cubit.toggleFavourite(value);
                        } // Toggle favorite
                      ),
                      const Text('Mark as pinned'),
                    ],
                  ),
                ),
                const Expanded(
                    child: SizedBox(height:20.0),
                ),
                if(cubit.visible)
                  CustomElevationButton(
                    action: () {
                      showDeleteDialog(
                          context: context,
                          press: (){
                            cubit.deleteNote(widget.note.id!);
                            Navigator.pop(context);
                          }
                      );
                    },
                    text: 'Delete',)
                else
                  CustomElevationButton(
                    action: () {
                      cubit.updateNote(
                        NoteModel(
                          id: widget.note.id,
                          title: titleController.text,
                          content: contentController.text,
                          date: getDateNow(),
                          color: widget.note.color,
                          pin: cubit.isFavourite?1:0,
                        ),
                      );
                    },
                    text: 'Save',),
              ],
            ),
          ),
        )
      ],
    );
  }
}



