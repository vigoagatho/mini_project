import 'package:flutter/material.dart';
import 'package:flutter_books/models/books_model.dart';
import 'package:flutter_books/services/favourite_provider.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher_string.dart';

class DetailScreen extends StatelessWidget {
  final Book book;
  const DetailScreen({super.key, required this.book});

  @override
  Widget build(BuildContext context) {
    final favBooks = book;
    final provider = Provider.of<FavouriteProvider>(context);

    return Scaffold(
      body: SafeArea(
          child: Container(
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              backgroundColor: Colors.orange.shade600,
              expandedHeight: MediaQuery.of(context).size.height * 0.5,
              flexibleSpace: Container(
                height: MediaQuery.of(context).size.height * 0.5,
                child: Stack(
                  children: [
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        margin: EdgeInsets.only(bottom: 62),
                        width: 172,
                        height: 225,
                        child: Image(
                          image: NetworkImage(book.image),
                          fit: BoxFit.cover,
                        ),
                        decoration: BoxDecoration(
                            color: Colors.grey.shade800,
                            borderRadius: BorderRadius.circular(10)),
                      ),
                    ),
                    Positioned(
                        bottom: 58,
                        right: 115,
                        child: Container(
                          height: 30,
                          width: 30,
                          // decoration: BoxDecoration(color: Colors.white),
                          child: IconButton(
                              onPressed: () {
                                provider.toggleFavourite(favBooks);
                              },
                              icon: provider.isFav(favBooks)
                                  ? Icon(
                                      Icons.bookmark_add,
                                      color: Colors.red,
                                      size: 35,
                                    )
                                  : Icon(
                                      Icons.bookmark_add,
                                      size: 35,
                                    )),
                        )),
                  ],
                ),
              ),
            ),
            SliverList(
                delegate: SliverChildListDelegate([
              Padding(
                padding: EdgeInsets.only(top: 24, left: 25),

                /// TODO: Insert data for title
                child: Text(
                  book.title,
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
              ),

              /// TODO: Insert data for author
              Padding(
                padding: EdgeInsets.only(top: 7, left: 25),
                child: Text(
                  book.subtitle,
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                      color: Colors.grey.shade400),
                ),
              ),

              Padding(
                padding: EdgeInsets.only(top: 20, left: 25, bottom: 10),
                child: Text(
                  'Deskripsi Buku',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),

              /// TODO: Insert description from data
              Padding(
                padding: EdgeInsets.only(left: 25, right: 25, bottom: 25),
                child: Text(
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc vulputate molestie justo a dapibus. Fusce at odio ultrices, lobortis nisl sed, porta nisi. Pellentesque varius sapien sapien, ut dignissim leo maximus sit amet. Quisque rutrum faucibus est, id viverra metus vulputate ac. Donec ullamcorper lacinia scelerisque. In hac habitasse platea.',
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.w200),
                ),
              ),

              Padding(
                padding: EdgeInsets.symmetric(vertical: 20),
                child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 60),
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            minimumSize: Size(80, 40),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20)),
                            backgroundColor: Colors.amber.shade800),
                        onPressed: () async {
                          await openUrl(book.url);
                        },
                        child: Text('Baca Sekarang'))),
              )
            ]))
          ],
        ),
      )),
    );
  }

  Future<void> openUrl(String url,
      {bool forceWebView = false, bool enableJavaScript = false}) async {
    await launchUrlString(book.url);
  }
}
