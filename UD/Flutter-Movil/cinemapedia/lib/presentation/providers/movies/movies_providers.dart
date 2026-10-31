import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:cinemapedia/presentation/providers/movies/movies_repository_provider.dart';
import 'package:flutter_riverpod/legacy.dart';

final nowPlayingMoviesProvider =
    StateNotifierProvider<MovieNotifier, List<Movie>>((ref) {
      final fetchMoreMovies = ref.watch(movieRepositoryProvider).getNowPlaying;

      return MovieNotifier(fetchMovieCallback: fetchMoreMovies);
    });

typedef MovieCallback = Future<List<Movie>> Function({int page});

class MovieNotifier extends StateNotifier<List<Movie>> {
  int currentPage = 0;
  MovieCallback fetchMovieCallback;

  MovieNotifier({required this.fetchMovieCallback}) : super([]);

  Future<void> loadNextPage() async {
    currentPage++;

    final List<Movie> newMovies = await fetchMovieCallback();

    state = [...state, ...newMovies];
  }
}
