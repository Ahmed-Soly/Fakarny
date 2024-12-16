import 'package:flutter/material.dart';

class OrDivider extends StatelessWidget {
  const OrDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Expanded(
            child: Divider(
              thickness: 1,
              color: Color(0xffEDF1F3),
            )
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal:16.0),
          child: Text('Or',style: TextStyle(
              color: Colors.grey,
              fontSize: 12,
          ),),
        ),
        Expanded(
            child: Divider(
              thickness: 1,
              color: Color(0xffEDF1F3),
            )
        ),
      ],
    );
  }
}
