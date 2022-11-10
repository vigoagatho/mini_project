import 'package:flutter/material.dart';
import 'package:flutter_books/models/books_model.dart';
import 'package:flutter_books/screens/detail_screen.dart';

Widget rowTile(Book book, BuildContext context) {
  return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return DetailScreen(book: book,);
        }));
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 10),
        height: 200,
        width: 130,
        child: Image(
          image: NetworkImage(book.image),
          fit: BoxFit.cover,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.grey.shade800,
        ),
      ));
}
