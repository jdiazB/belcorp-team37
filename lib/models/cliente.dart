class Cliente {
  final String cod_cliente;
  final String cod_pais;
  final String fec_creacion;
  final String des_nombre_cliente;
  final String des_email;
  final String fec_modificacion;
  final String des_direccion;

  Cliente({
    required this.cod_cliente,
    required this.cod_pais,
    required this.fec_creacion,
    required this.des_nombre_cliente,
    required this.des_email,
    required this.fec_modificacion,
    required this.des_direccion,
  });

  factory Cliente.fromJson(Map<String, dynamic> json) {
    return Cliente(
      cod_cliente: json['cod_cliente'],
      cod_pais: json['cod_pais'],
      fec_creacion: json['fec_creacion'],
      des_nombre_cliente: json['des_nombre_cliente'],
      des_email: json['des_email'],
      fec_modificacion: json['fec_modificacion'],
      des_direccion: json['des_direccion'],
    );
  }
}