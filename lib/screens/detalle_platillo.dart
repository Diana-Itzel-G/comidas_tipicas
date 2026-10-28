import 'package:flutter/material.dart';
import '../models/platillo.dart';
import '../tema.dart';
import '../widgets/boton_principal.dart';
import '../widgets/encabezado_seccion.dart';
import '../widgets/etiqueta_origen.dart';
import '../widgets/imagen_platillo.dart';
import '../widgets/lista_ingredientes.dart';
import 'receta_screen.dart';

/// Pantalla 3: detalle del platillo. Recibe el objeto completo por constructor.
class DetallePlatilloScreen extends StatelessWidget {
  final Platillo platillo;

  const DetallePlatilloScreen({super.key, required this.platillo});

  /// Atajo para navegar a esta pantalla con Navigator.push.
  static void abrir(BuildContext context, Platillo platillo) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DetallePlatilloScreen(platillo: platillo),
      ),
    );
  }

  // Dato corto: icono arriba, valor en negritas y etiqueta debajo
  Widget _dato(IconData icono, String valor, String etiqueta) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icono, color: Colores.primario, size: 22),
        const SizedBox(height: 6),
        Text(valor, style: const TextStyle(fontWeight: FontWeight.w700)),
        const SizedBox(height: 2),
        Text(
          etiqueta,
          style: const TextStyle(fontSize: 12, color: Colores.textoSuave),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // CustomScrollView permite el SliverAppBar con la foto grande
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 300,
            pinned: true,
            backgroundColor: Colores.fondo,
            foregroundColor: Colores.texto,
            flexibleSpace: FlexibleSpaceBar(
              background: ImagenPlatillo(url: platillo.imagen, radio: 0),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(24, 20, 24, 32),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    platillo.nombre,
                    style: const TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.w700,
                      height: 1.2,
                    ),
                  ),
                  const SizedBox(height: 8),
                  EtiquetaOrigen(
                    origen: '${platillo.estado} · Región ${platillo.region}',
                    tamano: 14,
                  ),
                  const SizedBox(height: 18),
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(18),
                      border: Border.all(color: Colores.borde),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        _dato(Icons.schedule_rounded, platillo.tiempo, 'preparación'),
                        _dato(Icons.category_rounded, platillo.categoria, 'categoría'),
                        _dato(
                          Icons.shopping_basket_outlined,
                          '${platillo.ingredientes.length}',
                          'ingredientes',
                        ),
                      ],
                    ),
                  ),
                  const EncabezadoSeccion(
                    icono: Icons.notes_rounded,
                    titulo: 'Descripción',
                    margen: EdgeInsets.fromLTRB(0, 24, 0, 10),
                  ),
                  Text(
                    platillo.descripcion,
                    style: const TextStyle(fontSize: 16, height: 1.6),
                  ),
                  const EncabezadoSeccion(
                    icono: Icons.shopping_basket_outlined,
                    titulo: 'Ingredientes',
                    margen: EdgeInsets.fromLTRB(0, 24, 0, 8),
                  ),
                  ListaIngredientes(ingredientes: platillo.ingredientes),
                  const SizedBox(height: 28),
                  SizedBox(
                    width: double.infinity,
                    child: BotonPrincipal(
                      texto: 'Ver preparación',
                      icono: Icons.menu_book_rounded,
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                RecetaScreen(platillo: platillo),
                          ),
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 12),
                  SizedBox(
                    width: double.infinity,
                    child: BotonPrincipal(
                      texto: 'Volver',
                      icono: Icons.arrow_back_rounded,
                      relleno: false,
                      onPressed: () => Navigator.pop(context),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}