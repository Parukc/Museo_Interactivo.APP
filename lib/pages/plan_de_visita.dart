import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Plan_de_visita extends StatefulWidget {
  const Plan_de_visita({super.key});

  @override
  State<Plan_de_visita> createState() => _Plan_de_visita();
}

class _Plan_de_visita extends State<Plan_de_visita> {
  String subjectsCountText = '';
  int subjectsCount = 0;

  final List<TextEditingController> subjectNameControllers = [];
  final List<TextEditingController> creditsControllers = [];

  String resultText = '';

  void _generateSubjects() {
    final parsed = int.tryParse(subjectsCountText) ?? 0;

    if (parsed <= 0 || parsed > 8) {
      setState(() {
        resultText = 'Ingrese la cantidad de  Salas a Visitar 4-5';
        subjectsCount = 0;
        subjectNameControllers.clear();
        creditsControllers.clear();
      });
      return;
    }

    subjectsCount = parsed;
    subjectNameControllers.clear();
    creditsControllers.clear();

    for (int i = 0; i < subjectsCount; i++) {
      subjectNameControllers.add(TextEditingController());
      creditsControllers.add(TextEditingController());
    }

    setState(() {
      resultText = 'Ingrese nombre de la sala y tiempo del tour.';
    });
  }

  void _calculateCredits() {
    if (subjectsCount == 0) {
      setState(() {
        resultText = 'Primero indique cuántas materias tiene y genere el formulario.';
      });
      return;
    }

    int totalCredits = 0;
    final List<String> lines = [];

    for (int i = 0; i < subjectsCount; i++) {
      final name = subjectNameControllers[i].text.trim().isEmpty
          ? 'Materia ${i + 1}'
          : subjectNameControllers[i].text.trim();

      final credits = int.tryParse(
            creditsControllers[i].text.trim(),
          ) ??
          0;

      totalCredits += credits;
      lines.add('- $name: $credits minutos');
    }

    String loadType;
    if (totalCredits < 12) {
      loadType = 'Carga ligera';
    } else if (totalCredits <= 20) {
      loadType = 'Carga normal';
    } else {
      loadType = 'Carga pesada';
    }

    setState(() {
      resultText =
        'Salas elegidas:\n'
        '${lines.join('\n')}\n\n'
        'Tiempor total: $totalCredits\n';
    });
  }

  @override
  void dispose() {
    for (final c in subjectNameControllers) {
      c.dispose();
    }
    for (final c in creditsControllers) {
      c.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Selecciòn de salas'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.go('/'),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text(
                'Salas elegidas',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 12),

              TextField(
                decoration: const InputDecoration(
                  labelText: 'Cantidad dde Salas 1-5',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  subjectsCountText = value;
                },
              ),

              const SizedBox(height: 12),
              ElevatedButton(
                onPressed: _generateSubjects,
                child: const Text('Generar Salas'),
              ),

              const SizedBox(height: 16),

              if (subjectsCount > 0)
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: subjectsCount,
                  itemBuilder: (context, index) {
                    return Card(
                      margin: const EdgeInsets.symmetric(vertical: 6),
                      child: Padding(
                        padding: const EdgeInsets.all(8),
                        child: Row(
                          children: [
                            Expanded(
                              flex: 2,
                              child: TextField(
                                controller: subjectNameControllers[index],
                                decoration: InputDecoration(
                                  labelText: 'Sala ${index + 1}',
                                  border: const OutlineInputBorder(),
                                ),
                              ),
                            ),
                            const SizedBox(width: 8),
                            Expanded(
                              child: TextField(
                                controller: creditsControllers[index],
                                decoration: const InputDecoration(
                                  labelText: 'Tiempo',
                                  border: OutlineInputBorder(),
                                ),
                                keyboardType: TextInputType.number,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),

              const SizedBox(height: 16),
              if (subjectsCount > 0)
                ElevatedButton(
                  onPressed: _calculateCredits,
                  child: const Text('Calcular tiempo total'),
                ),

              const SizedBox(height: 16),
              Text(resultText),
            ],
          ),
        ),
      ),
    );
  }
}
