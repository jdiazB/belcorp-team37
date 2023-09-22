class Producto {
  final String codsap;
  final String desproducto;
  final String desunidadnegocio;
  final String desmarca;
  final String descategoria;
  final String desgrupoarticulo;
  final String desclase;
  final String largo;
  final String ancho;
  final String volumen;
  final String pesobruto;

  Producto({
    required this.codsap,
    required this.desproducto,
    required this.desunidadnegocio,
    required this.desmarca,
    required this.descategoria,
    required this.desgrupoarticulo,
    required this.desclase,
    required this.largo,
    required this.ancho,
    required this.volumen,
    required this.pesobruto,
  });

  factory Producto.fromJson(Map<String, dynamic> json) {
    return Producto(
      codsap: json['codsap'],
      desproducto: json['desproducto'],
      desunidadnegocio: json['desunidadnegocio'],
      desmarca: json['desmarca'],
      descategoria: json['descategoria'],
      desgrupoarticulo: json['desgrupoarticulo'],
      desclase: json['desclase'],
      largo: json['largo'],
      ancho: json['ancho'],
      volumen: json['volumen'],
      pesobruto: json['pesobruto'],
    );
  }
}