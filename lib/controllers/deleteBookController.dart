import 'package:crud_book/controllers/bookController.dart';
import 'package:crud_book/pages/mainAuth.dart';
import 'package:crud_book/pages/mainPage.dart';
import 'package:crud_book/services/deleteBookService.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class DeleteBookController extends GetxController {
  final ApiDeleteService _apiDeleteService = ApiDeleteService();
  final BookController _fechBookService = BookController();

  var isLoading = false.obs;

  Future<void> deleteBook(int id) async {
    try {
      isLoading.value = true;
      final response = await _apiDeleteService.deleteBook(id);

      if (response != null) {
        showSuccessSnackbar('Delete successfully');
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
