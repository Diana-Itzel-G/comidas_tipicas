import 'package:flutter/material.dart';
import '../tema.dart';

/// Lista de ingredientes, cada uno con una vineta circular.
class ListaIngredientes extends StatelessWidget {
  final List<String> ingredientes;

  const ListaIngredientes({super.key, required this.ingredientes});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: ingredientes
          .map(
            (ingrediente) => Padding(
              padding: const EdgeInsets.symmetric(vertical: 6),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: const EdgeInsets.only(top: 7),
                    width: 8,
                    height: 8,
                    decoration: const BoxDecoration(
                      color: Colores.mostaza,
                      shape: BoxShape.circle,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      ingrediente,
                      style: const TextStyle(fontSize: 16, height: 1.4),
                    ),
                  ),
                ],
              ),
            ),
          )
          .toList(),
    );
  }
}