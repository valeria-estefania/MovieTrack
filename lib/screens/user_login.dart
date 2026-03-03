import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/Front.dart';

class UserLogin extends StatefulWidget {
  const UserLogin({super.key});

  @override
  State<UserLogin> createState() => _UserLoginState();
}

class _UserLoginState extends State<UserLogin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF210635),
      appBar: AppBar(
        backgroundColor: const Color(0xFF210635),
        leading: IconButton(
          onPressed: () {Navigator.push(context,MaterialPageRoute(builder: (context)=>HomeScreen()));},
          icon: const Icon(Icons.arrow_left),
          style: IconButton.styleFrom(
            backgroundColor: Colors.white,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const SizedBox(height: 20),

            // Título
            const Text(
              "INICIO DE SESIÓN",
              style: TextStyle(
                color: Color(0xFFF5D5E0),
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 40),

            // EMAIL
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "EMAIL",
                style: TextStyle(color: Color(0xFF6667AB)),
              ),
            ),
            const SizedBox(height: 5),

            TextField(
              style: const TextStyle(color: Colors.white),
              cursorColor: Colors.white,
              decoration: const InputDecoration(
                labelText: "INGRESA TU EMAIL",
                labelStyle: TextStyle(color: Color(0xFFF5D5E0)),
                filled: true,
                fillColor: Color(0xFF420D4B),
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 20),

            // CONTRASEÑA
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "CONTRASEÑA",
                style: TextStyle(color: Color(0xFF6667AB)),
              ),
            ),
            const SizedBox(height: 5),

            TextField(
              obscureText: true,
              style: const TextStyle(color: Colors.white),
              cursorColor: Colors.white,
              decoration: const InputDecoration(
                labelText: "INGRESA TU CONTRASEÑA",
                labelStyle: TextStyle(color: Color(0xFFF5D5E0)),
                filled: true,
                fillColor: Color(0xFF420D4B),
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 30),

            // BOTÓN
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF7B337E),
                padding: const EdgeInsets.symmetric(
                  horizontal: 40,
                  vertical: 12,
                ),
              ),
              child: const Text(
                "INICIAR SESIÓN",
                style: TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
