import 'package:flutter/material.dart';
import '../tema.dart';

class EstadoVacio extends StatelessWidget {
  final IconData icono;
  final String titulo;
  final String mensaje;

  const EstadoVacio({
    super.key,
    required this.icono,
    required this.titulo,
    required this.mensaje,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: const EdgeInsets.all(20),
              decoration: const BoxDecoration(
                color: Colores.primarioSuave,
                shape: BoxShape.circle,
              ),
              child: Icon(icono, size: 40, color: Colores.primario),
            ),
            const SizedBox(height: 20),
            Text(
              titulo,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
            ),
            const SizedBox(height: 8),
            Text(
              mensaje,
              textAlign: TextAlign.center,
              style: const TextStyle(color: Colores.textoSuave),
            ),
          ],
        ),
      ),
    );
  }
}