import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_books/models/books_model.dart';

class AddNote extends StatelessWidget {
  final Book book;
  AddNote({super.key, required this.book});

  TextEditingController judulController = TextEditingController();
  TextEditingController cttController = TextEditingController();

  @override
  Widget build(BuildContext context) {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  CollectionReference ref = firestore.collection('notes');

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange.shade600,
      ),
      floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.orange.shade600,
          child: Icon(
            Icons.save_outlined,
            color: Colors.white,
          ),
          onPressed: () {
            ref.add({
              'judul':judulController.text,
              'catatan':cttController.text
            }).whenComplete(() => Navigator.pop(context));
          }),
      body: Container(
        margin: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        child: Column(
          children: [
            Padding(padding: EdgeInsets.all(10), child: Row(
              children: [
                Text('Terkait Buku : '),
                Expanded(child: Text(book.title,))
              ],
            ),),
            SizedBox(height: 10,),
            Container(
              decoration: BoxDecoration(border: Border.all()),
              child: TextField(
                controller: judulController,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(15),
                  hintText: 'Judul',
                  hintStyle: TextStyle(fontSize: 20)),
              ),
            ),
            SizedBox(height: 15,),
            Expanded(
              child: Container(
                decoration: BoxDecoration(border: Border.all()),
                child: TextField(
                  controller: cttController,
                  maxLines: null,
                  expands: true,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(15),
                    hintText: 'Catatan...'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
