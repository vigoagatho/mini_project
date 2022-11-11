import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_books/screens/profile/profile_screen.dart';

class ProfileEditScreen extends StatelessWidget {
  ProfileEditScreen({super.key});
  final TextEditingController nameController = TextEditingController();
  final TextEditingController prodiController = TextEditingController();
  final TextEditingController angkatanController = TextEditingController();
  final TextEditingController ageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    CollectionReference users = firestore.collection('users');
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Profile'),
        backgroundColor: Colors.orange.shade600,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.all(10),
                child: Container(
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/ruang_baca_tp.png'))),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 20, left: 15, right: 15),
                child: TextFormField(
                  controller: nameController,
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.abc_rounded),
                      hintText: 'Nama',
                      label: Text('Nama'),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20))),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 20, left: 15, right: 15),
                child: TextFormField(
                  controller: ageController,
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.date_range_outlined),
                      hintText: 'Umur',
                      label: Text('Umur'),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20))),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 20, left: 15, right: 15),
                child: TextFormField(
                  controller: prodiController,
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.library_books_outlined),
                      hintText: 'Program Studi',
                      label: Text('Program Studi'),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20))),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 20, left: 15, right: 15),
                child: TextFormField(
                  controller: angkatanController,
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.hourglass_empty_outlined),
                      hintText: 'Angkatan',
                      label: Text('Angkatan'),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20))),
                ),
              ),

              //Save Button
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange.shade600
                ),
                onPressed: (){
                  users.add({
                    'name':nameController.text,
                    'prodi':prodiController.text,
                    'angkatan':int.tryParse(angkatanController.text) ?? 0,
                    'age':int.tryParse(ageController.text) ?? 0
                  });
                  nameController.text = '';
                  prodiController.text = '';
                  angkatanController.text = '';
                  ageController.text = '';
                  Navigator.push(context, MaterialPageRoute(builder: ((context) => ProfileScreen())));
                }, child: Text('Simpan Profile'))
            ],
          ),
        ),
      ),
    );
  }
}
