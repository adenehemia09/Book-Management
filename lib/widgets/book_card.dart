import 'package:crud_book/controllers/delete_book_controller.dart';
import 'package:crud_book/pages/detitle_book_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import '../models/book_model.dart';

class BookCard extends StatelessWidget {
  final Book book;
  final DeleteBookController _deleteBookService = DeleteBookController();

  BookCard({
    super.key,
    required this.book,
  });

  void deleteBook(id) {
    _deleteBookService.deleteBook(id);
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Slidable(
        endActionPane: ActionPane(motion: const StretchMotion(), children: [
          SlidableAction(
            backgroundColor: Colors.red,
            icon: Icons.delete,
            label: 'Delete',
            onPressed: (context) {
              deleteBook(book.id);
            },
          ),
        ]),
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Card(
            elevation: 5,
            margin: const EdgeInsets.only(left: 20, right: 20, top: 12),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            child: GestureDetector(
              onTap: () => Get.to(DetitleBookPage(book: book)),
              child: Container(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      book.title,
                      style: const TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8.0),
                    Text(
                      'By ${book.author}\nPublisher: ${book.publisher}\nPublished: ${book.published}\nPages: ${book.pages}',
                      style: const TextStyle(fontSize: 14.0),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
