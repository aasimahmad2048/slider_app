import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:slider_app/rest_api/album.dart';

Future<Album> fetchAlbum() async {
  final response = await http.get(
    Uri.parse("http://jsonplaceholder.typecode.com/album/1"),
    headers: {HttpHeaders.authorizationHeader: " API TOKEN"},
  );
  final responseJson = jsonDecode(response.body) as Map<String, dynamic>;
  return Album.fromJson(responseJson);
}
