import 'package:flutter/material.dart';
import '../models/todo.dart';
import '../services/api_service.dart';

class TodosPage extends StatefulWidget {
  @override
  _TodosPageState createState() => _TodosPageState();
}

class _TodosPageState extends State<TodosPage> {
  final ApiService api = ApiService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Todos"),
      ),
      body: FutureBuilder<List<Todo>>(
        future: api.fetchTodos(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text("An error occurred"));
          }

          return ListView.builder(
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
              Todo todo = snapshot.data![index];
              return ListTile(
                title: Text(todo.title),
                leading: Icon(todo.completed ? Icons.check : Icons.close),
                subtitle: Text('User ID: ${todo.userId}'),
              );
            },
          );
        },
      ),
    );
  }
}
