import 'package:flutter/material.dart';

class DescriptionForm extends StatelessWidget {
  final TextEditingController textEditingController;
  final String labelText;
  const DescriptionForm({super.key, required this.textEditingController, required this.labelText});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 20, right: 20, top: 15),
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.grey),
      ),
      child: TextFormField(
        controller: textEditingController,
        decoration: InputDecoration(
          labelText: labelText,
          border: InputBorder.none,
        ),
        maxLines: 5,
      ),
    );
  }
}
