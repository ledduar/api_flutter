import 'package:flutter/material.dart';
import 'package:api_flutter/providers/lecciones_providers.dart';
import 'package:api_flutter/widgets/widgets.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final leccionesProvider = Provider.of<LeccionesProvider>(context);

    return Scaffold(
        appBar: AppBar(
          title: Text('INGLESXDIA'),
          elevation: 0,
          actions: [
            IconButton(icon: Icon(Icons.search_outlined), onPressed: () {})
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Column(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    child: Text(
                      'Vocabulario del mes',
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                    ),
                  ),

                  // Tarjetas principales
                  CardSwiper(palabras: leccionesProvider.mostrarPalabras),

                  MovieSlider(
                      titulo: 'Verbos en inglés',
                      verbos: leccionesProvider.mostrarVerbos),
                ],
              )
            ],
          ),
        ));
  }
}
