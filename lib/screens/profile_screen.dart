import "package:flutter/material.dart";

//NOTA: LOS STATEFUL NECESITAN CREAR UNA CLASE DE "ESTADO" PARA FUNCIONAR
class ProfileScreen extends StatefulWidget{
  const ProfileScreen({super.key}); // practica de buena programacion
  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
  
}
// CLASE DE ESTADO
class _ProfileScreenState extends State<ProfileScreen>{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        leading: Text("APP_WEB"),
        actions: [

        IconButton(
        icon: Icon(Icons.star),
        onPressed: () {},
        ),
          
        IconButton(
        icon: Icon(Icons.star),
        onPressed: () {},
        ),
      
         IconButton(
        icon: Icon(Icons.star),
        onPressed: () {},
        ),
             
        ],
        

      ),
  body: Center(child: Column(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [  IconButton(
        icon: Icon(Icons.star),
        onPressed: () {},
        ),
    
       IconButton(
        icon: Icon(Icons.star),
        onPressed: () {},
        ),
          
           
      
       IconButton(
        icon: Icon(Icons.star),
        onPressed: () {},
        ),
        ],
        
  ) 
     ) );
  }
}