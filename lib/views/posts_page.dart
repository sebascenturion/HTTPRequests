import 'package:flutter/material.dart';
import '../models/post.dart';
import '../services/api_service.dart';
import 'comments_page.dart';

class PostsPage extends StatefulWidget {
  @override
  _PostsPageState createState() => _PostsPageState();
}

class _PostsPageState extends State<PostsPage> {
  final ApiService api = ApiService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Posts")),
      body: FutureBuilder<List<Post>>(
        future: api.fetchPosts(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text("An error occurred"));
          }

          return ListView.builder(
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
              Post post = snapshot.data![index];
              Color bgColor = index % 2 == 0 ? (Colors.lightBlue[50] ?? Colors.lightBlue) : Colors.white;
              return Container(
                color: bgColor,
                child: ListTile(
                  title: Text(post.title),
                  subtitle: Text(post.body),
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => CommentsPage(postId: post.id)),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
