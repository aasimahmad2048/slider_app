import 'dart:convert';

void main() {
  const jsonString = '''

{"name": "John", "age":30, "isStudent":false}
''';
  final Map<String, dynamic> user = jsonDecode(jsonString);
  print(user['name']);
  print(user['age']);
  print(user['isStudent']);
  print(user['pan']);

  const jsonArray = '''
  [{"name": "Alice"}, {"name": "Bob"}]
''';
  final List<dynamic> users = jsonDecode((jsonArray));
  print(users);
  print(users[0]);
  print(users[0]['name']);
}
