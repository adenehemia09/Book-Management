import 'package:crud_book/controllers/book_controller.dart';
import 'package:crud_book/controllers/user_token.dart';
import 'package:crud_book/pages/main_auth.dart';
import 'package:crud_book/pages/main_page.dart';
import 'package:crud_book/services/delete_book_service.dart';
import 'package:crud_book/services/logout_services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../services/auth_services.dart';

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
