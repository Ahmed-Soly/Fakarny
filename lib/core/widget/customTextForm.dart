import 'package:flutter/material.dart';

class CustomTextForm extends StatelessWidget {
  const CustomTextForm({super.key,
    this.hintText,
    this.labelText,
    this.textInputType,
    this.obscure=false,
    this.suffix,
    this.prefix,
    this.suffixOnPressed,
    this.onSaved,
    this.max=1,
    this.length=250,
    this.fillColor=0xFF1C2B3B,
  });
  final String? hintText;
  final String? labelText;
  final int max;
  final int length;
  final TextInputType? textInputType;
  final bool obscure;
  final IconData? suffix;
  final IconData? prefix;
  final int fillColor;
  final void Function()? suffixOnPressed;
  final void Function(String?)? onSaved;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
       keyboardType:textInputType,
       obscureText:obscure,
       onSaved:onSaved,
       maxLines:null,
       maxLength: length,
       validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter some text';
          }
          return null;
        },
       decoration:InputDecoration(
       hintText: hintText,
       labelText: labelText,
       hintStyle: const TextStyle(
         color: Colors.white,
       ),
       labelStyle: const TextStyle(
         color: Color(0xff6C7278),
       ),
       suffixIcon:IconButton(
         onPressed:suffixOnPressed,
         icon:Icon(suffix,
           color:Colors.white,),
       ),
       prefixIcon:Icon(prefix,
         color:Colors.white,),
         border: OutlineInputBorder(
           borderRadius: BorderRadius.circular(8.0),
           borderSide: const BorderSide(color: Color(0xff202C40), width: 1.0),
         ),
         focusedBorder: OutlineInputBorder(
           borderRadius: BorderRadius.circular(8.0),
           borderSide: const BorderSide(color: Color(0xff202C40), width: 1.0),
         ),
         enabledBorder: OutlineInputBorder(
           borderRadius: BorderRadius.circular(8.0),
           borderSide: const BorderSide(color: Color(0xff202C40), width: 1.0),
         ),
         errorBorder: OutlineInputBorder(
           borderRadius: BorderRadius.circular(8.0),
           borderSide: const BorderSide(color: Colors.red, width: 1.0),
         ),
         filled: true,
         fillColor: Color(fillColor),
         contentPadding: const EdgeInsets.symmetric(
           horizontal: 16.0,
           vertical: 16.0,
         ),
        )
      );
  }
}
