import 'package:dio/dio.dart';
import 'package:get/get.dart';
import '../controllers/usetoken.dart';

class ApiDeleteService {
  final Dio dio = Dio();
  final TokenManager _tokenManager = Get.find();

  Future<Map<String, dynamic>> deleteBook(bookID) async {
    try {
      final response = await dio.delete(
        'https://book-crud-service-6dmqxfovfq-et.a.run.app/api/books/$bookID',
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
