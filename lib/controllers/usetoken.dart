import 'package:get/get.dart';

class TokenManager extends GetxService {
  var token = ''.obs;

  void setToken(String newToken) {
    token.value = newToken;
  }
}
