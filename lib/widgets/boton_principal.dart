import 'package:flutter/material.dart';
import '../tema.dart';

/// Boton con icono: relleno (principal) o con borde (secundario).
class BotonPrincipal extends StatelessWidget {
  final String texto;
  final IconData icono;
  final VoidCallback onPressed;
  final bool relleno;

  const BotonPrincipal({
    super.key,
    required this.texto,
    required this.icono,
    required this.onPressed,
    this.relleno = true,
  });

  @override
  Widget build(BuildContext context) {
    final forma = RoundedRectangleBorder(borderRadius: BorderRadius.circular(14));
    const espacio = EdgeInsets.symmetric(vertical: 14, horizontal: 20);

    if (relleno) {
      return FilledButton.icon(
        onPressed: onPressed,
        icon: Icon(icono),
        label: Text(texto),
        style: FilledButton.styleFrom(
          backgroundColor: Colores.primario,
          padding: espacio,
          shape: forma,
        ),
      );
    }
    return OutlinedButton.icon(
      onPressed: onPressed,
      icon: Icon(icono),
      label: Text(texto),
      style: OutlinedButton.styleFrom(
        foregroundColor: Colores.primario,
        side: const BorderSide(color: Colores.primario),
        padding: espacio,
        shape: forma,
      ),
    );
  }
}