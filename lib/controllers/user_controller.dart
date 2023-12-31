import 'package:get/get.dart';

import '../services/user_service.dart';

class UserController extends GetxController {
  final ApiUserService _apiService = ApiUserService();

  final RxMap userData = {}.obs;
  final RxBool isLoading = true.obs;

  // Fungsi untuk mendapatkan data user
  Future<void> getUserData() async {
    try {
      isLoading.value = true;
      userData.value = await _apiService.getUserData();
    } catch (error) {
      print(error);
    } finally {
      isLoading.value = false;
    }
  }
}
