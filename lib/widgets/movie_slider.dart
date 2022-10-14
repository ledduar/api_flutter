import 'package:api_flutter/models/models.dart';
import 'package:flutter/material.dart';

class MovieSlider extends StatelessWidget {

  final List<Verbo> verbos;
  final String titulo;

  const MovieSlider({Key key, this.verbos, this.titulo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 260,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          
          // POPULARES
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              titulo,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),

          SizedBox(height: 5),

          // MOVIE POSTER
          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: verbos.length,
              itemBuilder: (_, int index) => _MoviePoster( verbos[index] ),
            ),
          ),
        ],
      ),
    );
  }
}

class _MoviePoster extends StatelessWidget {

  final Verbo verbo;
  const _MoviePoster(this.verbo);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 130,
      height: 190,
      margin: EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: [
          // IMAGEN
          GestureDetector(
            onTap: () => Navigator.pushNamed(context, 'details',
                arguments: verbo),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: FadeInImage(
                placeholder: AssetImage('assets/no-image.jpg'),
                image: NetworkImage(verbo.getImage),
                width: 130,
                height: 160,
                fit: BoxFit.cover,
              ),
            ),
          ),

          SizedBox(height: 10),

          // TEXTO
          Text(
            verbo.titulo,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
