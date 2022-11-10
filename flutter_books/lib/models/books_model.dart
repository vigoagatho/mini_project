class BooksModel {
    BooksModel({
        required this.total,
        required this.page,
        required this.books,
    });

    String total;
    String? page;
    List<Book> books;

    factory BooksModel.fromJson(Map<String, dynamic> json) => BooksModel(
        total: json["total"],
        page: json["page"],
        books: List<Book>.from(json["books"].map((x) => Book.fromJson(x))),
    );

    // Map<String, dynamic> toJson() => {
    //     "total": total,
    //     "page": page,
    //     "books": List<dynamic>.from(books.map((x) => x.toJson())),
    // };
}

class Book {
    Book({
        required this.title,
        required this.subtitle,
        required this.isbn13,
        required this.image,
        required this.url,
    });

    String title;
    String subtitle;
    String isbn13;
    String image;
    String url;

    factory Book.fromJson(Map<String, dynamic> json) => Book(
        title: json["title"],
        subtitle: json["subtitle"],
        isbn13: json["isbn13"],
        image: json["image"],
        url: json["url"],
    );

    // Map<String, dynamic> toJson() => {
    //     "title": title,
    //     "subtitle": subtitle,
    //     "isbn13": isbn13,
    //     "image": image,
    //     "url": url,
    // };
}
