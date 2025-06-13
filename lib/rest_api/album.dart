class Album {
  final int userId;
  final int id;
  final String title;

  const Album({required this.userId, required this.id, required this.title});

  factory Album.fromJson(Map<String,dynamic> json){
    return Album(userId: json['userId'], id:json['id'],title: json['title']);
  }

  // factory Album.fromJson(Map<String, dynamic> json) {
  //   return switch (json) {
  //     {'userId': int userId, 'id': int id, 'title': String title} => Album(
  //       userId: userId,
  //       id: id,
  //       title: title,
  //     ),
  //     _ => throw const FormatException('Failed to load album.'),
  //   };
  // }

  factory Album.fromMap(Map<String, dynamic> map) {
    return Album(userId: map['userId'], id: map['id'], title: map["title"]);
  }

  Map<String, dynamic> toMap() {
    return {'userId': userId, 'id': id, 'title': title};
  }
}
