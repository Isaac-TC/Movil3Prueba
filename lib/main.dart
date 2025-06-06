
import 'package:flutter/material.dart';
import 'package:prueba_1/Screens/pantalla1Screen.dart';
import 'package:prueba_1/Screens/pantalla2Screen.dart';
import 'package:prueba_1/Screens/pantalla3Screen.dart';

void main (){
  runApp(Ejercicio04App());
}
class Ejercicio04App extends StatelessWidget {
  const Ejercicio04App({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Cuerpo(),
     
    );
  }
}

class Cuerpo extends StatefulWidget {
  const Cuerpo({super.key});
 

  @override
  State<Cuerpo> createState() => _CuerpoState();
}

class _CuerpoState extends State<Cuerpo> {
   int indice = 1;

   List <Widget> paginas=[pantalla1(), pantalla2(),pantalla3()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("EJERCICIOS"),
        actions:[IconButton(onPressed: ()=>mensajesCreditos(context), icon: Icon(Icons.text_snippet))]
         ),
       


      body: paginas[indice],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: indice,

        onTap: (value) {
          setState(() {
            indice = value ;
          });
          
        },
        
        
        items: [
        BottomNavigationBarItem(icon:   Icon(Icons.filter_1),label: "Ejercicio 1"),
        BottomNavigationBarItem(icon:   Icon(Icons.filter_2),label: "Ejercicio 2"),
        BottomNavigationBarItem(icon:   Icon(Icons.filter_3),label: "Ejercicio 3"),
      ],
      
      ),
    );
  }
}


void mensajesCreditos(BuildContext context) {
  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: Text("Ejercicios de Programación"),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Programador: Isaac Tonato"),
          SizedBox(height: 4),
          Text("Carrera: Desarrollo de Software"),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: Text("Cerrar"),
        )
      ],
    ),
  );
}


