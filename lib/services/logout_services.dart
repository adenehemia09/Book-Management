import 'package:dio/dio.dart';
import 'package:get/get.dart';
import '../controllers/user_token.dart';

class ApiLogoutService {
  final Dio dio = Dio();
  final TokenManager _tokenManager = Get.find();

  Future<Map<String, dynamic>> logout() async {
    try {
      final response = await dio.delete(
        'https://book-crud-service-6dmqxfovfq-et.a.run.app/api/user/logout',
        options: Options(
          headers: {
            'Authorization': 'Bearer ${_tokenManager.token.value}',
            'Accept': 'application/json',
          },
        ),
      );
      return response.data;
    } catch (error) {
      throw Exception('Failed to Delete Data $error');
    }
  }
}
