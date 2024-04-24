import 'package:flutter/material.dart';
import 'posts_page.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController controladorEmail = TextEditingController();
  final TextEditingController controladorContrasena = TextEditingController();
  final GlobalKey<FormState> claveFormulario = GlobalKey<FormState>();
  bool contrasenaVisible = false;

  void iniciarSesion() {
    if (claveFormulario.currentState!.validate()) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => PostsPage()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Inicio de Sesión")),
      body: Form(
        key: claveFormulario,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                controller: controladorEmail,
                decoration: InputDecoration(labelText: 'Correo Electrónico'),
                keyboardType: TextInputType.emailAddress,
                validator: (valor) {
                  if (valor == null || valor.isEmpty) {
                    return 'Por favor ingrese su correo electrónico';
                  }
                  if (!valor.contains('@')) {
                    return 'Ingrese un correo electrónico válido';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              TextFormField(
                controller: controladorContrasena,
                decoration: InputDecoration(
                  labelText: 'Contraseña',
                  suffixIcon: IconButton(
                    icon: Icon(
                      contrasenaVisible ? Icons.visibility_off : Icons.visibility,
                    ),
                    onPressed: () {
                      setState(() {
                        contrasenaVisible = !contrasenaVisible;
                      });
                    },
                  ),
                ),
                obscureText: !contrasenaVisible,
                validator: (valor) {
                  if (valor == null || valor.isEmpty) {
                    return 'Por favor ingrese su contraseña';
                  }
                  if (valor.length < 6) {
                    return 'La contraseña debe tener al menos 6 caracteres';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: iniciarSesion,
                child: Text('Ingresar'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    controladorEmail.dispose();
    controladorContrasena.dispose();
    super.dispose();
  }
}
