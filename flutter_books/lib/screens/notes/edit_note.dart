import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_books/models/books_model.dart';
import 'package:flutter_books/screens/notes/add_note.dart';

class EditNote extends StatefulWidget {
  EditNote({super.key, required this.docToEdit});
  DocumentSnapshot docToEdit;

  @override
  State<EditNote> createState() => _EditNoteState();
}

class _EditNoteState extends State<EditNote> {
  TextEditingController judulController = TextEditingController();
  TextEditingController cttController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    judulController = TextEditingController(text: widget.docToEdit['judul']);
    cttController = TextEditingController(text: widget.docToEdit['catatan']);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    CollectionReference ref = firestore.collection('notes');
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange.shade600,
        actions: [
          IconButton(onPressed: (){
            widget.docToEdit.reference.delete().whenComplete(() => Navigator.pop(context));
          }, icon: Icon(Icons.delete_forever))
        ],
      ),
      floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.orange.shade600,
          child: Icon(
            Icons.save_outlined,
            color: Colors.white,
          ),
          onPressed: () {
            widget.docToEdit.reference.update({
              'judul':judulController.text,
              'catatan':cttController.text
            }).whenComplete(() => Navigator.pop(context));
          }),
      body: Container(
        margin: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        child: Column(
          children: [
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
            SizedBox(
              height: 15,
            ),
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
