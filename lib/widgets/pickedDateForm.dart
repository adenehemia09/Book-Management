import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class PickedDateForm extends StatelessWidget {
  final TextEditingController textEditingController;
  final String labelText;
  const PickedDateForm({super.key, required this.textEditingController, required this.labelText});

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
        ),
        onTap: () async {
          DateTime? pickedDate = await showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2000),
            lastDate: DateTime.now(),
          );

          if (pickedDate != null && pickedDate != DateTime.now()) {
            // Gunakan DateFormat untuk mengonversi dan memformat tanggal
            String formattedDate =
            DateFormat("yyyy-MM-dd HH:mm:ss").format(pickedDate);
            textEditingController.text = formattedDate;
          }
        },
      ),
    );
  }
}
