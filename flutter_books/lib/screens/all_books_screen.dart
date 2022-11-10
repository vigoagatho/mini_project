import 'package:flutter/material.dart';
import 'package:flutter_books/models/api/books_api.dart';
import 'package:flutter_books/models/books_model.dart';
import 'package:flutter_books/widgets/utils/books_list_tile.dart';

class AllBooks extends StatelessWidget {
  const AllBooks({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Semua Buku'),
        backgroundColor: Colors.orange.shade600,
      ),
      body: FutureBuilder<List<Book>>(
      future: BooksApi().fetchBooksModel(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else {
          List<Book> books = snapshot.data!;
          return Column(
            children: [
              ListView.builder(
                  padding:
                      const EdgeInsets.symmetric(vertical: 25, horizontal: 25),
                  physics: const BouncingScrollPhysics(
                      parent: AlwaysScrollableScrollPhysics()),
                  // shrinkWrap: true,
                  itemCount: books.length,
                  itemBuilder: (context, index) {
                    return listTile(books[index], context);
                  }),
            ],
          );
        }
      }),
    );
  }
}