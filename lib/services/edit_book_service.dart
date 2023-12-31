import 'package:dio/dio.dart';
import 'package:get/get.dart';
import '../controllers/user_token.dart';

class ApiEditService {
  final Dio dio = Dio();
  final TokenManager _tokenManager = Get.find();

  Future<Map<String, dynamic>> editBook(
    int id,
    String isbn,
    String title,
    String author,
    String published,
    String publisher,
    String pages,
    String description,
  ) async {
    try {
      final response = await dio.put(
        'https://book-crud-service-6dmqxfovfq-et.a.run.app/api/books/$id/edit',
        data: {
          "isbn": isbn,
          "title": title,
          "author": author,
          "published": published,
          "publisher": publisher,
          "pages": pages,
          "description": description,
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
      throw Exception('Failed to Edit Data $error');
    }
  }
}
