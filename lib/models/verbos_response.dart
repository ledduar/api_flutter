
import 'dart:convert';
import 'package:api_flutter/models/models.dart';

class VerbosResponse {
    VerbosResponse({
        this.categoria,
        this.lecciones,
    });

    List<Categoria> categoria;
    List<Verbo> lecciones;

    factory VerbosResponse.fromJson(String str) => VerbosResponse.fromMap(json.decode(str));

    factory VerbosResponse.fromMap(Map<String, dynamic> json) => VerbosResponse(
        categoria: List<Categoria>.from(json["categoria"].map((x) => Categoria.fromMap(x))),
        lecciones: List<Verbo>.from(json["lecciones"].map((x) => Verbo.fromMap(x))),
    );

}

class Categoria {
    Categoria({
        this.id,
        this.slug,
        this.titulo,
        this.descripcion,
        this.catcontenido,
        this.nivel,
        this.icono,
    });

    int id;
    String slug;
    String titulo;
    String descripcion;
    dynamic catcontenido;
    String nivel;
    String icono;

    factory Categoria.fromJson(String str) => Categoria.fromMap(json.decode(str));

    factory Categoria.fromMap(Map<String, dynamic> json) => Categoria(
        id: json["id"],
        slug: json["slug"],
        titulo: json["titulo"],
        descripcion: json["descripcion"],
        catcontenido: json["catcontenido"],
        nivel: json["nivel"],
        icono: json["icono"],
    );
}