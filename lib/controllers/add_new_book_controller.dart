import 'package:crud_book/controllers/book_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../pages/main_page.dart';
import '../services/add_book_service.dart';

class AddBookController extends GetxController {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController authorController = TextEditingController();
  final TextEditingController subtitleController = TextEditingController();
  final TextEditingController publisherController = TextEditingController();
  final TextEditingController publishedController = TextEditingController();
  final TextEditingController pagesController = TextEditingController();
  final TextEditingController isbnController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController websiteController = TextEditingController();

  final ApiAddService _apiAddService = ApiAddService();
  final BookController _fechBookService = BookController();

  var isLoading = false.obs;

  @override
  void dispose() {
    // Clean up the controller when the widget is removed from the widget tree.
    titleController.dispose();
    authorController.dispose();
    subtitleController.dispose();
    publisherController.dispose();
    publishedController.dispose();
    pagesController.dispose();
    descriptionController.dispose();
    websiteController.dispose();

    super.dispose();
  }

  Future<void> addDataBook() async {
    try {
      isLoading.value = true;
      final response = await _apiAddService.addBook(
        isbnController.text,
        titleController.text,
        authorController.text,
        publishedController.text,
        publisherController.text,
        pagesController.text,
        descriptionController.text,
        subtitleController.text,
        websiteController.text,
      );

      if (response != null) {
        showSuccessSnackbar('Add Data successfully');
        await _fechBookService.fetchBooks();
        Get.offAll(MainPage());
      } else {
        showErrorSnackbar('Invalid response from server');
      }
    } catch (error) {
      print('Error: $error');
      showErrorSnackbar('Edit failed: $error');
    } finally {
      isLoading.value = false;
    }
  }

  void showSuccessSnackbar(String message) {
    Get.snackbar(
      'Success',
      message,
      backgroundColor: Colors.green,
      snackPosition: SnackPosition.BOTTOM,
    );
  }

  void showErrorSnackbar(String message) {
    Get.snackbar(
      'Error',
      message,
      backgroundColor: Colors.red,
      snackPosition: SnackPosition.BOTTOM,
    );
  }
}
