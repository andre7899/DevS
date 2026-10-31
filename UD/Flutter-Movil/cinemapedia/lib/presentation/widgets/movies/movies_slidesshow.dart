import 'package:animate_do/animate_do.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:flutter/material.dart';

class MoviesSlidesShow extends StatelessWidget {
  final List<Movie> movies;
  const MoviesSlidesShow({super.key, required this.movies});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 210,
      width: double.infinity,
      child: Swiper(
        viewportFraction: .8,
        scale: .9,
        itemCount: movies.length,
        autoplay: true,
        pagination: const SwiperPagination(
          alignment: Alignment.bottomCenter,
          margin: EdgeInsets.only(top: 0),
          builder: DotSwiperPaginationBuilder(
            activeColor: Colors.indigo,
            color: Colors.grey,
            size: 7,

            activeSize: 10,
          ),
        ),
        itemBuilder: (context, index) {
          final movie = movies[index];
          return _Slide(movie: movie);
        },
      ),
    );
  }
}

class _Slide extends StatelessWidget {
  const _Slide({super.key, required this.movie});

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 30),
      child: DecoratedBox(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          boxShadow: const [
            BoxShadow(
              color: Colors.black45,
              blurRadius: 10,
              offset: Offset(0, 10),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),

          child: Image.network(
            movie.backdropPath,
            fit: BoxFit.cover,
            loadingBuilder: (context, child, loadingProgress) {
              if (loadingProgress == null) return FadeIn(child: child);
              return const Center(child: CircularProgressIndicator());
            },
          ),
        ),
      ),
    );
  }
}
