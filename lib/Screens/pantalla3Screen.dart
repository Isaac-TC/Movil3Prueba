import 'package:flutter/material.dart';

class pantalla3 extends StatefulWidget {
  const pantalla3({super.key});

  @override
  State<pantalla3> createState() => _pantalla3State();
}

class _pantalla3State extends State<pantalla3> {
  final distanciaController = TextEditingController();
  final eficienciaController = TextEditingController();
  final precioController = TextEditingController();

  void calcularCosto() {
    double distancia = double.tryParse(distanciaController.text) ?? 0;
    double eficiencia = double.tryParse(eficienciaController.text) ?? 0;
    double precio = double.tryParse(precioController.text) ?? 0;

    if (eficiencia <= 0) {
      _mostrarResultado("Error: La eficiencia debe ser mayor a 0.");
      return;
    }

    double litrosNecesarios = distancia / eficiencia;
    double costoTotal = litrosNecesarios * precio;

    _mostrarResultado("Costo total del viaje: \$${costoTotal.toStringAsFixed(2)}");
  }

  void _mostrarResultado(String mensaje) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("Resultado"),
        content: Text(mensaje),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text("Cerrar"),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Costo total viaje")),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: distanciaController,
              decoration: InputDecoration(
                labelText: "Distancia del viaje (km)",
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 16),
            TextField(
              controller: eficienciaController,
              decoration: InputDecoration(
                labelText: "Eficiencia del auto (km/litro)",
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 16),
            TextField(
              controller: precioController,
              decoration: InputDecoration(
                labelText: "Precio por litro (USD)",
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 24),
            ElevatedButton(
              onPressed: calcularCosto,
              child: Text("Calcular Costo"),
            ),
          ],
        ),
      ),
    );
  }
}
