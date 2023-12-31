import 'package:crud_book/pages/login_page.dart';
import 'package:crud_book/pages/register_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/navigation_auth_controller.dart';

class MainAuth extends StatelessWidget {
  MainAuth({super.key});

  final NavigationAuthController navigationAuthController =
      Get.put(NavigationAuthController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Obx(
      () => Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            child: const Text(
              'WELCOME',
              style: TextStyle(
                  fontSize: 30,
                  color: Colors.black,
                  fontWeight: FontWeight.w400),
            ),
          ),
          const SizedBox(
            height: 28,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              MaterialButton(
                color: navigationAuthController.selectedIndex.value == 0
                    ? Colors.amber
                    : Colors.white,
                onPressed: () => navigationAuthController.changePage(0),
                child: Text('Login'),
              ),
              SizedBox(height: 16),
              MaterialButton(
                color: navigationAuthController.selectedIndex.value == 1
                    ? Colors.amber
                    : Colors.white,
                onPressed: () => navigationAuthController.changePage(1),
                child: Text('Register'),
              ),
            ],
          ),
          IndexedStack(
            index: navigationAuthController.selectedIndex.value,
            children: const [
              // Halaman 1 (Home)
              LoginPage(),
              // Halaman 2 (Profile)
              RegisterPage()
            ],
          ),
        ],
      ),
    ));
  }
}

// child: Center(
//   child: Column(
//
//     children: [
//       const SizedBox(
//         height: 30,
//       ),
//       Container(
//         child: const Text(
//           'WELCOME',
//           style: TextStyle(
//               fontSize: 30,
//               color: Colors.black,
//               fontWeight: FontWeight.w400),
//         ),
//       ),
//       const SizedBox(
//         height: 20,
//       ),
//       SizedBox(
//         height: 50,
//       ),

// ),
