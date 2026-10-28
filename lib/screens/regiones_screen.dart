import 'package:flutter/material.dart';
import '../data/platillo_data.dart';
import '../models/platillo.dart';
import '../services/platillo_service.dart';
import '../widgets/chip_categoria.dart';
import '../widgets/encabezado_seccion.dart';
import '../widgets/estado_vacio.dart';
import '../widgets/tarjeta_platillo.dart';
import 'detalle_platillo_screen.dart';

/// Pantalla 5: explorar los platillos segun su estado de origen.
class RegionesScreen extends StatefulWidget {
  const RegionesScreen({super.key});

  @override
  State<RegionesScreen> createState() => _RegionesScreenState();
}

class _RegionesScreenState extends State<RegionesScreen> {
  late final Future<List<Platillo>> _futuro;
  String? _estadoElegido; // null = todavia no eligen, se usa el primero

  @override
  void initState() {
    super.initState();
    _futuro = PlatilloData.cargar();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Regiones de México',
          style: TextStyle(fontWeight: FontWeight.w700),
        ),
      ),
      body: FutureBuilder<List<Platillo>>(
        future: _futuro,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError || !snapshot.hasData || snapshot.data!.isEmpty) {
            return const EstadoVacio(
              icono: Icons.error_outline_rounded,
              titulo: 'No pudimos cargar los platillos',
              mensaje: 'Intenta de nuevo más tarde.',
            );
          }

          final platillos = snapshot.data!;
          final estados = PlatilloService.estados(platillos);
          final actual = _estadoElegido ?? estados.first;
          final delEstado = PlatilloService.porEstado(platillos, actual);

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 48,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  itemCount: estados.length,
                  separatorBuilder: (context, indice) => const SizedBox(width: 8),
                  itemBuilder: (context, indice) {
                    final estado = estados[indice];
                    return ChipCategoria(
                      texto: estado,
                      seleccionada: estado == actual,
                      onTap: () => setState(() => _estadoElegido = estado),
                    );
                  },
                ),
              ),
              EncabezadoSeccion(
                icono: Icons.location_on_outlined,
                titulo: 'Platillos de $actual',
                subtitulo: 'Región ${delEstado.first.region}',
                margen: const EdgeInsets.fromLTRB(20, 12, 20, 12),
              ),
              Expanded(
                child: GridView.builder(
                  padding: const EdgeInsets.fromLTRB(20, 0, 20, 24),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 14,
                    crossAxisSpacing: 14,
                    childAspectRatio: 0.72,
                  ),
                  itemCount: delEstado.length,
                  itemBuilder: (context, indice) {
                    final platillo = delEstado[indice];
                    return TarjetaPlatillo(
                      platillo: platillo,
                      onTap: () => DetallePlatilloScreen.abrir(context, platillo),
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
