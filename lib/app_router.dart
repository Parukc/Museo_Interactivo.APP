import 'package:go_router/go_router.dart';


import 'pages/plan_de_visita.dart';
import 'pages/pantalla_principal.dart';
import 'pages/salas_y_exposiciones.dart';
import 'pages/tienda_de_recuerdos.dart';



final GoRouter appRouter = GoRouter(
  routes: [
        GoRoute(
      path: '/',
      builder: (_, __) => const Pantalla_principal(),
    ),
    GoRoute(
      path: '/visita',
      builder: (_, __) => const Plan_de_visita(),
    ),
    GoRoute(
      path: '/salas',
      builder: (_, __) => const Salas_y_exposiciones(),
    ),
    GoRoute(
      path: '/recuerdos',
      builder: (_, __) => const Tienda_de_recuerdos(),
    ),
  ],
);
