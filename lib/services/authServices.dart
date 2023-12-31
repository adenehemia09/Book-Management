
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import '../controllers/usetoken.dart';


class AuthService {
  final Dio _dio = Dio();

  Future<Map<String, dynamic>> login(String email, String password) async {
    final response = await _dio.post(
      'https://book-crud-service-6dmqxfovfq-et.a.run.app/api/login',
      data: {'email': email, 'password': password},
    );
    return response.data;
  }

  Future<Map<String, dynamic>> register(String name, String email, String password, String passwordConfirmation) async {
    try {
      final response = await _dio.post(
        'https://book-crud-service-6dmqxfovfq-et.a.run.app/api/register',
        data: {
          'name': name,
          'email': email,
          'password': password,
          'password_confirmation': passwordConfirmation,
        },
      );
      return response.data;
    } catch (error) {
      throw Exception('Failed to register user');
    }
  }

 

}


