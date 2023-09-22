import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:untitled9_belcorp/models/cliente.dart';
import 'package:untitled9_belcorp/models/consultor.dart';
import 'package:untitled9_belcorp/models/product.dart';


class ApiJson{
  Future<List<T>> obtenerDatos<T>(String url, T Function(Map<String, dynamic>) constructor) async {
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      List<dynamic> lista = jsonDecode(response.body);
      return lista.map((json) => constructor(json)).toList();
    } else {
      throw Exception('Error al obtener los datos.');
    }
  }

  void JsonServiceBelcorp() async {
    final productos = await obtenerDatos<Producto>('https://belc-hackathon2023.s3.amazonaws.com/products.json', (json) => Producto.fromJson(json));
    final clientes = await obtenerDatos<Cliente>('https://belc-hackathon2023.s3.amazonaws.com/clients.json', (json) => Cliente.fromJson(json));
    final consultores = await obtenerDatos<Consultor>('https://belc-hackathon2023.s3.amazonaws.com/consultants.json', (json) => Consultor.fromJson(json));

    print('Productos: $productos');
    print('Clientes: $clientes');
    print('Consultores: $consultores');
  }




}