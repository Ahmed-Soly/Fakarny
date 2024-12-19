import 'package:flutter/material.dart';

void showDeleteDialog({required BuildContext context,required VoidCallback press}) {
  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: const Text("Delete Note"),
      content: const Text("Are you sure you want to delete this note?"),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text("Cancel"),
        ),
        TextButton(
          onPressed: press,
          child: const Text("Delete", style: TextStyle(color: Colors.red)),
        ),
      ],
    ),
  );
}