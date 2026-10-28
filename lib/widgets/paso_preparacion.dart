import 'package:flutter/material.dart';
import '../tema.dart';

/// Un paso de la preparacion, con su numero en un circulo.
class PasoPreparacion extends StatelessWidget {
  final int numero;
  final String texto;

  const PasoPreparacion({super.key, required this.numero, required this.texto});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: 15,
            backgroundColor: Colores.primario,
            child: Text(
              '$numero',
              style: const TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Text(
              texto,
              style: const TextStyle(fontSize: 16, height: 1.5, color: Colores.texto),
            ),
          ),
        ],
      ),
    );
  }
}