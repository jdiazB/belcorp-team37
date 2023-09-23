import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:untitled9_belcorp/apis/apiservice.dart';
import 'package:untitled9_belcorp/models/catalogo.dart';
import 'package:http/http.dart' as http;

class FavoritePage extends StatefulWidget {
  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  Apiservice _apiservice = Apiservice();

  @override
  void initState() {
    // TODO: implement initState

    // obtenerCoverImages();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _apiservice.apiCatalogos(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.hasData) {
          List<Catalogo> listdata = snapshot.data;
          // List<Catalogo> datosOrdenados = snapshot.data..sort((a, b) {
          //   if (a.coverImage == null && b.coverImage != null) {
          //     return 1;
          //   } else if (b.coverImage == null && a.coverImage != null) {
          //     return -1;
          //   } else {
          //     return 0;
          //   }
          // });
          return GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, // ajusta esto según tus necesidades
            ),
            physics: BouncingScrollPhysics(),
            itemCount: listdata.length,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                  padding: EdgeInsets.all(15),
                  decoration: BoxDecoration(boxShadow: [
                    BoxShadow(
                        blurRadius: 1,
                        color: Colors.white70.withOpacity(0.1),
                        offset: Offset(-2, -2))
                  ]),
                  child: Image.network(
                    listdata[index].coverImage ?? '',
                    errorBuilder: (context, error, stackTrace) {
                      return Center(child: Text('Imagen no disponible'));
                    },fit: BoxFit.cover,
                  )
                  ); // reemplaza 'url_de_la_imagen' con la clave real en tus datos
            },
          );
        }
        return Center(child: CircularProgressIndicator());
      },
    );
  }
}
