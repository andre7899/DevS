import 'package:animate_do/animate_do.dart';
import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:cinemapedia/presentation/providers/actors/actors_by_movie_provider.dart';
import 'package:cinemapedia/presentation/providers/movies/movie_info_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MovieScreen extends ConsumerStatefulWidget {
  static const name = 'movie_screen';
  final String movieId;
  const MovieScreen({super.key, required this.movieId});

  @override
  ConsumerState<MovieScreen> createState() => _MovieScreenState();
}

class _MovieScreenState extends ConsumerState<MovieScreen> {
  @override
  void initState() {
    ref
        .read(movieInfoProvider.notifier)
        .loadMovie(int.tryParse(widget.movieId));
    ref
        .read(actorsByMovieProvider.notifier)
        .loadActors(int.tryParse(widget.movieId));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final movie = ref.watch(movieInfoProvider)[widget.movieId];
    final isLoading = movie == null;
    if (isLoading) {
      return const Scaffold(
        body: Center(child: CircularProgressIndicator(strokeWidth: 2)),
      );
    }
    return Scaffold(
      body: CustomScrollView(
        physics: const ClampingScrollPhysics(),
        slivers: [
          _CustomSliverAppbar(movie: movie),
          SliverToBoxAdapter(child: _MovieDetailsWidget(movie: movie)),
          SliverToBoxAdapter(child: _ActorsWidget(movieId: widget.movieId)),
        ],
      ),
    );
  }
}

class _ActorsWidget extends ConsumerWidget {
  final String movieId;
  const _ActorsWidget({super.key, required this.movieId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final actorsByMovie = ref.watch(actorsByMovieProvider)[movieId];
    if (actorsByMovie == null) {
      return const Center(child: CircularProgressIndicator(strokeWidth: 2));
    }
    return SizedBox(
      height: 300,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Text('Actores', style: TextStyle(fontSize: 20)),
          ),
          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: actorsByMovie.length,
              itemBuilder: (context, index) {
                final actor = actorsByMovie[index];
                return Container(
                  padding: const EdgeInsets.all(10),
                  width: 135,
                  child: Column(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.network(
                          actor.profilePath,
                          width: 135,
                          height: 180,
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        actor.name,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.center,
                      ),
                      Text(
                        actor.character,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class _MovieDetailsWidget extends StatelessWidget {
  final Movie? movie;
  const _MovieDetailsWidget({this.movie});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    final textStyles = Theme.of(context).textTheme;
    return Column(
      crossAxisAlignment: .start,
      children: [
        Padding(
          padding: const .all(10),
          child: Row(
            crossAxisAlignment: .start,
            spacing: 10,
            children: [
              //imagen
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.network(
                  movie?.posterPath ?? '',
                  width: size.width * 0.3,
                  fit: BoxFit.cover,
                  loadingBuilder: (context, child, loadingProgress) {
                    if (loadingProgress == null) return FadeIn(child: child);
                    return const Center(
                      child: CircularProgressIndicator(strokeWidth: 2),
                    );
                  },
                ),
              ),

              //descripcion
              Expanded(
                // width: (size.width - 40) * 0.7,
                child: Column(
                  crossAxisAlignment: .start,
                  children: [
                    //Titulo
                    Text(movie?.title ?? '-', style: textStyles.titleLarge),
                    Text(movie?.overview ?? '-', style: textStyles.bodyMedium),
                  ],
                ),
              ),

              // if (movie?.voteAverage != null)
              //   Container(
              //     padding: const EdgeInsets.all(5),
              //     decoration: BoxDecoration(
              //       color: Colors.black45,
              //       borderRadius: BorderRadius.circular(5),
              //     ),
              //     child: Row(
              //       children: [
              //         const Icon(Icons.star_half_outlined, color: Colors.amber),
              //         const SizedBox(width: 5),
              //         Text(
              //           '${movie?.voteAverage ?? 0}',
              //           style: const TextStyle(fontSize: 16),
              //         ),
              //       ],
              //     ),
              //   ),
              // const SizedBox(width: 10),
              // Text(
              //   '${movie?.releaseDate.year ?? '-'}',
              //   style: const TextStyle(fontSize: 16),
              // ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Wrap(
            crossAxisAlignment: WrapCrossAlignment.center,
            spacing: 10,
            children: List.generate(movie?.genreIds.length ?? 0, (index) {
              final genreId = movie!.genreIds[index];
              return Chip(
                label: Text(genreId),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              );
            }),
          ),
        ),
      ],
    );
  }
}

class _CustomSliverAppbar extends StatelessWidget {
  const _CustomSliverAppbar({required this.movie});

  final Movie? movie;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return SliverAppBar(
      expandedHeight: size.height * 0.7,
      // collapsedHeight: size.height * 0.2,
      pinned: true,
      title: Text(movie?.title ?? '-'),
      backgroundColor: Colors.black,
      foregroundColor: Colors.white,
      flexibleSpace: FlexibleSpaceBar(
        // titlePadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        // title: Text(
        //   movie?.title ?? '-',
        //   textAlign: TextAlign.start,
        //   style: const TextStyle(fontSize: 20, color: Colors.white),
        // ),
        background: Stack(
          children: [
            SizedBox.expand(
              child: Image(
                image: NetworkImage(
                  movie?.posterPath ?? '',
                ), // Aquí debes usar la URL de la imagen del póster de la película
                fit: BoxFit.cover,
              ),
            ),
            SizedBox.expand(
              child: DecoratedBox(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    stops: const [0.7, 1],
                    colors: [
                      Colors.transparent,
                      Colors.black.withValues(alpha: 0.7),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
