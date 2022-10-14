import 'dart:convert';
import 'palabra.dart';

class PalabrasResponse {
    PalabrasResponse({
        this.palabras,
    });

    List<Palabra> palabras;

    factory PalabrasResponse.fromJson(String str) => PalabrasResponse.fromMap(json.decode(str));

    factory PalabrasResponse.fromMap(Map<String, dynamic> json) => PalabrasResponse(
        palabras: List<Palabra>.from(json["palabras"].map((x) => Palabra.fromMap(x))),
    );

}
