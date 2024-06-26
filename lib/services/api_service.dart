import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/post.dart';
import '../models/comment.dart';
import '../models/todo.dart';  // Asegúrate de importar el modelo Todo

class ApiService {
  final String baseUrl = "https://jsonplaceholder.typicode.com";

  Future<List<Post>> fetchPosts() async {
    final response = await http.get(Uri.parse("$baseUrl/posts"));
    if (response.statusCode == 200) {
      List<dynamic> body = jsonDecode(response.body);
      return body.map((dynamic item) => Post.fromJson(item)).toList();
    } else {
      throw Exception("Failed to load posts");
    }
  }

  Future<List<Comment>> fetchComments(int postId) async {
    final response = await http.get(Uri.parse("$baseUrl/posts/$postId/comments"));
    if (response.statusCode == 200) {
      List<dynamic> body = jsonDecode(response.body);
      return body.map((dynamic item) => Comment.fromJson(item)).toList();
    } else {
      throw Exception("Failed to load comments");
    }
  }

  // Nuevo método para obtener los todos
  Future<List<Todo>> fetchTodos() async {
    final response = await http.get(Uri.parse("$baseUrl/todos"));
    if (response.statusCode == 200) {
      List<dynamic> body = jsonDecode(response.body);
      return body.map((dynamic item) => Todo.fromJson(item)).toList();
    } else {
      throw Exception("Failed to load todos");
    }
  }
}
