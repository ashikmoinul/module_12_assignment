import 'dart:convert';
import 'package:http/http.dart' as http;
import 'photo.dart';

class PhotoService {
  static const String _url = 'https://jsonplaceholder.typicode.com/photos';

  Future<List<Photo>> fetchPhotos() async {
    final response = await http.get(Uri.parse(_url));
    if (response.statusCode == 200) {
      List<dynamic> jsonResponse = json.decode(response.body);
      return jsonResponse.map((json) => Photo.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load photos');
    }
  }
}
