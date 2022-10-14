import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:api_flutter/models/models.dart';

class LeccionesProvider extends ChangeNotifier {

  String _baseUrl  = 'admin.inglesxdia.com';

  List<Palabra> mostrarPalabras = [];
  List<Verbo> mostrarVerbos = [];

  LeccionesProvider() {
    print('Movies Provider inicializado');
    getPalabras();
    getVerbos();
  }

  Future<String> _getJsonData( String endpoint) async {
    var url = Uri.https(_baseUrl, 'api/$endpoint/');
    final response = await http.get(url);
    return response.body;
  }

  getVerbos() async {
    final jsonData = await _getJsonData('categoria/vb');
    final verbosResponse = VerbosResponse.fromJson(jsonData);
    mostrarVerbos = verbosResponse.lecciones;
    notifyListeners();
  }

  getPalabras() async {
    final jsonData = await _getJsonData('palabras');
    final palabrasResponse = PalabrasResponse.fromJson(jsonData);
    mostrarPalabras = palabrasResponse.palabras;
    notifyListeners();
  }
}
