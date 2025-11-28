import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';


class Salas_y_exposiciones extends StatelessWidget {
  const Salas_y_exposiciones({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sala o Exposiciones Destacado'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.go('/'),
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
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
              const Text(
                'Museo de la Cultura Inca',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


class PaquetesServicio extends StatefulWidget {
  const PaquetesServicio({super.key});

  @override
  State<PaquetesServicio> createState() => _PaquetesServicioState();
}

class _PaquetesServicioState extends State<PaquetesServicio> {
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

            DropdownButton<String>(
              value: packageType,
              isExpanded: true,
              items: const [
                DropdownMenuItem(
                  value: 'Básico',
                  child: Text('Paquete básico'),
                ),
                DropdownMenuItem(
                  value: 'Completo',
                  child: Text('Paquete completo'),
                ),
                DropdownMenuItem(
                  value: 'Premium',
                  child: Text('Paquete premium'),
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
