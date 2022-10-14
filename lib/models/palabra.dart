import 'dart:convert';

class Palabra {
    Palabra({
        this.id,
        this.mes,
        this.imagen,
        this.audio,
    });

    int id;
    int mes;
    String imagen;
    String audio;

    get getImage
    {
      return 'https://admin.inglesxdia.com/imagen/${ this.imagen }';
    }

    factory Palabra.fromJson(String str) => Palabra.fromMap(json.decode(str));

    factory Palabra.fromMap(Map<String, dynamic> json) => Palabra(
        id: json["id"],
        mes: json["mes"],
        imagen: json["imagen"],
        audio: json["audio"],
    );
}
