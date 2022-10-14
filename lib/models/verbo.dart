
import 'dart:convert';

class Verbo {
    Verbo({
        this.id,
        this.orden,
        this.slug,
        this.titulo,
        this.descripcion,
        this.imagen,
        this.audio,
        this.idCategoria,
        this.slugCat,
    });

    int id;
    int orden;
    String slug;
    String titulo;
    String descripcion;
    String imagen;
    String audio;
    int idCategoria;
    String slugCat;

    get getImage
    {
      return 'https://admin.inglesxdia.com/imagen/${ this.imagen }';
    }

    factory Verbo.fromJson(String str) => Verbo.fromMap(json.decode(str));

    factory Verbo.fromMap(Map<String, dynamic> json) => Verbo(
        id: json["id"],
        orden: json["orden"],
        slug: json["slug"],
        titulo: json["titulo"],
        descripcion: json["descripcion"],
        imagen: json["imagen"],
        audio: json["audio"],
        idCategoria: json["id_categoria"],
        slugCat: json["slug_cat"],
    );
}
