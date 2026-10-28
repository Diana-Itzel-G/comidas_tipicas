import 'package:flutter/material.dart';
import '../data/platillo_data.dart';
import '../models/platillo.dart';
import '../services/platillo_service.dart';
import '../widgets/buscador_platillos.dart';
import '../widgets/chip_categoria.dart';
import '../widgets/estado_vacio.dart';
import '../widgets/tarjeta_platillo.dart';
import 'detalle_platillo.dart';

/// Pantalla 2: catalogo en cuadricula, con buscador y filtro por categoria.
class CatalogoScreen extends StatefulWidget {
  // Si viene de la pantalla de inicio, ya trae una categoria elegida
  final String? categoriaInicial;

  const CatalogoScreen({super.key, this.categoriaInicial});

  @override
  State<CatalogoScreen> createState() => _CatalogoScreenState();
}

class _CatalogoScreenState extends State<CatalogoScreen> {
  late final Future<List<Platillo>> _futuro;
  final TextEditingController _controlador = TextEditingController();
  late String _categoria;
  String _texto = '';

  @override
  void initState() {
    super.initState();
    _futuro = PlatilloData.cargar();
    _categoria = widget.categoriaInicial ?? 'Todas';
  }

  @override
  void dispose() {
    _controlador.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Catálogo de platillos',
          style: TextStyle(fontWeight: FontWeight.w700),
        ),
      ),
      body: FutureBuilder<List<Platillo>>(
        future: _futuro,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError || !snapshot.hasData) {
            return const EstadoVacio(
              icono: Icons.error_outline_rounded,
              titulo: 'No pudimos cargar los platillos',
              mensaje: 'Intenta de nuevo más tarde.',
            );
          }

          final platillos = snapshot.data!;
          final categorias = ['Todas', ...PlatilloService.categorias(platillos)];
          final visibles = PlatilloService.buscar(
            platillos,
            texto: _texto,
            categoria: _categoria,
          );

          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 4, 20, 12),
                child: BuscadorPlatillos(
                  controlador: _controlador,
                  onCambio: (valor) => setState(() => _texto = valor),
                ),
              ),
              SizedBox(
                height: 48,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  itemCount: categorias.length,
                  separatorBuilder: (context, indice) => const SizedBox(width: 8),
                  itemBuilder: (context, indice) {
                    final categoria = categorias[indice];
                    return ChipCategoria(
                      texto: categoria,
                      seleccionada: categoria == _categoria,
                      onTap: () => setState(() => _categoria = categoria),
                    );
                  },
                ),
              ),
              Expanded(
                child: visibles.isEmpty
                    ? const EstadoVacio(
                        icono: Icons.search_off_rounded,
                        titulo: 'Sin resultados',
                        mensaje: 'Prueba con otro nombre, estado o categoría.',
                      )
                    : GridView.builder(
                        padding: const EdgeInsets.fromLTRB(20, 8, 20, 24),
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: 14,
                          crossAxisSpacing: 14,
                          childAspectRatio: 0.72,
                        ),
                        itemCount: visibles.length,
                        itemBuilder: (context, indice) {
                          final platillo = visibles[indice];
                          return TarjetaPlatillo(
                            platillo: platillo,
                            onTap: () =>
                                DetallePlatilloScreen.abrir(context, platillo),
                          );
                        },
                      ),
              ),
            ],
          );
        },
      ),
    );
  }
}