class User {
  final String name;
  final int age;
  final bool isStudent;

  User({required this.name, required this.age, required this.isStudent});

  Map<String, dynamic> toJson() => {
    'name': name,
    'age': age,
    "isStudent": isStudent,
  };

  Map<String, dynamic> toMap() => {
    'name': name,
    'age': age,
    "isStudent": isStudent,
  };

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      name: map['name'],
      age: map['age'],
      isStudent: map['isStudent'],
    );
  }

  //   factory User.fromJson(Map<String, dynamic> json) {
  //     return switch (json) {
  //       {'age': int age, 'name': String name, "isStudent": bool isStudent} =>
  //         User(age: age, name: name, isStudent: isStudent),
  //       _ => throw const FormatException('Failed to load album.'),
  //     };
  //   }

  factory User.fromJson(Map<String, dynamic> json) {
    return switch (json) {
      {'age': int age, 'name': String name, "isStudent": bool isStudent} =>
        User(age: age, name: name, isStudent: isStudent),
      _ => throw const FormatException("failed to load"),
    };
  }
}
