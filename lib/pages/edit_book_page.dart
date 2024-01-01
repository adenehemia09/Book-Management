import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/edit_book_controler.dart';
import '../controllers/login_controller.dart';
import '../widgets/add_book_form.dart';
import '../widgets/description_form.dart';
import '../widgets/picked_date_form.dart';
import '../widgets/picked_number_form.dart';

class EditBook extends StatelessWidget {
  final int id;

  EditBook({super.key, required this.id});
  final EditBookController editBookController = Get.put(EditBookController());
  final LoginController loginController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Edit BOOK',
          style: TextStyle(fontSize: 18),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            AddBookForm(
              labelText: 'Title Book',
              textEditingController: editBookController.titleController,
            ),
            AddBookForm(
              labelText: 'Author',
              textEditingController: editBookController.authorController,
            ),
            AddBookForm(
              labelText: 'Subtitle',
              textEditingController: editBookController.subtitleController,
            ),
            AddBookForm(
              labelText: 'Publisher',
              textEditingController: editBookController.publisherController,
            ),
            PickedDateForm(
              textEditingController: editBookController.publishedController,
              labelText: 'Published Date',
            ),
            PickedNumberForm(
              textEditingController: editBookController.pagesController,
              labelText: 'Total Pages',
            ),
            PickedNumberForm(
              textEditingController: editBookController.isbnController,
              labelText: 'ISBN',
            ),
            DescriptionForm(
              textEditingController: editBookController.descriptionController,
              labelText: 'Description',
            ),
            Container(
              margin: const EdgeInsets.only(left: 24, right: 24, top: 17),
              width: MediaQuery.of(context).size.width - 100,
              height: 50,
              child: ElevatedButton(
                style: ButtonStyle(
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                      side: BorderSide.none,
                    ),
                  ),
                  backgroundColor: MaterialStateProperty.all<Color>(
                    Colors.pinkAccent,
                  ),
                ),
                onPressed: () {
                  editBookController.editkan(id);
                },
                child: const Text(
                  'Edit Book',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
          ],
        ),
      ),
    );
  }
}
