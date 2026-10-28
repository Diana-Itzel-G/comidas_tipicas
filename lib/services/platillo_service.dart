import '../models/platillo.dart';

/// Carpeta services: la logica de la app (buscar, filtrar y agrupar platillos).
/// No lee archivos ni dibuja nada: solo trabaja con listas de Platillo.
class PlatilloService {
  /// El platillo marcado como destacado (o el primero si ninguno lo esta).
  static Platillo destacado(List<Platillo> platillos) {
    return platillos.firstWhere(
      (p) => p.destacado,
      orElse: () => platillos.first,
    );
  }

  /// Categorias distintas, sin repetir.
  static List<String> categorias(List<Platillo> platillos) {
    return platillos.map((p) => p.categoria).toSet().toList();
  }

  /// Estados distintos, sin repetir.
  static List<String> estados(List<Platillo> platillos) {
    return platillos.map((p) => p.estado).toSet().toList();
  }

  /// Platillos de un estado.
  static List<Platillo> porEstado(List<Platillo> platillos, String estado) {
    return platillos.where((p) => p.estado == estado).toList();
  }

  /// Busca por nombre, estado o ingrediente, y filtra por categoria.
  static List<Platillo> buscar(
    List<Platillo> platillos, {
    String texto = '',
    String categoria = 'Todas',
  }) {
    final consulta = texto.trim().toLowerCase();
    return platillos.where((p) {
      final coincideCategoria = categoria == 'Todas' || p.categoria == categoria;
      final coincideTexto = consulta.isEmpty ||
          p.nombre.toLowerCase().contains(consulta) ||
          p.estado.toLowerCase().contains(consulta) ||
          p.ingredientes.any((i) => i.toLowerCase().contains(consulta));
      return coincideCategoria && coincideTexto;
    }).toList();
  }
}