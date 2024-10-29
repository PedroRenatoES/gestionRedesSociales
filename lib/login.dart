import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(controller: emailController, decoration: InputDecoration(labelText: 'Email')),
            TextField(controller: passwordController, decoration: InputDecoration(labelText: 'Contraseña'), obscureText: true),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => _loginUser(context), 
              child: Text("Ingresar"),
            ),
            TextButton(
              onPressed: () => _registerUser(context), 
              child: Text("Registrarse"),
            ),
          ],
        ),
      ),
    );
  }

  void _loginUser(BuildContext context) async {
    // Lógica de inicio de sesión con Firebase Authentication
  }

  void _registerUser(BuildContext context) async {
    // Lógica de registro con Firebase Authentication
  }
}
