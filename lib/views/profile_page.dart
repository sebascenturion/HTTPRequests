import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Perfil del Usuario"),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            CircleAvatar(
              radius: 50,
              backgroundImage: NetworkImage("https://via.placeholder.com/150"),
            ),
            SizedBox(height: 20),
            Text("Nombre: Seba Centurión", style: TextStyle(fontSize: 20)),
            SizedBox(height: 10),
            Text("Correo: scenturion@ejemplo.com", style: TextStyle(fontSize: 20)),
            SizedBox(height: 10),
            Text("Teléfono: 021 20 90 00", style: TextStyle(fontSize: 20)),
            SizedBox(height: 10),
            Text("Ciudad: San Lorenzo", style: TextStyle(fontSize: 20)),
          ],
        ),
      ),
    );
  }
}
