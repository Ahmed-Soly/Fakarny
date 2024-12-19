import 'package:flutter/material.dart';
import '../../../../core/function_helper/get_date_now.dart';
import '../../../../core/model/note_model.dart';
import '../../../../core/widget/customTextForm.dart';
import '../../../../core/widget/custom_elevated_button.dart';
import '../../../../core/model/color_model.dart';
import '../../../../core/widget/typing_icon.dart';
import '../../../home_features/view/widget/color_list_body.dart';
import '../../provider/insert_cubit.dart';

class AddNoteBody extends StatefulWidget {
  const AddNoteBody({super.key});

  @override
  State<AddNoteBody> createState() => _AddNoteBodyState();
}

class _AddNoteBodyState extends State<AddNoteBody> {
  late String title, content;
  late int colorIndex=0;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  late bool isPinned=false;
  @override
  Widget build(BuildContext context) {
    var cubit=NoteInsertCubit.get(context);
    return Padding(
      padding: EdgeInsets.only(
        left: 16,
        right: 16,
        top: 16,
        bottom: MediaQuery.of(context).viewInsets.bottom,// because appear keyboard
      ),
      child:Form(
        key: formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              'Create your note',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            CustomTextForm(
              hintText:'Title',
              onSaved: (value) {
                title=value!;
              },
              prefix: const TypingIcon(),
            ),
            const SizedBox(height: 16),
            CustomTextForm(
              hintText:'Description',
              max: 2,
              length:300,
              textInputType:TextInputType.multiline,
              onSaved: (value) {
                content=value!;
              },
              prefix:const TypingIcon(),
            ),
            const SizedBox(height: 10),
            ColorList(
              onColorSelected: (int value) {
                colorIndex=value;
              },),
            const SizedBox(
                height: 10
            ),
            Row(
              children: [
                Checkbox(
                  value: isPinned,
                  onChanged: (val){
                    setState(() {
                      isPinned=val!;
                    });
                  }, // Directly pass the function
                ),
                const Text('Mark as pinned'),
              ],
            ),
            CustomElevationButton(
              action: () {
                if (formKey.currentState!.validate()) {
                  formKey.currentState!.save();
                  cubit.insertNote(
                    NoteModel(
                      title: title,
                      content: content,
                      date: getDateNow(),
                      color: colorsList[colorIndex].color,
                      pin: isPinned?1:0,
                    ),
                  );
                  Navigator.pop(context);
                }
              },
              text: 'Add note',
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
