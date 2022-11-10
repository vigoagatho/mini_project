import 'package:flutter/cupertino.dart';
import 'package:flutter_books/models/books_model.dart';

class FavouriteProvider extends ChangeNotifier {
  List<Book> _favBooks = [];
  List<Book> get favBooks => _favBooks;

  void toggleFavourite(Book favBooks){
    final isFav = _favBooks.contains(favBooks);
    if (isFav) {
      _favBooks.remove(favBooks);
    } else {
      _favBooks.add(favBooks);
    }
    notifyListeners();
  }

  bool isFav(Book favBooks){
    final isFav = _favBooks.contains(favBooks);
    return isFav;
  }

  void clearFavourite(){
    _favBooks = [];
    notifyListeners();
  }
}