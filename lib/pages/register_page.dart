import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/register_controller.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    final RegisterController registerController = Get.put(RegisterController());

    return Container(
      margin: const EdgeInsets.only(left: 26, right: 26),
      child: Column(
        children: [
          TextField(
            onChanged: registerController.setName,
            decoration: const InputDecoration(labelText: 'Name'),
          ),
          const SizedBox(height: 5),
          TextField(
            onChanged: registerController.setEmail,
            decoration: const InputDecoration(labelText: 'Email'),
          ),
          const SizedBox(height: 5),
          TextField(
            onChanged: registerController.setPassword,
            decoration: const InputDecoration(labelText: 'Password'),
            obscureText: true,
          ),
          const SizedBox(height: 5),
          TextField(
            onChanged: registerController.setPasswordConfirmation,
            decoration: const InputDecoration(labelText: 'Confirm Password'),
            obscureText: true,
          ),
          const SizedBox(height: 25),
          Container(
            height: 50,
            width: MediaQuery.of(context).size.width,
            child: ElevatedButton(
              onPressed: registerController.isLoading.value
                  ? null
                  : registerController.register,
              child: registerController.isLoading.value
                  ? const CircularProgressIndicator()
                  : const Text('Register'),
            ),
          ),
          Obx(
            () {
              if (registerController.registeredUser.value.id != 0) {
                return Text(
                    'Registered User: ${registerController.registeredUser.value.name}');
              } else {
                return const SizedBox.shrink();
              }
            },
          ),
        ],
      ),
    );
  }
}
