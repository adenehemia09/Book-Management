import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/add_new_book_controller.dart';
import '../controllers/login_controller.dart';
import '../widgets/add_book_form.dart';
import '../widgets/description_form.dart';
import '../widgets/picked_date_form.dart';
import '../widgets/picked_number_form.dart';

class ADDNewBook extends StatelessWidget {
  final AddBookController addBookController = Get.put(AddBookController());

  ADDNewBook({super.key});

  @override
  Widget build(BuildContext context) {
    // final String token = loginController.token;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'ADD NEW BOOK',
          style: TextStyle(fontSize: 18),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 10,
            ),
            AddBookForm(
              labelText: 'Title Book',
              textEditingController: addBookController.titleController,
            ),
            AddBookForm(
              labelText: 'Author',
              textEditingController: addBookController.authorController,
            ),
            AddBookForm(
              labelText: 'Subtitle',
              textEditingController: addBookController.subtitleController,
            ),
            AddBookForm(
              labelText: 'Publisher',
              textEditingController: addBookController.publisherController,
            ),
            PickedDateForm(
              textEditingController: addBookController.publishedController,
              labelText: 'Published Date',
            ),
            PickedNumberForm(
              textEditingController: addBookController.pagesController,
              labelText: 'Total Pages',
            ),
            PickedNumberForm(
              textEditingController: addBookController.isbnController,
              labelText: 'ISBN',
            ),
            DescriptionForm(
              textEditingController: addBookController.descriptionController,
              labelText: 'Description',
            ),
            AddBookForm(
              labelText: 'Website',
              textEditingController: addBookController.websiteController,
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
                  addBookController.addDataBook();
                  // print(token);
                  //  addBookController.addBook(token);
                },
                child: const Text(
                  'Add Book',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
          ],
        ),
      ),
    );
  }
}
