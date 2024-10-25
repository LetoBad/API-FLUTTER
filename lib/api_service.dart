
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'post.dart';

class ApiService {
  final String baseUrl = 'https://api-receitas-pi.vercel.app/receitas/todas';

  // GET
Future<List<Post>> getPosts() async {
  try {
    final response = await http.get(Uri.parse(baseUrl));
    
    if (response.statusCode == 200) {
      List<dynamic> body = jsonDecode(response.body);
      return body.map((dynamic item) {
        return Post.fromMap(item);
      }).toList();
    } else {
      print('Erro: ${response.statusCode} - ${response.body}');
      throw Exception('Falha ao carregar receitas');
    }
  } catch (error) {
    print('Erro ao fazer requisição: $error');
    throw Exception('Erro ao carregar receitas');
  }
}

  Future<Post?> createPost(Post post)async {
    final response = await http.post(
      Uri.parse(baseUrl),
      headers: {"Content- type": "application/json"},
      body: jsonEncode(post.toMap()),
    );
    if(response.statusCode == 201){
      return Post.fromMap(jsonDecode(response.body));
    }
    return null;
  }

  Future<Post?> updatePost(Post post, int id) async{
    final response = await http.put(Uri.parse('$baseUrl/$id'),
    headers: {"Content-Type": "application/json"},
    body: jsonEncode(post.toMap())
    );
    if(response.statusCode == 200){
      return Post.fromMap(jsonDecode(response.body));
    }
    return null;
  }

  Future<void> deletePost(int id) async{
    final response = await http.delete(Uri.parse('$baseUrl/$id'));
    if(response.statusCode == 200){
      print("Dato apagado com sucesso");
    }
  }

}
