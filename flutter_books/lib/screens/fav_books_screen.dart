import 'package:flutter/material.dart';
import 'package:flutter_books/services/favourite_provider.dart';
import 'package:provider/provider.dart';

class FavBooksScreen extends StatelessWidget {
  const FavBooksScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<FavouriteProvider>(context);
    final favBooks = provider.favBooks;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Buku Favorit'),
        backgroundColor: Colors.orange.shade600,
        actions: [
          IconButton(onPressed: (){
            provider.clearFavourite();
          }, icon: Icon(Icons.delete_forever))
        ],
      ),
      body: ListView.builder(
          padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 25),
          physics: const BouncingScrollPhysics(
              parent: AlwaysScrollableScrollPhysics()),
          itemCount: favBooks.length,
          itemBuilder: (context, index) {
            return Container(
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
                              image: NetworkImage(favBooks[index].image),
                              fit: BoxFit.cover))),
                  const SizedBox(width: 15),
                  Expanded(
                    child: Text(
                      favBooks[index].title,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                  )
                ],
              ),
            );
          }),
    );
  }
}
