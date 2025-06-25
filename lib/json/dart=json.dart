import 'dart:convert';

void main() {
  final Map<String, dynamic> user = {
    'name': 'Alice',
    'age': 25,
    'isStudent': true,
  };

  final Map<String, dynamic> Student = {'roll': 1234, 'ispassed': true};

  final String result = jsonEncode(Student);
  print(result);
  final Map<String, dynamic> decodeResult = jsonDecode(result);
  print(decodeResult['roll']);

  final String jsonString = jsonEncode(user);
  print(jsonString);

  //  String json_list = '''
  // [{"name": "Alice"}, {"name": "Bob"}]
  //  ''';

  String json_list = '[1,2,2,3,4]';

  final List<dynamic> dart_list = jsonDecode(json_list);
  // print(dart_list[0]["name"]);
  print(dart_list[4]);
}
