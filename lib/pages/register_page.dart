import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/register_controller.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({Key? key});

  @override
  Widget build(BuildContext context) {
    final RegisterController _registerController =
        Get.put(RegisterController());

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          TextField(
            onChanged: _registerController.setName,
            decoration: const InputDecoration(labelText: 'Name'),
          ),
          TextField(
            onChanged: _registerController.setEmail,
            decoration: const InputDecoration(labelText: 'Email'),
          ),
          TextField(
            onChanged: _registerController.setPassword,
            decoration: const InputDecoration(labelText: 'Password'),
            obscureText: true,
          ),
          TextField(
            onChanged: _registerController.setPasswordConfirmation,
            decoration: const InputDecoration(labelText: 'Confirm Password'),
            obscureText: true,
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: _registerController.isLoading.value
                ? null
                : _registerController.register,
            child: _registerController.isLoading.value
                ? const CircularProgressIndicator()
                : const Text('Register'),
          ),
          Obx(() {
            if (_registerController.registeredUser.value.id != 0) {
              return Text(
                  'Registered User: ${_registerController.registeredUser.value.name}');
            } else {
              return const SizedBox.shrink();
            }
          }),
        ],
      ),
    );
  }
}
