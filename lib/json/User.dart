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

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      age: json['age'],
      name: json['name'],
      isStudent: json['isStudent'],
    );
  }
}
