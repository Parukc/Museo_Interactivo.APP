import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Tienda_de_recuerdos extends StatefulWidget {
  const Tienda_de_recuerdos({super.key});

  @override
  State<Tienda_de_recuerdos> createState() => _Tienda_de_recuerdosState();
}

class _Tienda_de_recuerdosState extends State<Tienda_de_recuerdos> {
  String packageType = 'Básico';
  String resultText = '';

  void showPackageInfo() {
    double price = 0;
    String description;

    if (packageType == 'Básico') {
      price = 40;
      description = 'Cambio de aceite y revisión visual.';
    } else if (packageType == 'Completo') {
      price = 80;
      description = 'Cambio de aceite, filtros y revisión de frenos.';
    } else {
      price = 120;
      description = 'Servicio completo, escaneo y alineación básica.';
    }

    setState(() {
      resultText =
        'Paquete: $packageType\n'
        'Precio: \$${price.toStringAsFixed(2)}\n'
        'Incluye: $description';
    });
  }

  @override
  void initState() {
    super.initState();
    showPackageInfo();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Paquetes de servicio'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.go('/'),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Seleccione un paquete',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),

            DropdownButton<String>(
              value: packageType,
              isExpanded: true,
              items: const [
                DropdownMenuItem(
                  value: 'Básico',
                  child: Text('Postales'),
                ),
                DropdownMenuItem(
                  value: 'Completo',
                  child: Text('Libros'),
                ),
                DropdownMenuItem(
                  value: 'Medium',
                  child: Text('Figuras'),
                ),
                DropdownMenuItem(
                  value: 'Premium',
                  child: Text('Camisetas'),
                ),
              ],
              onChanged: (value) {
                if (value == null) return;
                setState(() {
                  packageType = value;
                  showPackageInfo();
                });
              },
            ),

            const SizedBox(height: 16),
            Text(resultText),
          ],
        ),
      ),
    );
  }
}
