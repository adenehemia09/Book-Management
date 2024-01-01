import 'package:crud_book/models/book_model.dart';
import 'package:crud_book/pages/edit_book_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class DetitleBookPage extends StatelessWidget {
  final Book book;
  const DetitleBookPage({super.key, required this.book});

  @override
  Widget build(BuildContext context) {
    String published =
        DateFormat('dd-MM-yyyy').format(DateTime.parse(book.published));

    return Scaffold(
      appBar: AppBar(
        title: const Text('Book Detitle'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Image.asset(
                'assets/stackBooksEducation.png',
                height: 200,
              ),
            ),
            Container(
              margin: const EdgeInsets.only(left: 30, right: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 16),
                  Text(
                    book.title,
                    style: const TextStyle(
                        fontSize: 22, fontWeight: FontWeight.bold),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'ISBN: ${book.isbn}',
                    style: const TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Author: ${book.author}',
                    style: const TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Publisher: ${book.publisher}',
                    style: const TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Published: $published',
                    style: const TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Total Pages: ${book.pages}',
                    style: const TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'Description:',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    book.description,
                    style: const TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 16),
                ],
              ),
            ),
            Center(
              child: ElevatedButton(
                onPressed: () {},
                child: const Text('Kunjungi Website Buku'),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Get.to(EditBook(
          id: book.id,
        )),
        child: const Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.edit),
            SizedBox(height: 2),
            Text(
              'Edit',
              style: TextStyle(fontSize: 12),
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
    );
  }
}
