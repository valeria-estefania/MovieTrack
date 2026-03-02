import "package:flutter/material.dart";

class UserRegister extends StatefulWidget {
  const UserRegister({super.key});

  @override
  State<UserRegister> createState() => _UserRegisterState();
}

class _UserRegisterState extends State<UserRegister> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF210635),
      appBar: AppBar(
        backgroundColor: Color(0xFF210635),
        leading: IconButton(
          onPressed: () {},
          icon: Icon(Icons.arrow_left),
          style: IconButton.styleFrom(backgroundColor: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            // Título centrado
            Align(
              alignment: Alignment.center,
              child: Text(
                "REGISTRO",
                style: TextStyle(color: Color(0xFFF5D5E0)),
              ),
            ),
            SizedBox(height: 20),

            // Campo Nombre
            Align(
              alignment: Alignment.centerLeft,
              child: Text("NOMBRE", style: TextStyle(color: Color(0xFF6667AB))),
            ),
            SizedBox(height: 5),
            TextField(
              style: TextStyle(color: Colors.white), // texto que escribe el usuario
              cursorColor: Colors.white,
              decoration: InputDecoration(
                labelText: "INGRESA TU NOMBRE",
                labelStyle: TextStyle(color: Color(0xFFF5D5E0)),
                filled: true,
                fillColor: Color(0xFF420D4B),
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),

            // Campo Email
            Align(
              alignment: Alignment.centerLeft,
              child: Text("EMAIL", style: TextStyle(color: Color(0xFF6667AB))),
            ),
            SizedBox(height: 5),
            TextField(
              style: TextStyle(color: Colors.white),
              cursorColor: Colors.white,
              decoration: InputDecoration(
                labelText: "INGRESA TU EMAIL",
                labelStyle: TextStyle(color: Color(0xFFF5D5E0)),
                filled: true,
                fillColor: Color(0xFF420D4B),
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),

            // Campo Contraseña
            Align(
              alignment: Alignment.centerLeft,
              child: Text("CONTRASEÑA", style: TextStyle(color: Color(0xFF6667AB))),
            ),
            SizedBox(height: 5),
            TextField(
              style: TextStyle(color: Colors.white),
              cursorColor: Colors.white,
              decoration: InputDecoration(
                labelText: "CREA TU CONTRASEÑA",
                labelStyle: TextStyle(color: Color(0xFFF5D5E0)),
                filled: true,
                fillColor: Color(0xFF420D4B),
                border: OutlineInputBorder(),
              ),
              obscureText: true, // ocultar contraseña
            ),
            SizedBox(height: 20),

            // Botón CREAR CUENTA centrado
            Align(
              alignment: Alignment.center,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF7B337E),
                ),
                child: Text(
                  "CREAR CUENTA",
                  style: TextStyle(color: Color(0xFF6667AB)),
                ),
              ),
            ),
            SizedBox(height: 20),

            // Texto y botón de login centrados
            Align(
              alignment: Alignment.center,
              child: Column(
                children: [
                  Text("Ya tienes cuenta?", style: TextStyle(color: Color(0xFFF5D5E0))),
                  TextButton(
                    onPressed: () {},
                    child: Text("INICIA SESION"),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}