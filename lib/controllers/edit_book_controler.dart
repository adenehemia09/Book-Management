import 'package:crud_book/controllers/book_controller.dart';
import 'package:crud_book/pages/detitle_book_page.dart';
import 'package:crud_book/pages/edit_book_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../services/edit_book_service.dart';

class EditBookController extends GetxController {
  final ApiEditService _apiService = ApiEditService();
  final BookController _fechBookService = BookController();

  final TextEditingController titleController = TextEditingController();
  final TextEditingController authorController = TextEditingController();
  final TextEditingController subtitleController = TextEditingController();
  final TextEditingController publisherController = TextEditingController();
  final TextEditingController publishedController = TextEditingController();
  final TextEditingController pagesController = TextEditingController();
  final TextEditingController isbnController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  var isLoading = false.obs;

  Future<void> editkan(int id) async {
    try {
      isLoading.value = true;
      final response = await _apiService.editBook(
        id,
        isbnController.text,
        titleController.text,
        authorController.text,
        publishedController.text,
        publisherController.text,
        pagesController.text,
        descriptionController.text,
      );

      if (response != null) {
        showSuccessSnackbar('Edit successfully');
        await _fechBookService.fetchBooks();
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
