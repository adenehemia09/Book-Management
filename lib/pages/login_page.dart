import 'package:crud_book/pages/main_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/login_controller.dart';

import '../widgets/build_text_form_field.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final LoginController _loginController = Get.put(LoginController());

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          const SizedBox(height: 10),
          TextField(
            controller: _loginController.emailController,
            decoration: InputDecoration(
              labelText: 'Username',
            ),
          ),
          const SizedBox(height: 15),
          TextField(
            controller: _loginController.pwController,
            obscureText: true,
            decoration: InputDecoration(
              labelText: 'Password',
            ),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () => _loginController.login(),
            child: Text('Login'),
          ),
          SizedBox(height: 16.0),
          Obx(
            () => _loginController.isLoading.value
                ? CircularProgressIndicator()
                : SizedBox.shrink(),
          ),
        ],
      ),
    );
  }
}
