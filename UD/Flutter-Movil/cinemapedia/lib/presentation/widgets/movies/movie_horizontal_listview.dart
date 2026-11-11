import 'package:animate_do/animate_do.dart';
import 'package:cinemapedia/config/helpers/human_formats.dart';
import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:go_router/go_router.dart';

class MovieHorizontalListView extends StatefulWidget {
  final List<Movie> movies;
  final String? title;
  final String? subtitle;
  final VoidCallback? onNextPage;

  const MovieHorizontalListView({
    super.key,
    required this.movies,
    this.title,
    this.subtitle,
    this.onNextPage,
  });

  @override
  State<MovieHorizontalListView> createState() =>
      _MovieHorizontalListViewState();
}

class _MovieHorizontalListViewState extends State<MovieHorizontalListView> {
  final scrollController = ScrollController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    scrollController.addListener(() {
      if (widget.onNextPage == null) return;
      if (scrollController.position.pixels >=
          scrollController.position.maxScrollExtent - 200) {
        widget.onNextPage!();
      }
    });
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: Column(
        children: [
          if (widget.title != null || widget.subtitle != null)
            _Title(title: widget.title, subtitle: widget.subtitle),
          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              controller: scrollController,
              physics: const BouncingScrollPhysics(),
              itemCount: widget.movies.length,
              cacheExtent: 20,
              itemBuilder: (context, index) {
                final movie = widget.movies[index];
                //necesito saber si el usuario esta scrolleando a la derecha o a la izquierda

                final isMoveToRigth =
                    scrollController.position.userScrollDirection ==
                    ScrollDirection.forward;
                // print('isMoveToRigth: $isMoveToRigth');
                return FadeInRight(
                  from: 150 * (isMoveToRigth ? -1 : 1),

                  duration: const Duration(milliseconds: 600),
                  child: _Slide(movie: movie),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class _Title extends StatelessWidget {
  final String? title;
  final String? subtitle;
  const _Title({super.key, this.title, this.subtitle});

  @override
  Widget build(BuildContext context) {
    final titleStyle = Theme.of(context).textTheme.titleLarge;
    return Container(
      margin: const .symmetric(horizontal: 10),
      padding: const .only(top: 10),
      child: Row(
        children: [
          if (title != null) Text(title!, style: titleStyle),
          const Spacer(),
          if (subtitle != null)
            FilledButton.tonal(
              onPressed: () {},
              style: const ButtonStyle(visualDensity: .compact),
              child: Text(
                subtitle!,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
        ],
      ),
    );
  }
}

class _Slide extends StatelessWidget {
  final Movie movie;

  const _Slide({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const .symmetric(horizontal: 8),
      child: SizedBox(
        width: 150,
        child: Column(
          spacing: 5,
          children: [
            // ClipRRect para redondear las esquinas de la imagen
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.network(
                movie.posterPath,
                width: 150,
                height: 180,
                fit: BoxFit.cover,
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress == null) {
                    return GestureDetector(
                      onTap: () {
                        // print('Movie ID: ${movie.id}');
                        final route = '/movie/${movie.id}';
                        context.push(route);
                      },
                      child: FadeIn(child: child),
                    );
                  }
                  return const Center(
                    heightFactor: 2,
                    child: CircularProgressIndicator(),
                  );
                },
              ),
            ),
            //Titulo
            Text(
              movie.title,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
            ),
            //* RAting
            Row(
              mainAxisAlignment: .center,
              spacing: 3,
              children: [
                const Icon(
                  Icons.star_half_outlined,
                  size: 15,
                  color: Colors.amber,
                ),
                Text(
                  '${movie.voteAverage}',
                  style: const TextStyle(fontSize: 12, color: Colors.amber),
                ),
                const SizedBox(width: 5),
                const Spacer(),
                Text(
                  // '${movie.popularity}',
                  HumanFormats.number(movie.popularity),
                  style: const TextStyle(fontSize: 12, color: Colors.black),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
