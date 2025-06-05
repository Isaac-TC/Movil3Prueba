import 'package:flutter/material.dart';

class pantalla1 extends StatelessWidget {
  const pantalla1({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(title: Text("PANTALLA1"),),
      body: Center(child: Text("SCREEN 01"),),
    );
  }
}