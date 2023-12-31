import 'package:get/get.dart';


import '../models/bookModel.dart';
import '../services/bookServices.dart';

class BookController extends GetxController {
  var isLoading = true.obs;
  var books = <Book>[].obs;

  @override
  void onInit() {
    fetchBooks();
    super.onInit();
  }

  Future<void> fetchBooks() async {
    try {
      isLoading(true);
      var response = await BookApiService().getBooks();
      books.assignAll(response);
    } finally {
      isLoading(false);
    }
  }
}
