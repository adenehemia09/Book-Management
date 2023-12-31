import 'package:crud_book/pages/addNewBookPage.dart';
import 'package:crud_book/pages/homePage.dart';
import 'package:crud_book/pages/profilePage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:crud_book/controllers/navigationController.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    final NavigationController navigationController =
        Get.put(NavigationController());

    return Scaffold(
      body: Obx(() {
        // Gunakan Obx untuk membuat widget yang merespons perubahan pada observable
        return IndexedStack(
          index: navigationController.selectedIndex.value,
          children:  [
            // Halaman 1 (Home)
            HomePage(),
            // Halaman 2 (Profile)
            ProfilePage(),
          ],
        );
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Get.to(ADDNewBook()),
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 10,
        child: SizedBox(
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 24),
                child: GestureDetector(
                  onTap: () => navigationController.changePage(0),
                  child: const Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.home_filled),
                      SizedBox(height: 8),
                      Text("Home"),
                    ],
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(right: 24),
                child: GestureDetector(
                  onTap: () => navigationController.changePage(1),
                  child: const Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.person),
                      SizedBox(height: 8),
                      Text("Profile"),
                    ],
                  ),
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
