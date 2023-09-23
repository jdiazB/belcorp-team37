import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:untitled9_belcorp/models/catalogo.dart';

class Apiservice{

  String token =
      'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MTA2OSwidXNyIjoiaGFja2F0b24iLCJpYXQiOjE2OTU0MzQ3NTIsImV4cCI6MTY5NTUyMTE1Mn0.8PXakcf_2fUbli6RTgtOXNfZwyyomzBdTLTnnKG3kV4';


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
    // print(lista.toList().toString());
    return lista.map((mapa) => mapa['country_code']).toList();

  } else {
    throw Exception('Error al obtener los países.');
  }
}

 Future<List<Catalogo>> apiCatalogos() async {
   List<Catalogo> catalogos = [];
    // final inicialesPaises = await obtenerPaises();

    // for (var inicial in inicialesPaises) {
      Uri url1 = Uri.parse('https://api-qa.belcorp.biz/catalogs/BO');
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
        Map<String, dynamic> datos = json.decode(response.body);
        print(response.body);
        // List imagecatalogos = datos["results"];
        List resultados = datos["results"];
         catalogos = resultados.map((e) => Catalogo.fromJson(e)).toList();
        print(catalogos);
        return catalogos;

        // Itera sobre cada resultado
        for (var resultado in resultados) {
          // Accede a la clave 'cover image'
          String coverImage = resultado['cover_image'];


          // print(images);
          //   print('Cover Image: $coverImage');
        }

        // print(images);

        // List<Catalogos> catalogos = imagecatalogos.map((e) => Catalogos.fromJson(e)).toList();
        // print(catalogos);
        // return catalogos;
      } return catalogos;
    // }
  }

}



