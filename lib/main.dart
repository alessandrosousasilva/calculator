import 'package:flutter/material.dart';

void main() => runApp(CalculadoraApp());

class CalculadoraApp extends StatelessWidget {
  const CalculadoraApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Calculadora ',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.grey[100],
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: Colors.green[800],
          secondary: Colors.greenAccent,
        ),
      ),
      home: CalculadoraPage(),
    );
  }
}

class CalculadoraPage extends StatefulWidget {
  const CalculadoraPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _CalculadoraPageState createState() => _CalculadoraPageState();
}

class _CalculadoraPageState extends State<CalculadoraPage> {
  final valor1Controller = TextEditingController();
  final valor2Controller = TextEditingController();
  String resultado = '';

  void calcular(String operador) {
    double num1 = double.tryParse(valor1Controller.text) ?? 0;
    double num2 = double.tryParse(valor2Controller.text) ?? 0;
    double res = 0;

    switch (operador) {
      case '+':
        res = num1 + num2;
        break;
      case '-':
        res = num1 - num2;
        break;
      case '*':
        res = num1 * num2;
        break;
      case '/':
        res = num2 != 0 ? num1 / num2 : 0;
        break;
    }

    setState(() {
      resultado = 'Resultado: $res';
    });
  }

  Widget botaoOperacao(String simbolo) {
    return ElevatedButton(
      onPressed: () => calcular(simbolo),
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        shape: CircleBorder(),
        backgroundColor: Colors.green[800],
        shadowColor: Colors.black26,
        elevation: 6,
      ),
      child: Text(simbolo, style: TextStyle(fontSize: 20, color: Colors.white)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Calculadora"),
        centerTitle: true,
        backgroundColor: Colors.green[800],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              controller: valor1Controller,
              decoration: InputDecoration(
                labelText: "Valor 1",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                filled: true,
                fillColor: Colors.white,
              ),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 15),
            TextField(
              controller: valor2Controller,
              decoration: InputDecoration(
                labelText: "Valor 2",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                filled: true,
                fillColor: Colors.white,
              ),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 25),
            Wrap(
              spacing: 20,
              runSpacing: 20,
              children: [
                botaoOperacao('+'),
                botaoOperacao('-'),
                botaoOperacao('*'),
                botaoOperacao('/'),
              ],
            ),
            SizedBox(height: 30),
            Container(
              padding: EdgeInsets.all(16),
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.green[100],
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                resultado,
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
