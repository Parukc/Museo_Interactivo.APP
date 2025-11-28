import 'package:flutter/material.dart';
import 'app_router.dart';

void main() {
  runApp(const Museo());
}

class Museo extends StatelessWidget {
  const Museo({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Museo - Interactivo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
        useMaterial3: true,
      ),
      routerConfig: appRouter,
    );
  }
}
