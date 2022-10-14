import 'package:api_flutter/models/models.dart';
import 'package:flutter/material.dart';

class VocabularioScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // PARA CAMBIAR POR UNA INSTANCIA

    final Palabra palabra =
        ModalRoute.of(context).settings.arguments as Palabra;

    return Scaffold(
        body: CustomScrollView(
      slivers: [
        _CustomAppBar(palabra),
        SliverList(
          delegate: SliverChildListDelegate([
            _PosterAndTitle(palabra),
            // _Overview(palabra),
          ]),
        )
      ],
    ));
  }
}

class _CustomAppBar extends StatelessWidget {
  final Palabra palabra;

  const _CustomAppBar(this.palabra);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: Colors.indigo,
      expandedHeight: 200,
      floating: false,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        titlePadding: EdgeInsets.all(0),
        centerTitle: true,
        title: Container(
          width: double.infinity,
          alignment: Alignment.bottomCenter,
          padding: EdgeInsets.only(bottom: 10),
          color: Colors.black54,
          child: Text(
            'Vocabulario de hoy',
            style: TextStyle(fontSize: 20),
          ),
        ),
        background: FadeInImage(
          placeholder: AssetImage('assets/loading.gif'),
          image: NetworkImage(palabra.getImage),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

class _PosterAndTitle extends StatelessWidget {
  final Palabra palabra;

  const _PosterAndTitle(this.palabra);

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;

    return Container(
      margin: EdgeInsets.only(top: 20),
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: FadeInImage(
              placeholder: AssetImage('assets/no-image.jpg'),
              image: NetworkImage(palabra.getImage),
              height: 450,
            ),
          ),
          SizedBox(width: 20),
          Padding(
            padding: EdgeInsets.only(top: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Tres palabras diarias',
                  style: textTheme.headline5,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 4),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Categoría: vocabulario',
                  style: textTheme.headline5,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 4),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.star_outline,
                  size: 15,
                  color: Colors.grey,
                ),
                SizedBox(width: 5),
                Text(
                  '5',
                  style: textTheme.caption,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
