import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/editBookControler.dart';
import '../controllers/loginController.dart';
import '../models/bookModel.dart';
import '../widgets/addBookForm.dart';
import '../widgets/descriptionForm.dart';
import '../widgets/pickedDateForm.dart';
import '../widgets/pickedNumberForm.dart';

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
            SizedBox(height: 10,),
            AddBookForm(
              labelText: 'Title Book',
              textEditingController: editBookController.titleController

            ),
            AddBookForm(
              labelText: 'Author',
              textEditingController: editBookController.authorController

            ),
            AddBookForm(
              labelText: 'Subtitle',
              textEditingController: editBookController.subtitleController

            ),
            AddBookForm(
              labelText: 'Publisher',
              textEditingController: editBookController.publisherController

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

            AddBookForm(
              labelText: 'Website',
              textEditingController: editBookController.websiteController,
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
                  //editBookController.saveChanges(id);
                  // print(token);
                  //  addBookController.addBook(token);
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
            SizedBox(height:30,),
          ],
        ),
      ),
    );
  }
}
