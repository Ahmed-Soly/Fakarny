import 'package:flutter/material.dart';
import '../../../../core/model/note_model.dart';
import '../../../../core/widget/customTextForm.dart';
import '../../../../core/widget/custom_elevated_button.dart';
import '../../../../core/model/color_model.dart';
import '../../../home_features/view/widget/color_list_body.dart';
import '../../provider/insert_cubit.dart';



class AddNoteBody extends StatefulWidget {
  const AddNoteBody({super.key});

  @override
  State<AddNoteBody> createState() => _AddNoteBodyState();
}

class _AddNoteBodyState extends State<AddNoteBody> {
  late String title, content,date='1/1/1';
  late int colorIndex=0;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 16,
        right: 16,
        top: 16,
        bottom: MediaQuery.of(context).viewInsets.bottom,// because appear keyboard
      ),
      child: Form(
        key: formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              'Create your note',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            CustomTextForm(
              hintText:'Title',
              onSaved: (value) {
                title=value!;
              },
              prefix:Icons.textsms_outlined,
            ),
            const SizedBox(height: 16),
            CustomTextForm(
              hintText:'Description',
              textInputType:TextInputType.multiline,
              onSaved: (value) {
                content=value!;
              },
              prefix:Icons.textsms_outlined,
            ),
            const SizedBox(height: 16),
            ColorList(
              onColorSelected: (int value) {
                colorIndex=value;
            },),
            const SizedBox(
                height: 16
            ),
            CustomElevationButton(
              action: () {
                if (formKey.currentState!.validate()) {
                  formKey.currentState!.save();
                  NoteInsertCubit.get(context).insertNote(
                    NoteModel(
                      title: title,
                      content: content,
                      date: date,
                      color: colorsList[colorIndex].color,
                      pin: 0,
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
