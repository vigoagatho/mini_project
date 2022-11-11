import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_books/screens/books/all_books_screen.dart';
import 'package:flutter_books/screens/books/detail_screen.dart';
import 'package:flutter_books/screens/books/fav_books_screen.dart';
import 'package:flutter_books/screens/notes/note_grid.dart';
import 'package:flutter_books/screens/profile/profile_edit_screen.dart';
import 'package:flutter_books/screens/profile/profile_screen.dart';
import 'package:flutter_books/widgets/book_list_widget.dart';
import 'package:flutter_books/widgets/book_row_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.orange.shade600,
        ),
        drawer: Drawer(
          child: ListView(
            children: [
              DrawerHeader(
                  child: Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/ruang_baca_tp.png'),
                        fit: BoxFit.cover)),
              )),
              Divider(
                height: 5,
              ),
              ListTile(
                leading: Icon(
                  Icons.bookmark_border_outlined,
                  size: 35,
                ),
                title: Text(
                  'Buku Favorit',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return FavBooksScreen();
                  }));
                },
              ),
              Divider(
                height: 0.5,
              ),
              ListTile(
                leading: Icon(
                  Icons.note_alt_outlined,
                  size: 35,
                ),
                title: Text(
                  'Catatan',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                onTap: () {
                  Navigator.push(
                      context,
                      PageRouteBuilder(
                          transitionDuration: Duration(seconds: 1),
                          transitionsBuilder:
                              (context, animation, secondaryAnimation, child) {
                            return ScaleTransition(
                              alignment: Alignment(0, 5),
                              scale: animation,
                              child: child,
                            );
                          },
                          pageBuilder:
                              ((context, animation, secondaryAnimation) {
                            return NoteGrid();
                          })));
                },
              ),
              Divider(
                height: 0.5,
              ),
              ListTile(
                leading: Icon(
                  Icons.person_outline_rounded,
                  size: 35,
                ),
                title: Text(
                  'Profile',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return ProfileScreen();
                  }));
                },
              ),
            ],
          ),
        ),
        body: Container(
          child: ListView(
            physics: const BouncingScrollPhysics(
                parent: AlwaysScrollableScrollPhysics()),
            children: [
              Padding(
                  padding: const EdgeInsets.only(top: 25, left: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        'Hello!',
                        style: TextStyle(fontSize: 15),
                      ),
                      Text(
                        'Mau Baca Apa Hari Ini?',
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.bold),
                      )
                    ],
                  )),
              Padding(
                padding: const EdgeInsets.only(top: 20, left: 20),
                child: Row(
                  children: [
                    const Text('Buku Tersedia'),
                    Positioned(
                        child: TextButton(
                      onPressed: () async {
                        await Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return AllBooks();
                        }));
                      },
                      child: const Text(
                        'Tampilkan Semua',
                        style: TextStyle(color: Colors.amber),
                      ),
                    ))
                  ],
                ),
              ),

              // Slider Buku Koleksi
              BookRow(),
              Padding(
                  padding: const EdgeInsets.only(top: 25, left: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        'Koleksi Proposal',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      )
                    ],
                  )),

              //Koleksi Buku Proposal Skripsi
              BookListWidget()
            ],
          ),
        ));
  }
}
