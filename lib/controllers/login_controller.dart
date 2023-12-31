import 'package:crud_book/controllers/user_controller.dart';
import 'package:crud_book/controllers/user_token.dart';
import 'package:crud_book/pages/main_page.dart';
import 'package:crud_book/services/auth_services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  final AuthService _apiloginService = AuthService();

  final TextEditingController emailController = TextEditingController();
  final TextEditingController pwController = TextEditingController();
  final TokenManager tokenManager = Get.put(TokenManager());
  final UserController userController = Get.put(UserController());

  var isLoading = false.obs;

  Future<void> login() async {
    try {
      isLoading.value = true;
      final response = await _apiloginService.login(
        emailController.text,
        pwController.text,
      );

      if (response != null) {
        showSuccessSnackbar('Login successfully');
        print(response['token']);
        String token = response["token"];
        tokenManager.setToken(token);
        Get.off(MainPage());
      } else {
        showErrorSnackbar('Invalid response from server');
      }
    } catch (error) {
      print('Error: $error');
      showErrorSnackbar('Edit failed: $error');
    } finally {
      userController.getUserData();
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
