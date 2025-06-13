 class Book {
  final int? id;
  final String title;
  final double price;

  Book({this.id, required this.title, required this.price});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'price': price,
    };
  }

  factory Book.fromMap(Map<String, dynamic> map) {
    return Book(
      id: map['id'],
      title: map['title'],
      price: map['price'] * 1.0,
    );
  }
}
