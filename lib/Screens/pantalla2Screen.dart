import 'package:flutter/material.dart';

class pantalla2 extends StatefulWidget {
  const pantalla2({super.key});

  @override
  State<pantalla2> createState() => _pantalla2State();
}

class _pantalla2State extends State<pantalla2> {
  final sistolicaController = TextEditingController();
  final diastolicaController = TextEditingController();

  void calcularPAM() {
    double sistolica = double.tryParse(sistolicaController.text) ?? 0;
    double diastolica = double.tryParse(diastolicaController.text) ?? 0;

    if (sistolica <= diastolica) {
      _mostrarResultado("Error: valores inválidos.\nLa sistólica debe ser mayor que la diastólica.");
    } else {
      double pam = diastolica + (sistolica - diastolica) / 3;
      _mostrarResultado("PAM: ${pam.toStringAsFixed(2)} mmHg");
    }
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
      appBar: AppBar(title: Text("Presión arterial PAM")),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: sistolicaController,
              decoration: InputDecoration(
                labelText: "Presión Sistólica (mmHg)",
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 16),
            TextField(
              controller: diastolicaController,
              decoration: InputDecoration(
                labelText: "Presión Diastólica (mmHg)",
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 24),
            ElevatedButton(
              onPressed: calcularPAM,
              child: Text("Calcular PAM"),
            ),
          ],
        ),
      ),
    );
  }
}
