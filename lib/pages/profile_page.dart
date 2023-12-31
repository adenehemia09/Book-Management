import 'package:crud_book/controllers/logout_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/user_controller.dart';

class ProfilePage extends StatelessWidget {
  final UserController userController = Get.put(UserController());
  final LogoutController logoutController = Get.put(LogoutController());

  ProfilePage({super.key});

  void logout() {
    logoutController.logout();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: 280,
              margin: EdgeInsets.only(left: 14, right: 14),
              child: Card(
                elevation: 5,
                margin: const EdgeInsets.only(left: 10, right: 10, top: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 22, right: 22, top: 22),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          CircleAvatar(
                            radius: 4,
                            backgroundColor: Colors.green.shade300,
                          ),
                          SizedBox(width: 4),
                          Text(
                            'Aktif',
                            style: TextStyle(
                              fontSize: 14.0,
                              fontWeight: FontWeight.normal,
                              color: Colors.green.shade300,
                            ),
                          ),
                        ],
                      ),
                      Center(
                        child: CircleAvatar(
                          backgroundImage: AssetImage('assets/avatar.png'),
                          // Sesuaikan path dan ekstensi gambar
                          radius: 60,
                          // Sesuaikan ukuran lingkaran
                          backgroundColor: Colors.white,
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '${userController.userData['name']}',
                            style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                overflow: TextOverflow.ellipsis),
                          ),
                          Text(
                            '${userController.userData['email']}',
                            style: TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                          const SizedBox(height: 8.0),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
            Container(
                margin:
                    EdgeInsets.only(left: 20, right: 20, top: 30, bottom: 10),
                height: 50,
                width: MediaQuery.of(context).size.width,
                child: ElevatedButton(
                    onPressed: () {
                      logout();
                    },
                    child: Text('Logout'))),
            Align(
                alignment: Alignment.bottomCenter,
                child: Text('App Version 1.0.0'))
          ],
        ),
      ),
    );
  }
}
