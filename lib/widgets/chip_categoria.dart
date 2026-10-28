import 'package:flutter/material.dart';
import '../tema.dart';

/// Chip seleccionable para categorias y estados.
class ChipCategoria extends StatelessWidget {
  final String texto;
  final bool seleccionada;
  final VoidCallback onTap;

  const ChipCategoria({
    super.key,
    required this.texto,
    required this.onTap,
    this.seleccionada = false,
  });

  @override
  Widget build(BuildContext context) {
    return ChoiceChip(
      label: Text(texto),
      selected: seleccionada,
      showCheckmark: false,
      onSelected: (_) => onTap(),
      selectedColor: Colores.primario,
      backgroundColor: Colors.white,
      side: const BorderSide(color: Colores.borde),
      labelStyle: TextStyle(
        color: seleccionada ? Colors.white : Colores.texto,
        fontWeight: FontWeight.w600,
      ),
    );
  }
}