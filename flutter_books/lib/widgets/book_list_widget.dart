import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_books/models/api/books_api.dart';
import 'package:flutter_books/models/books_model.dart';
import 'package:flutter_books/widgets/utils/books_list_tile.dart';

class BookListWidget extends StatefulWidget {
  const BookListWidget({super.key});

  @override
  State<BookListWidget> createState() => _BookListWidgetState();
}

class _BookListWidgetState extends State<BookListWidget> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Book>>(
        future: BooksApi().fetchBooksModel(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Center(
                  child: CircularProgressIndicator(),
                ),
              ],
            );
          } else {
            List<Book> books = snapshot.data!;
            return ListView.builder(
                padding:
                    const EdgeInsets.symmetric(vertical: 25, horizontal: 25),
                physics: const BouncingScrollPhysics(
                    parent: AlwaysScrollableScrollPhysics()),
                shrinkWrap: true,
                itemCount: 3,
                itemBuilder: (context, index) {
                  return listTile(books[index], context);
                });
          }
        });
  }
}
