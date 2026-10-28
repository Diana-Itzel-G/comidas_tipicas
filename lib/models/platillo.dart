class Platillo {
  final int id;
  final String nombre;
  final String estado;
  final String region;
  final String categoria;
  final String imagen;
  final String descripcion;
  final String tiempo;
  final bool destacado;
  final List<String> ingredientes;
  final List<String> pasos;

  Platillo({
    required this.id,
    required this.nombre,
    required this.estado,
    required this.region,
    required this.categoria,
    required this.imagen,
    required this.descripcion,
    required this.tiempo,
    required this.destacado,
    required this.ingredientes,
    required this.pasos,
  });

  // Constructor factory: transforma el diccionario JSON en un objeto Dart
  factory Platillo.fromJson(Map<String, dynamic> json) {
    return Platillo(
      id: json['id'] as int,
      nombre: json['nombre'] as String,
      estado: json['estado'] as String,
      region: json['region'] as String,
      categoria: json['categoria'] as String,
      imagen: json['imagen'] as String,
      descripcion: json['descripcion'] as String,
      tiempo: json['tiempo'] as String,
      destacado: json['destacado'] as bool? ?? false,
      // Casteo seguro de listas dinamicas a listas de Strings
      ingredientes: List<String>.from(json['ingredientes'] as List),
      pasos: List<String>.from(json['pasos'] as List),
    );
  }
}