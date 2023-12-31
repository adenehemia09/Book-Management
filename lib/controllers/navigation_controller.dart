import 'package:get/get.dart';

class NavigationController extends GetxController {
  var selectedIndex = 0.obs; // Observable untuk menyimpan indeks halaman yang aktif

  void changePage(int index) {
    selectedIndex.value = index;
  }
}
