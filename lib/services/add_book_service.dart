import 'package:dio/dio.dart';
import 'package:get/get.dart';
import '../controllers/user_token.dart';

class ApiAddService {
  final Dio dio = Dio();
  final TokenManager _tokenManager = Get.find();

  Future<Map<String, dynamic>> addBook(
    String isbn,
    String title,
    String author,
    String published,
    String publisher,
    String pages,
    String description,
    String subtitle,
    String website,
  ) async {
    try {
      final response = await dio.post(
        'https://book-crud-service-6dmqxfovfq-et.a.run.app/api/books/add',
        data: {
          "isbn": isbn,
          "title": title,
          "subtitle": subtitle,
          "author": author,
          "published": published,
          "publisher": publisher,
          "pages": pages,
          "description": description,
          "website": website
        },
        options: Options(
          headers: {
            'Authorization': 'Bearer ${_tokenManager.token.value}',
            'Accept': 'application/json',
          },
        ),
      );
      return response.data;
    } catch (error) {
      throw Exception('Failed to Add Data $error');
    }
  }
}
