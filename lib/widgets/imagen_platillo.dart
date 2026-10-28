import 'package:flutter/material.dart';
import '../tema.dart';

/// Imagen de red con esquinas redondeadas, indicador de carga y respaldo si falla.
class ImagenPlatillo extends StatelessWidget {
  final String url;
  final double? ancho;
  final double? alto;
  final double radio;

  const ImagenPlatillo({
    super.key,
    required this.url,
    this.ancho,
    this.alto,
    this.radio = 12,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(radio),
      child: SizedBox(
        width: ancho,
        height: alto,
        child: Image.network(
          url,
          fit: BoxFit.cover,
          loadingBuilder: (context, child, progreso) {
            if (progreso == null) return child;
            return Container(
              color: Colores.primarioSuave,
              alignment: Alignment.center,
              child: const SizedBox(
                width: 22,
                height: 22,
                child: CircularProgressIndicator(strokeWidth: 2),
              ),
            );
          },
          errorBuilder: (context, error, stack) => Container(
            color: Colores.primarioSuave,
            alignment: Alignment.center,
            child: const Icon(Icons.restaurant_rounded, color: Colores.primario),
          ),
        ),
      ),
    );
  }
}