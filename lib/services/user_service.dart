import 'package:dio/dio.dart';
import 'package:get/get.dart';

import '../controllers/user_token.dart';

class ApiUserService {
  final Dio _dio = Dio();
  final TokenManager _tokenManager = Get.find();

  Future<Map<String, dynamic>> getUserData() async {
    try {
      final response = await _dio.get(
        'https://book-crud-service-6dmqxfovfq-et.a.run.app/api/user',
        options: Options(
          headers: {
            'Authorization': 'Bearer ${_tokenManager.token.value}',
            'Accept': 'application/json',
          },
        ),
      );

      if (response.statusCode == 200) {
        return response.data;
      } else {
        throw Exception('Failed to load user data');
      }
    } catch (error) {
      throw Exception('Failed to connect to the server');
    }
  }
}
