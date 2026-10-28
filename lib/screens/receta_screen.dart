import 'package:flutter/material.dart';
import '../models/platillo.dart';
import '../tema.dart';
import '../widgets/boton_principal.dart';
import '../widgets/encabezado_seccion.dart';
import '../widgets/lista_ingredientes.dart';
import '../widgets/paso_preparacion.dart';

/// Pantalla 4: preparacion de la receta (ingredientes y pasos).
class RecetaScreen extends StatelessWidget {
  final Platillo platillo;

  const RecetaScreen({super.key, required this.platillo});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Preparación',
          style: TextStyle(fontWeight: FontWeight.w700),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(24, 8, 24, 32),
        children: [
          Text(
            platillo.nombre,
            style: const TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.w700,
              height: 1.2,
              color: Colores.texto,
            ),
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              const Icon(Icons.schedule_rounded, size: 18, color: Colores.primario),
              const SizedBox(width: 6),
              Text(
                '${platillo.tiempo} · ${platillo.pasos.length} pasos',
                style: const TextStyle(color: Colores.textoSuave),
              ),
            ],
          ),
          const EncabezadoSeccion(
            icono: Icons.shopping_basket_outlined,
            titulo: 'Ingredientes necesarios',
            margen: EdgeInsets.fromLTRB(0, 24, 0, 8),
          ),
          ListaIngredientes(ingredientes: platillo.ingredientes),
          const EncabezadoSeccion(
            icono: Icons.format_list_numbered_rounded,
            titulo: 'Paso a paso',
            margen: EdgeInsets.fromLTRB(0, 24, 0, 8),
          ),
          // asMap().entries nos da el indice para numerar los pasos
          ...platillo.pasos.asMap().entries.map(
                (entrada) => PasoPreparacion(
                  numero: entrada.key + 1,
                  texto: entrada.value,
                ),
              ),
          const SizedBox(height: 28),
          BotonPrincipal(
            texto: 'Volver',
            icono: Icons.arrow_back_rounded,
            onPressed: () => Navigator.pop(context),
          ),
        ],
      ),
    );
  }
}