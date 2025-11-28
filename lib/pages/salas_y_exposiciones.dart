import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';


class Salas_y_exposiciones extends StatefulWidget {
  const Salas_y_exposiciones({super.key});

  @override
  State<Salas_y_exposiciones> createState() => _Salas_y_exposicionesState();
}

class _Salas_y_exposicionesState extends State<Salas_y_exposiciones> {
  String packageType = 'Básico';
  String resultText = 'Seleccione un paquete para ver información.';

  void showPackageInfo() {
    switch (packageType) {
      case 'Básico':
        resultText = 'Incluye entrada general y guía básica.';
        break;
      case 'Completo':
        resultText = 'Incluye guía completa y acceso a zonas especiales.';
        break;
      case 'Premium':
        resultText = 'Incluye tour privado y beneficios exclusivos.';
        break;
    }
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
              Expanded(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.asset(
                    'assets/images/museo_1.jpg',
                    fit: BoxFit.cover,
                    width: double.infinity,
                  ),
                ),
              ),
            const SizedBox(height: 16),
            DropdownButton<String>(
              value: packageType,
              isExpanded: true,
              items: const [
                DropdownMenuItem(
                  value: 'Básico',
                  child: Text('Historia'),
                ),
                DropdownMenuItem(
                  value: 'Completo',
                  child: Text('Arte moderno'),
                ),
                DropdownMenuItem(
                  value: 'Premium',
                  child: Text('Ciencia'),
                ),
                DropdownMenuItem(
                  value: 'Cultura',
                  child: Text('Cultura local'),
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
