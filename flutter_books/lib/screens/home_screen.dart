import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_books/screens/all_books_screen.dart';
import 'package:flutter_books/screens/detail_screen.dart';
import 'package:flutter_books/screens/fav_books_screen.dart';
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
                  image: DecorationImage(image: AssetImage('assets/ruang_baca_tp.png'), fit: BoxFit.cover)
                ),
              )),
            Divider(height: 5,),
            ListTile(
              leading: Icon(Icons.bookmark_border_outlined, size: 35,),
              title: Text('Buku Favorit', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return FavBooksScreen();
                }));
              },
            ),
            Divider(height: 0.5,),
            ListTile(
              leading: Icon(Icons.history_outlined, size: 35,),
              title: Text('History Bacaan', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
              onTap: () {
                
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
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  )
                ],
              )),

          // Search Bar
          // Container(
          //   height: 45,
          //   margin: const EdgeInsets.only(left: 25, right: 25, top: 20),
          //   decoration: BoxDecoration(
          //     borderRadius: BorderRadius.circular(10),
          //     color: Colors.grey.shade600,
          //   ),
          //   child: Stack(
          //     children: [
          //       const TextField(
          //         decoration: InputDecoration(
          //             hintText: 'Cari Buku...',
          //             contentPadding: EdgeInsets.only(left: 15),
          //             border: InputBorder.none),
          //         style: TextStyle(fontSize: 12),
          //       ),
          //       Positioned(
          //         right: 0,
          //         child: IconButton(onPressed: () {}, icon: Icon(Icons.search), color: Colors.amber,),
          //       )
          //     ],
          //   ),
          // ),
          Padding(
            padding: const EdgeInsets.only(top: 20, left: 20),
            child: Row(
              children: [
                const Text('Buku Tersedia'),
                Positioned(
                    child: TextButton(
                  onPressed: () async {
                    await Navigator.push(context, MaterialPageRoute(builder: (context){
                      return AllBooks();
                    }));
                  },
                  child: const Text('Tampilkan Semua', style: TextStyle(color: Colors.amber),),
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
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
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
