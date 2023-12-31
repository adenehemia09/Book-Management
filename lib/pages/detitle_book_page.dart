import 'package:crud_book/models/book_model.dart';
import 'package:crud_book/pages/edit_book_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DetitleBookPage extends StatelessWidget {
  final Book book;
  const DetitleBookPage({super.key, required this.book});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Book Detitle'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Center(
                child: Image.asset(
              'assets/stackBooksEducation.png',
              height: 200,
            )
                // Image.network(
                //   'https://via.placeholder.com/150', // Ganti dengan URL gambar buku
                //   height: 200,
                // ),
                ),
            Container(
              padding: EdgeInsets.only(left: 10, right: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 16),
                  Text(
                    book.title,
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: 8),
                  Text(
                    'ISBN: ${book.isbn}',
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Author: ${book.author}',
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Publisher: ${book.publisher}',
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Published: ${book.published}',
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Total Pages: ${book.pages}',
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(height: 16),
                  Text(
                    'Description:',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    book.description,
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(height: 16),
                ],
              ),
            ),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // Navigasi ke website buku
                  // Buka link di browser
                },
                child: Text('Kunjungi Website Buku'),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Get.to(EditBook(
          id: book.id,
        )),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.edit), // Menggunakan ikon edit
            const SizedBox(height: 2), // Jarak antara ikon dan teks
            const Text(
              'Edit',
              style: TextStyle(fontSize: 12),
            ), // Teks keterangan
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
    );
  }
}
