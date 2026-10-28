import 'package:flutter/material.dart';
import '../models/platillo.dart';
import 'catalogo_screen.dart';
import 'detalle_platillo_screen.dart';
import 'regiones_screen.dart';

class InicioScreen extends StatefulWidget {
  const InicioScreen({super.key});

  @override
  State<InicioScreen> createState() => _InicioScreenState();
}

class _InicioScreenState extends State<InicioScreen> {
  // Un solo método para abrir cualquier pantalla (Navigator.push)
  void _irA(Widget pantalla) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => pantalla));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sabores de México'),
        actions: [
          // Ícono de mapa -> Regiones
          IconButton(
            tooltip: 'Regiones de México',
            icon: const Icon(Icons.map_outlined),
            onPressed: () => _irA(const RegionesScreen()),
          ),
        ],
      ),
      body: ListView(
        children: [
          // ... banner del platillo destacado (FutureBuilder + PlatilloService.destacado)
          //     al tocarlo -> Detalle:
          //     onTap: () => DetallePlatilloScreen.abrir(context, platillo),

          // Cada chip de categoría -> Catálogo ya filtrado
          // ChipCategoria(
          //   texto: categoria,
          //   onTap: () => _irA(CatalogoScreen(categoriaInicial: categoria)),
          // ),

          // Cada tarjeta del carrusel -> Detalle
          // TarjetaPlatillo(
          //   platillo: platillo,
          //   onTap: () => DetallePlatilloScreen.abrir(context, platillo),
          // ),

          // Botones de abajo
          BotonPrincipal(
            texto: 'Ver catálogo completo',
            icono: Icons.restaurant_menu_rounded,
            onPressed: () => _irA(const CatalogoScreen()),
          ),
          BotonPrincipal(
            texto: 'Explorar por regiones',
            icono: Icons.map_outlined,
            relleno: false,
            onPressed: () => _irA(const RegionesScreen()),
          ),
        ],
      ),
    );
  }
}