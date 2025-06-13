import 'dart:convert';

void main() {
  final Map<String, dynamic> user = {
    'name': 'Alice',
    'age': 25,
    'isStudent': true,
  };

  final String jsonString = jsonEncode(user);
  print(jsonString);
}
