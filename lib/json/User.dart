class User {
  final String name;
  final int age;
  final bool isStudent;

  User({required this.name, required this.age, required this.isStudent});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      age: json['age'],
      name: json['name'],
      isStudent: json['isStudent'],
    );
  }

  Map<String, dynamic> toJson() => {
    'name': name,
    'age': age,
    "isStudent": isStudent,
  };
}
