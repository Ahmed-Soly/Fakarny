import 'package:flutter/material.dart';



class CustomButton extends StatelessWidget {
   const CustomButton({
     super.key,
     required this.text,
     required this.onPressed,
     this.width=double.infinity,
   });
  final String text;
  final double? width;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Container(
      width:width,
      decoration:BoxDecoration(
        color:const Color(0xff1D61E7),
        borderRadius:BorderRadius.circular(10.0),
      ),
      child:TextButton(
        onPressed: onPressed,
        child: Text(text,
            style:const TextStyle(
              color:Colors.white,
              fontSize:16.0,
            ),)
      ),
    );
  }
}
