import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_books/models/api/books_api.dart';
import 'package:flutter_books/models/books_model.dart';
import 'package:flutter_books/screens/books/detail_screen.dart';
import 'package:flutter_books/widgets/utils/books_row_tile.dart';

class BookRow extends StatefulWidget {
  const BookRow({super.key});

  @override
  State<BookRow> createState() => _BookRowState();
}

class _BookRowState extends State<BookRow> {
  @override
  Widget build(BuildContext context,) {
    return Container(
        margin: const EdgeInsets.only(top: 20),
        height: 200,
        child: FutureBuilder<List<Book>>(
            future: BooksApi().fetchBooksModel(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                
                return Center(child: CircularProgressIndicator());
              } else {
                List<Book> books = snapshot.data!;
                Book book;
                return ListView.builder(
                    padding: const EdgeInsets.only(left: 25, right: 6),
                    itemCount: 10,
                    physics: const BouncingScrollPhysics(
                        parent: AlwaysScrollableScrollPhysics()),
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return rowTile(books[index], context);
                    });
              }
            }));
  }
}
