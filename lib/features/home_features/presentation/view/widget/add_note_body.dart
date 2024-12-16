import 'package:flutter/material.dart';

import '../../../../../core/widget/customTextForm.dart';
import '../../../../../core/widget/custom_elevated_button.dart';
import 'color_list.dart';

class AddNoteBody extends StatefulWidget {
  const AddNoteBody({super.key});

  @override
  State<AddNoteBody> createState() => _AddNoteBodyState();
}

class _AddNoteBodyState extends State<AddNoteBody> {
  late String title, description,date;
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
                description=value!;
              },
              prefix:Icons.textsms_outlined,
            ),
            const SizedBox(height: 16),
            const ColorList(),
            const SizedBox(height: 16),
            CustomElevationButton(
              action: () {
                if (formKey.currentState!.validate()) {
                  formKey.currentState!.save();// Refresh the UI
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
