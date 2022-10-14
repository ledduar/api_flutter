import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:api_flutter/models/models.dart';

class CardSwiper extends StatelessWidget {
  final List<Palabra> palabras;

  const CardSwiper({Key key, this.palabras}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      width: double.infinity,
      height: size.height * 0.45,
      child: Swiper(
          itemCount: palabras.length,
          layout: SwiperLayout.STACK,
          itemWidth: size.width * 0.6,
          itemHeight: size.height * 0.4,
          itemBuilder: (_, int index) {

            final palabra = palabras[index];

            return GestureDetector(
              onTap: () => Navigator.pushNamed(context, 'vocabulario',
                  arguments: palabra),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: FadeInImage(
                  placeholder: AssetImage('assets/no-image.jpg'),
                  image: NetworkImage(palabra.getImage),
                  fit: BoxFit.cover,
                ),
              ),
            );
          }),
    );
  }
}
