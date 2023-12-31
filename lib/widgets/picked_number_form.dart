import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PickedNumberForm extends StatelessWidget {
  final TextEditingController textEditingController;
  final String labelText;
  const PickedNumberForm(
      {super.key,
      required this.textEditingController,
      required this.labelText});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 20, right: 20, top: 15),
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.grey),
      ),
      child: TextFormField(
        controller: textEditingController,
        decoration: InputDecoration(
          hintText: labelText,
          border: InputBorder.none,
        ),
        keyboardType: TextInputType.number,
        inputFormatters: <TextInputFormatter>[
          FilteringTextInputFormatter.digitsOnly,
        ],
      ),
    );
  }
}
