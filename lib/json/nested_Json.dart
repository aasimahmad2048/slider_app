// ignore: file_names
class Address {
  final String street;
  final String city;
  Address({required this.street, required this.city});

  factory Address.fromJson(Map<String, dynamic> json) {
    return Address(street: json['street'], city: json['city']);
  }
}

class User {
  final String name;
  final Address address;
  User({required this.name, required this.address});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(name: json['name'], address: Address.fromJson(json['address']));
  }
}


final List<dynamic> jsonArray = [
  {
    "name": "Alice",
    "address": {"street": "123 Main St", "city": "Wonderland"},
  },
  {
    "name": "Bob",
    "address": {"street": "456 Elm St", "city": "Builderland"},
  },
];

final List<User> users = jsonArray.map((json) => User.fromJson(json)).toList();

