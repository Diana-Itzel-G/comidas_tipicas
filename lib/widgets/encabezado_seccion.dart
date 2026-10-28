import 'package:flutter/material.dart';
import '../tema.dart';

/// Encabezado de seccion: icono en un cuadro de color, titulo y subtitulo opcional.
class EncabezadoSeccion extends StatelessWidget {
  final IconData icono;
  final String titulo;
  final String? subtitulo;
  final EdgeInsetsGeometry margen;

  const EncabezadoSeccion({
    super.key,
    required this.icono,
    required this.titulo,
    this.subtitulo,
    this.margen = const EdgeInsets.fromLTRB(20, 24, 20, 12),
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: margen,
      child: Row(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: Colores.primarioSuave,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(icono, color: Colores.primario, size: 22),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  titulo,
                  style: const TextStyle(
                    fontSize: 19,
                    fontWeight: FontWeight.w700,
                    color: Colores.texto,
                  ),
                ),
                if (subtitulo != null) ...[
                  const SizedBox(height: 2),
                  Text(
                    subtitulo!,
                    style: const TextStyle(
                      fontSize: 13,
                      color: Colores.textoSuave,
                    ),
                  ),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }
}