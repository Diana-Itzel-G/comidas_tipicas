import 'package:flutter/material.dart';
import '../models/platillo.dart';
import '../tema.dart';
import 'etiqueta_origen.dart';
import 'imagen_platillo.dart';

/// Tarjeta vertical de un platillo: foto arriba, nombre y origen abajo.
/// Necesita una altura limitada (se usa en GridView o dentro de un SizedBox).
class TarjetaPlatillo extends StatelessWidget {
  final Platillo platillo;
  final VoidCallback onTap;

  const TarjetaPlatillo({super.key, required this.platillo, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      color: Colors.white,
      clipBehavior: Clip.antiAlias,
      margin: EdgeInsets.zero,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(18),
        side: const BorderSide(color: Colores.borde),
      ),
      child: InkWell(
        onTap: onTap,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: SizedBox(
                width: double.infinity,
                child: ImagenPlatillo(url: platillo.imagen, radio: 0),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    platillo.nombre,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w700,
                      color: Colores.texto,
                    ),
                  ),
                  const SizedBox(height: 6),
                  EtiquetaOrigen(origen: platillo.estado, tamano: 12),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}