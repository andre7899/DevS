import 'dart:async';

import 'package:animate_do/animate_do.dart';
import 'package:cinemapedia/config/helpers/human_formats.dart';
import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:flutter/material.dart';

typedef SearchMoviesCallback = Future<List<Movie>> Function(String query);

class SearchMovieDelegate extends SearchDelegate<Movie?> {
  final SearchMoviesCallback searchMovies;
  List<Movie> initialMovies;

  final debounceController = StreamController<List<Movie>>.broadcast();
  final isLoadingController = StreamController<bool>.broadcast();
  Timer? _debounceTimer;

  SearchMovieDelegate({
    required this.searchMovies,
    this.initialMovies = const [],
  });

  @override
  void close(BuildContext context, Movie? result) {
    _debounceTimer?.cancel();
    debounceController.close();
    super.close(context, result);
  }

  void _onQueryChanged() {
    if (_debounceTimer?.isActive ?? false) _debounceTimer?.cancel();
    isLoadingController.add(true);

    _debounceTimer = Timer(Durations.long2, () async {
      // if (query.isEmpty) {
      //   debounceController.add([]);
      // }
      final list = await searchMovies(query);
      initialMovies = list;
      debounceController.sink.add(list);
      isLoadingController.add(false);
    });
  }

  Widget buildResultsAndSuggestions() {
    return StreamBuilder<List<Movie>>(
      stream: debounceController.stream,
      initialData: initialMovies,
      builder: (context, asyncSnapshot) {
        final movies = asyncSnapshot.data ?? [];
        return ListView.builder(
          itemCount: movies.length,
          itemBuilder: (context, index) {
            final movie = movies[index];

            return _MovieItem(
              movie: movie,
              onMovieSelected: () {
                close(context, movie);
              },
            );
          },
        );
      },
    );
  }

  @override
  String? get searchFieldLabel => 'Buscar pelicula :D';

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      StreamBuilder(
        stream: isLoadingController.stream,
        builder: (context, snapshot) {
          if (!snapshot.hasData) return const SizedBox.shrink();
          final isLoading = snapshot.data as bool;
          return isLoading
              ? SpinPerfect(
                  duration: const Duration(seconds: 20),
                  spins: 10,
                  infinite: true,
                  animate: query.isNotEmpty,
                  child: IconButton(
                    onPressed: () => query = '',
                    icon: const Icon(Icons.refresh_rounded),
                  ),
                )
              : FadeIn(
                  animate: query.isNotEmpty,
                  child: IconButton(
                    onPressed: () => query = '',
                    icon: const Icon(Icons.clear),
                  ),
                );
        },
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        close(context, null);
      },
      icon: const Icon(Icons.arrow_back),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return buildResultsAndSuggestions();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    _onQueryChanged();
    return buildResultsAndSuggestions();
  }
}

class _MovieItem extends StatelessWidget {
  final Movie movie;
  final VoidCallback onMovieSelected;
  const _MovieItem({required this.movie, required this.onMovieSelected});

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme;
    final size = MediaQuery.of(context).size;

    return GestureDetector(
      onTap: () {
        onMovieSelected();
      },
      child: Padding(
        padding: const .symmetric(horizontal: 8, vertical: 5),
        child: Row(
          spacing: 10,
          children: [
            SizedBox(
              width: size.width * .2,
              child: Image.network(
                movie.posterPath,
                errorBuilder: (context, error, stackTrace) =>
                    const Icon(Icons.error, color: Colors.red),
              ),
            ),
            SizedBox(
              width: size.width * .7,
              child: Column(
                crossAxisAlignment: .start,
                children: [
                  Text(movie.title, style: textStyle.titleMedium),
                  (movie.overview.length > 100)
                      ? Text('${movie.overview.substring(0, 100)}...')
                      : Text(movie.overview),
                  Row(
                    children: [
                      Icon(
                        Icons.star_half_rounded,
                        color: Colors.yellow.shade800,
                      ),
                      Text(
                        HumanFormats.number(movie.voteAverage),
                        style: textStyle.bodyMedium!.copyWith(
                          color: Colors.yellow.shade900,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
