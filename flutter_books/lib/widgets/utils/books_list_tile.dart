import 'package:flutter/material.dart';
import 'package:flutter_books/models/books_model.dart';
import 'package:flutter_books/screens/detail_screen.dart';

Widget listTile(Book book, BuildContext context) {
  return GestureDetector(
    onTap: () {
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return DetailScreen(
          book: book,
        );
      }));
    },
    child: Container(
      margin: const EdgeInsets.symmetric(vertical: 15),
      height: 80,
      width: 50,
      child: Row(
        children: [
          Container(
              height: 80,
              width: 60,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  image: DecorationImage(
                      image: NetworkImage(book.image), fit: BoxFit.cover))),
          const SizedBox(width: 15),
          Expanded(
            child: Text(
              book.title,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
          )
        ],
      ),
    ),
  );
}
