import 'package:flutter/material.dart';
import '../data/platillo_data.dart';
import '../models/platillo.dart';
import '../services/platillo_service.dart';
import '../tema.dart';
import '../widgets/boton_principal.dart';
import '../widgets/chip_categoria.dart';
import '../widgets/encabezado_seccion.dart';
import '../widgets/estado_vacio.dart';
import '../widgets/etiqueta_origen.dart';
import '../widgets/imagen_platillo.dart';
import '../widgets/tarjeta_platillo.dart';
import 'catalogo_screen.dart';
import 'detalle_platillo_screen.dart';
import 'regiones_screen.dart';

/// Pantalla 1: inicio con platillo destacado, categorias y seleccion.
class InicioScreen extends StatefulWidget {
  const InicioScreen({super.key});

  @override
  State<InicioScreen> createState() => _InicioScreenState();
}

class _InicioScreenState extends State<InicioScreen> {
  // El Future se crea una sola vez para no leer el JSON en cada rebuild
  late final Future<List<Platillo>> _futuro;

  @override
  void initState() {
    super.initState();
    _futuro = PlatilloData.cargar();
  }

  void _irA(Widget pantalla) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => pantalla));
  }

  // Banner grande con el platillo destacado
  Widget _banner(Platillo platillo) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 8, 20, 0),
      child: GestureDetector(
        onTap: () => DetallePlatilloScreen.abrir(context, platillo),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(22),
          child: SizedBox(
            height: 210,
            child: Stack(
              fit: StackFit.expand,
              children: [
                ImagenPlatillo(url: platillo.imagen, radio: 0),
                const DecoratedBox(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [Color(0x00000000), Color(0xDD3B2F2A)],
                      stops: [0.4, 1],
                    ),
                  ),
                ),
                Positioned(
                  left: 16,
                  right: 16,
                  bottom: 16,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Text(
                        'PLATILLO DESTACADO',
                        style: TextStyle(
                          color: Colores.mostaza,
                          fontSize: 11,
                          letterSpacing: 1.4,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        platillo.nombre,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const SizedBox(height: 4),
                      EtiquetaOrigen(origen: platillo.estado),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(