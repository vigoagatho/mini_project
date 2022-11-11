import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_books/screens/profile/profile_edit_screen.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    CollectionReference users = firestore.collection('users');
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
        backgroundColor: Colors.orange.shade600,
      ),
      body: StreamBuilder<QuerySnapshot>(
          stream: users.snapshots(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.separated(
                  itemBuilder: (context, index) {
                    DocumentSnapshot dsData = snapshot.data!.docs[index];
                    String nama = dsData['name'];
                    String prodi = dsData['prodi'];
                    String umur = dsData['age'].toString();
                    String angkatan = dsData['angkatan'].toString();
                    return Column(
                      children: [
                        Container(
                            padding: EdgeInsets.all(10),
                            child: Row(children: [
                              Text(
                                'Nama : ',
                                style: TextStyle(fontSize: 20),
                              ),
                              Text(nama, style: TextStyle(fontSize: 20))
                            ])),
                        Container(
                            padding: EdgeInsets.all(10),
                            child: Row(children: [
                              Text(
                                'Umur : ',
                                style: TextStyle(fontSize: 20),
                              ),
                              Text('$umur tahun', style: TextStyle(fontSize: 20))
                            ])),
                        Container(
                            padding: EdgeInsets.all(10),
                            child: Row(children: [
                              Text(
                                'Program Studi : ',
                                style: TextStyle(fontSize: 20),
                              ),
                              Text(prodi, style: TextStyle(fontSize: 20))
                            ])),
                        Container(
                            padding: EdgeInsets.all(10),
                            child: Row(children: [
                              Text(
                                'Angkatan : ',
                                style: TextStyle(fontSize: 20),
                              ),
                              Text(angkatan, style: TextStyle(fontSize: 20))
                            ])),
                        // ElevatedButton(onPressed: (){
                        //   Navigator.pushReplacement(context, MaterialPageRoute(builder: ((context) {
                        //     return ProfileEditScreen();
                        //   })));
                        //   users.doc().delete();
                        // }, child: Text('Edit Profile'))
                      ],
                    );
                  },
                  separatorBuilder: (context, index) => Divider(
                        height: 5,
                      ),
                  itemCount: snapshot.data!.docs.length);
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          }),
    );
  }
}
