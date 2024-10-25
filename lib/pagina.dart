import 'package:apiaula/api_service.dart';
import 'package:apiaula/post.dart';
import 'package:flutter/material.dart';

class Pagina extends StatefulWidget {
  const Pagina({super.key});

  @override
  State<Pagina> createState() => _PaginaState();
}

class _PaginaState extends State<Pagina> {
  final ApiService apiService = ApiService();
  List<Post> posts = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadPosts();
  }

  void _loadPosts() async {
  try {
    final response = await apiService.getPosts();
    print('Response: $response'); // Adicione esta linha
    setState(() {
      posts = response;
      isLoading = false;
    });
  } catch (e) {
    setState(() {
      isLoading = false;
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Erro ao carregar receitas: $e')),
    );
  }
}


  @override
Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      title: const Text('API Bar'),
      backgroundColor: Colors.lightGreen,
    ),
    body: ListView.builder(
      itemCount: posts.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text('${posts[index].id} - ${posts[index].receita}'),
          subtitle: Text('${posts[index].ingredientes}'),
        );
      },
    ),
  );
}
}
