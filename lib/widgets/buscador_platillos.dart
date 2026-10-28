import 'package:flutter/material.dart';
import '../tema.dart';

/// Campo de busqueda con boton para borrar el texto.
/// El TextEditingController lo crea y destruye la pantalla que lo usa.
class BuscadorPlatillos extends StatelessWidget {
  final TextEditingController controlador;
  final ValueChanged<String> onCambio;

  const BuscadorPlatillos({
    super.key,
    required this.controlador,
    required this.onCambio,
  });

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<TextEditingValue>(
      valueListenable: controlador,
      builder: (context, valor, _) {
        return TextField(
          controller: controlador,
          onChanged: onCambio,
          decoration: InputDecoration(
            hintText: 'Buscar platillo, estado o ingrediente',
            hintStyle: const TextStyle(color: Colores.textoSuave),
            filled: true,
            fillColor: Colors.white,
            prefixIcon: const Icon(Icons.search_rounded, color: Colores.primario),
            suffixIcon: valor.text.isEmpty
                ? null
                : IconButton(
                    icon: const Icon(Icons.close_rounded),
                    onPressed: () {
                      controlador.clear();
                      onCambio('');
                    },
                  ),
            contentPadding: const EdgeInsets.symmetric(vertical: 14),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: const BorderSide(color: Colores.borde),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: const BorderSide(color: Colores.primario, width: 1.5),
            ),
          ),
        );
      },
    );
  }
}