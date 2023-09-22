class Consultor {
  final String codpais;
  final String codebelista;
  final String desnombre;
  final String desapepaterno;
  final String docidentidad;
  final String tipodocidentidad;
  final String desestadocivil;
  final String desdireccion;
  final String aniocampanaingreso;
  final String? fechanacimiento;
  final String fecharegistro;

  Consultor({
    required this.codpais,
    required this.codebelista,
    required this.desnombre,
    required this.desapepaterno,
    required this.docidentidad,
    required this.tipodocidentidad,
    required this.desestadocivil,
    required this.desdireccion,
    required this.aniocampanaingreso,
     required this.fechanacimiento,
    required this.fecharegistro
  });

  factory Consultor.fromJson(Map<String, dynamic> json) {
    return Consultor(
        codpais: json['codpais'],
        codebelista: json['codebelista'],
        desnombre: json['desnombre'],
        desapepaterno: json['desapepaterno'],
        docidentidad: json['docidentidad'],
        tipodocidentidad: json['tipodocidentidad'],
        desestadocivil: json['desestadocivil'],
        desdireccion: json['desdireccion'],
        aniocampanaingreso: json['aniocampanaingreso'],
        fechanacimiento: json['fechanacimiento'],
        fecharegistro: json['fecharegistro']
    );
  }
}