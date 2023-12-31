import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/bookController.dart';
import '../widgets/book_card.dart';

class HomePage extends StatefulWidget {

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final BookController bookController = Get.put(BookController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('List of Books'),
      ),
      body: Obx(() {
        if (bookController.isLoading.value) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else if (bookController.books.isEmpty) {
          return Center(
            child: Text('No books available.'),
          );
        } else {
          return SingleChildScrollView(
            child: Column(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: bookController.books.map((book) {
                    return BookCard(book: book,
                   );
                  }).toList(),
                ),
                SizedBox(height: 28,)
              ],
            ),

          );
        }
      }),
    );
  }
}
