import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../models/user_model.dart';
import '../services/auth_services.dart';

class RegisterController extends GetxController {
  final AuthService _authService = AuthService();

  var name = ''.obs;
  var email = ''.obs;
  var password = ''.obs;
  var passwordConfirmation = ''.obs;
  var registeredUser = User.empty().obs;
  var isLoading = false.obs;

  void setName(String value) => name.value = value;
  void setEmail(String value) => email.value = value;
  void setPassword(String value) => password.value = value;
  void setPasswordConfirmation(String value) =>
      passwordConfirmation.value = value;

  Future<void> register() async {
    try {
      isLoading.value = true;
      final response = await _authService.register(
          name.value, email.value, password.value, passwordConfirmation.value);

      if (response != null) {
        final user = User.fromJson(response['user']);
        registeredUser.value = user;
        showSuccessSnackbar('User registered successfully');
      } else {
        showErrorSnackbar('Invalid response from server');
      }
    } catch (error) {
      print('Error: $error');
      showErrorSnackbar('Registration failed: $error');
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
