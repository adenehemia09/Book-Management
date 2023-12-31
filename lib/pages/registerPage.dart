import 'package:crud_book/pages/mainPage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/registerController.dart';
import '../widgets/buildTextFormField.dart';

class RegisterPage extends StatelessWidget {
   const RegisterPage({Key? key});

  @override
  Widget build(BuildContext context) {
    final RegisterController _registerController = Get.put(RegisterController());

    return Padding(
      padding:  EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          TextField(
            onChanged: _registerController.setName,
            decoration: InputDecoration(labelText: 'Name'),
          ),
          TextField(
            onChanged: _registerController.setEmail,
            decoration: InputDecoration(labelText: 'Email'),
          ),
          TextField(
            onChanged: _registerController.setPassword,
            decoration: InputDecoration(labelText: 'Password'),
            obscureText: true,
          ),
          TextField(
            onChanged: _registerController.setPasswordConfirmation,
            decoration: InputDecoration(labelText: 'Confirm Password'),
            obscureText: true,
          ),
          SizedBox(height: 16),
          ElevatedButton(
            onPressed: _registerController.isLoading.value ? null : _registerController.register,
            child: _registerController.isLoading.value
                ? CircularProgressIndicator()
                : Text('Register'),
          ),
          Obx(() {
            if (_registerController.registeredUser.value.id != 0) {
              return Text('Registered User: ${_registerController.registeredUser.value.name}');
            } else {
              return SizedBox.shrink();
            }
          }),
          // SizedBox(height: 10),
          // BuildTextField(
          //   hintText: 'Nama',
          //   icon: Icons.person,
          //   textEditingController: _registerController.setName,
          // ),
          // const SizedBox(height: 15),
          // BuildTextField(
          //   hintText: 'Email',
          //   icon: Icons.email,
          //   textEditingController: registerController.emailController,
          // ),
          // const SizedBox(height: 15),
          // BuildTextField(
          //   hintText: 'Password',
          //   icon: Icons.lock,
          //   isPassword: true,
          //   textEditingController: registerController.passwordController,
          // ),
          // const SizedBox(height: 15),
          // BuildTextField(
          //   hintText: 'Confirm Password',
          //   icon: Icons.lock,
          //   isPassword: true,
          //   textEditingController:
          //       registerController.confirmationPasswordController,
          // ),
          // const SizedBox(height: 20),
          // SizedBox(
          //   width: 180,
          //   height: 50,
          //   child: ElevatedButton(
          //     style: ButtonStyle(
          //       shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          //         RoundedRectangleBorder(
          //           borderRadius: BorderRadius.circular(10),
          //           side: BorderSide.none,
          //         ),
          //       ),
          //       backgroundColor: MaterialStateProperty.all<Color>(
          //         Colors.pinkAccent,
          //       ),
          //     ),
          //     onPressed: () => registerController.register(),
          //     child: const Text(
          //       'Register',
          //       style: TextStyle(
          //         fontSize: 24,
          //         color: Colors.white,
          //         fontWeight: FontWeight.w600,
          //       ),
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }
}
