import 'dart:convert';
import 'dart:nativewrappers/_internal/vm/lib/convert_patch.dart';

import 'package:apiaula/post.dart';
import 'package:http/http.dart' as http;

class ApiService {

  final String baseUrl = 'https://api-receitas-pi.vercel.app/receitas/todas';

  // GET
  Future<List<Post>> getPosts() async {

    final Response = await http.get(Uri.parse(baseUrl));
    if(Response.statusCode == 200){
      List<dynamic> body = jsonDecode(Response.body);
      return body.map((dynamic item){
          return Post.fromMap(item);
      }).toList();
    }
    return [];
  }


}