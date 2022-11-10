import 'package:dio/dio.dart';
import 'package:flutter_books/models/books_model.dart';

class BooksApi{
  final String _url = 'https://api.itbook.store/1.0/new';
  late Dio _dio;

  BooksApi(){
    _dio = Dio();
  }

  Future<List<Book>> fetchBooksModel()async{
    try {
      Response response = await _dio.get(_url);
      BooksModel booksModel = BooksModel.fromJson(response.data);
      return booksModel.books;
    } on DioError catch (e) {
      throw Exception(e.toString());
    }
  }
}