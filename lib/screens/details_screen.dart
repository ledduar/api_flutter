import 'package:api_flutter/models/models.dart';
import 'package:flutter/material.dart';

class DetailsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // PARA CAMBIAR POR UNA INSTANCIA

    final Verbo verbo = ModalRoute.of(context).settings.arguments as Verbo;
    
    return Scaffold(
        body: CustomScrollView(
      slivers: [
        _CustomAppBar(verbo),
        SliverList(
          delegate: SliverChildListDelegate([
            _PosterAndTitle(verbo),
            _Overview(verbo),
          ]),
        )
      ],
    ));
  }
}

class _CustomAppBar extends StatelessWidget {

  final Verbo verbo;

  const _CustomAppBar(this.verbo);

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
            verbo.titulo,
            style: TextStyle(fontSize: 18),
          ),
        ),
        background: FadeInImage(
          placeholder: AssetImage('assets/loading.gif'),
          image: NetworkImage(verbo.getImage),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

class _PosterAndTitle extends StatelessWidget {

  final Verbo verbo;

  const _PosterAndTitle(this.verbo);

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;

    return Container(
      margin: EdgeInsets.only(top: 20),
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: FadeInImage(
              placeholder: AssetImage('assets/no-image.jpg'),
              image: NetworkImage(verbo.getImage),
              height: 150,
            ),
          ),
          SizedBox(width: 20),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                verbo.titulo,
                style: textTheme.headline5,
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
              ),
              Text(
                'Categoría: ${verbo.slugCat}',
                style: textTheme.headline5,
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
              ),
              Row(
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
              )
            ],
          ),
        ],
      ),
    );
  }
}

class _Overview extends StatelessWidget {

  final Verbo verbo;

  const _Overview(this.verbo);

  @override
  Widget build(BuildContext context) {

    final TextTheme textTheme = Theme.of(context).textTheme;
    
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 30, vertical: 50),
      child: Text(
        verbo.descripcion,
        textAlign: TextAlign.justify,
        style: textTheme.subtitle1,     
      ),
    );
  }
}
