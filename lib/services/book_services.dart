import 'package:dio/dio.dart';
import 'package:get/get.dart';

import '../controllers/user_token.dart';
import '../models/book_model.dart';

class BookApiService {
  final Dio _dio = Dio();
  final TokenManager _tokenManager = Get.find();

  Future<List<Book>> getBooks() async {
    try {
      final response = await _dio.get(
        'https://book-crud-service-6dmqxfovfq-et.a.run.app/api/books',
        options: Options(
          headers: {
            'Authorization': 'Bearer ${_tokenManager.token.value}',
            'Accept': 'application/json',
          },
        ),
      );

      if (response.statusCode == 200) {
        List<dynamic> data = response.data['data'];
        return data.map((json) => Book.fromJson(json)).toList();
      } else {
        throw Exception('Failed to load books');
      }
    } catch (e) {
      return [];
    }
  }
}
