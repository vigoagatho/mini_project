import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_books/models/books_model.dart';
import 'package:flutter_books/screens/notes/add_note.dart';
import 'package:flutter_books/screens/notes/edit_note.dart';

class NoteGrid extends StatelessWidget {
  const NoteGrid({super.key});

  @override
  Widget build(BuildContext context) {
    final ref = FirebaseFirestore.instance.collection('notes');
    
    return Scaffold(
      appBar: AppBar(
        title: Text('My Notes'),
        backgroundColor: Colors.orange.shade600,
      ),
      body: StreamBuilder(
        stream: ref.snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          return GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2), 
              itemCount: snapshot.hasData?snapshot.data!.docs.length:0,
            itemBuilder: ((context, index) {
              return GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context){
                    return EditNote(docToEdit: snapshot.data!.docs[index]);
                  }));
                },
                child: Container(
                  margin: EdgeInsets.all(10),
                  height: 150,
                  color: Colors.grey.shade800,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: EdgeInsets.all(5),
                        height: 30,
                        child: Text(snapshot.data!.docs[index]['judul'], style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),maxLines: 1,overflow: TextOverflow.ellipsis,)),
                      Container(
                        margin: EdgeInsets.all(5),
                        height: 70,
                        child: Text(snapshot.data!.docs[index]['catatan'], maxLines: 5,overflow: TextOverflow.ellipsis,)),
                    ],
                  ),
                ),
              );
            }));
        }
      ),
    );
  }
}