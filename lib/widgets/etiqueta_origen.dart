import 'package:flutter/material.dart';
import '../tema.dart';

/// Muestra el origen de un platillo (estado o region), con un icono de ubicacion.
class EtiquetaOrigen extends StatelessWidget {
  final String origen;
  final double tamano;

  const EtiquetaOrigen({super.key, required this.origen, this.tamano = 13});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(Icons.location_on_outlined, size: tamano + 2, color: Colores.primario),
        const SizedBox(width: 2),
        Text(
          origen,
          style: TextStyle(fontSize: tamano, color: Colores.textoSuave),
        ),
      ],
    );
  }
}