import 'package:crud_book/controllers/bookController.dart';
import 'package:crud_book/controllers/usetoken.dart';
import 'package:crud_book/pages/mainAuth.dart';
import 'package:crud_book/pages/mainPage.dart';
import 'package:crud_book/services/deleteBookService.dart';
import 'package:crud_book/services/logoutServices.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../services/authServices.dart';


class LogoutController extends GetxController {
  final ApiLogoutService _logoutService = ApiLogoutService();
  final TokenManager tokenManager = Get.put(TokenManager());
  

  var isLoading = false.obs;

  Future<void> logout() async {
    try {
      isLoading.value = true;
      final response = await _logoutService.logout();

      if (response != null) {
        showSuccessSnackbar('Logout successfully');
        tokenManager.setToken('');
        Get.offAll(MainAuth());
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
