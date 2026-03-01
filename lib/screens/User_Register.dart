import "package:flutter/material.dart";

//NOTA: LOS STATEFUL NECESITAN CREAR UNA CLASE DE "ESTADO" PARA FUNCIONAR
class UserRegister extends StatefulWidget{
  const UserRegister({super.key}); // practica de buena programacion
  @override
  State<UserRegister> createState() => _UserRegisterState();
  
}
// CLASE DE ESTADO
class _UserRegisterState extends State<UserRegister>{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Color(0xFF210635),
     appBar: AppBar(
      backgroundColor: Color(0xFF210635),
     leading: IconButton(onPressed: (){}, icon: Icon(Icons.arrow_left), style: (IconButton.styleFrom(backgroundColor: Color.fromARGB(255, 255, 255, 255)))),
     //title: Text("REGISTRO",style: TextStyle(color: Color(0xFFF5D5E0)),), Prueba
     ),
     body: 
      Column(children: [Text("REGISTRO",style: TextStyle(color: Color(0xFFF5D5E0)),),
      Text("NOMBRE",style: TextStyle(color: Color(0xFF6667AB), ),),
      TextField(decoration: InputDecoration(labelText:"INGRESA TU NOMBRE",labelStyle: TextStyle(color: Color(0xFFF5D5E0)), border: OutlineInputBorder(), fillColor:Color(0xFF420D4B),filled:true  ),),
       Text("EMAIL",style: TextStyle(color: Color(0xFF6667AB)),),
      TextField(decoration: InputDecoration(labelText:"INGRESA TU EMAIL",labelStyle: TextStyle(color: Color(0xFFF5D5E0)), border: OutlineInputBorder(),fillColor:  Color(0xFF420D4B), filled: true ),),
       Text("CONTRASEÑA",style: TextStyle(color: Color(0xFF6667AB)),),
      TextField(decoration: InputDecoration(labelText:"CREA TU CONTRASEÑA",labelStyle: TextStyle(color: Color(0xFFF5D5E0)), border: OutlineInputBorder(),fillColor:  Color(0xFF420D4B),filled: true ),),
      ElevatedButton(onPressed: (){},style: ElevatedButton.styleFrom(backgroundColor: Color(0xFF7B337E),),child: Text("CREAR CUENTA",style: TextStyle(color: Color(0xFF6667AB)),)),
      Text("Ya tienes cuenta?",style: TextStyle(color: Color(0xFFF5D5E0)),),TextButton(onPressed: (){} ,child: Text("INICIA SESION")),

     ],
         ),
    );}
}
   