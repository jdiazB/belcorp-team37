import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:untitled9_belcorp/models/pais.dart';
class Apiservice{
  String token ='eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MTA2OSwidXNyIjoiaGFja2F0b24iLCJpYXQiOjE2OTUzNDc2NjAsImV4cCI6MTY5NTQzNDA2MH0.FVua_u_kQVCGx6yGL4-EjrvoL3cuv16MRP0GBdOdvt8';

  Future<List> obtenerPaises() async {
  Uri url = Uri.parse('https://api-qa.belcorp.biz/countries');
  final response = await http.get(
    url,
    headers: <String, String>{
      'Content-Type': 'application/x-www-form-urlencoded',
      'x-access-token': token,
    },
  );

  if (response.statusCode == 200) {
    List<dynamic> lista = jsonDecode(response.body);
    print(lista.toList().toString());
    return lista.map((mapa) => mapa['country_code']).toList();

  } else {
    throw Exception('Error al obtener los países.');
  }
}
  void apiCatalogos() async {

    final inicialesPaises = await obtenerPaises();

    for (var inicial in inicialesPaises) {
      Uri url1=Uri.parse('https://api-qa.belcorp.biz/catalogs/$inicial');
      final response = await http.get(
        url1,
        headers: <String, String>{
          'Content-Type': 'application/x-www-form-urlencoded',
          'x-access-token': token,
        },
      );

      if (response.statusCode == 200) {
        // print('Datos obtenidos con éxito para el país $inicial!');

        // Decodifica la respuesta JSON
        Map<String, dynamic> datos = jsonDecode(response.body);

        // Accede a la clave 'resultados'
        List<dynamic> resultados = datos["results"];

        // Itera sobre cada resultado
        for (var resultado in resultados) {
          // Accede a la clave 'cover image'
          String coverImage = resultado["cover_image"];

          print('Cover Image: $coverImage');
      } }else {
        print('Error al obtener los datos ');
      }
    }
  }

}

