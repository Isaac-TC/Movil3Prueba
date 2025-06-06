import 'package:flutter/material.dart';

class pantalla1 extends StatefulWidget {
  const pantalla1({super.key});

  @override
  State<pantalla1> createState() => _pantalla1State();
}

class _pantalla1State extends State<pantalla1> {
  final generoController = TextEditingController();
  final actividadController = TextEditingController();
  final pesoController = TextEditingController();
  final alturaController = TextEditingController();
  final edadController = TextEditingController();

  void mostrarAlerta(String mensaje) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("Resultado"),
        content: Text(mensaje),
        actions: [
          TextButton(
              onPressed: () => Navigator.pop(context), child: Text("OK"))
        ],
      ),
    );
  }

  void calcularCalorias() {
    String genero = generoController.text.trim().toLowerCase();
    String actividad = actividadController.text.trim().toLowerCase();
    double peso = double.tryParse(pesoController.text) ?? 0;
    double altura = double.tryParse(alturaController.text) ?? 0;
    int edad = int.tryParse(edadController.text) ?? 0;

    if (genero != 'hombre' && genero != 'mujer') {
      mostrarAlerta("Género inválido. Escriba 'hombre' o 'mujer'.");
      return;
    }

    Map<String, double> factores = {
      'sedentario': 1.2,
      'ligero': 1.375,
      'moderado': 1.55,
      'activo': 1.725,
      'muy activo': 1.9
    };

    if (!factores.containsKey(actividad)) {
      mostrarAlerta(
          "Actividad inválida. Escriba: sedentario, ligero, moderado, activo o muy activo.");
      return;
    }

    double bmr = genero == 'hombre'
        ? 88.36 + (13.4 * peso) + (4.8 * altura) - (5.7 * edad)
        : 447.6 + (9.2 * peso) + (3.1 * altura) - (4.3 * edad);

    double calorias = bmr * factores[actividad]!;

    mostrarAlerta(
        "Calorías diarias recomendadas: ${calorias.toStringAsFixed(2)} kcal");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Calorias diarias recomendadas")),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            Image.asset("assets/images/descarga.jpeg", height: 150),
            SizedBox(height: 20),
            TextField(
              controller: generoController,
              decoration: InputDecoration(labelText: "Género (hombre/mujer)"),
            ),
            TextField(
              controller: pesoController,
              decoration: InputDecoration(labelText: "Peso (kg)"),
              keyboardType: TextInputType.number,
            ),
            TextField(
              controller: alturaController,
              decoration: InputDecoration(labelText: "Altura (cm)"),
              keyboardType: TextInputType.number,
            ),
            TextField(
              controller: edadController,
              decoration: InputDecoration(labelText: "Edad"),
              keyboardType: TextInputType.number,
            ),
            TextField(
              controller: actividadController,
              decoration: InputDecoration(
                labelText:
                    "Nivel de actividad (sedentario, ligero, moderado, activo, muy activo)",
              ),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: calcularCalorias,
              child: Text("Calcular"),
            ),
          ],
        ),
      ),
    );
  }
}
