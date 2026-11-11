import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:cinemapedia/presentation/providers/movies/movies_repository_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final movieInfoProvider =
    NotifierProvider<MovieMapNotifier, Map<String, Movie>>(
      MovieMapNotifier.new,
    );

class MovieMapNotifier extends Notifier<Map<String, Movie>> {
  @override
  Map<String, Movie> build() {
    return {};
  }

  Future<void> loadMovie(int? movieId) async {
    // print('loadMovie: $movieId');
    if (movieId == null) return;
    if (state[movieId.toString()] != null) return;

    final movie = await ref
        .read(movieRepositoryProvider)
        .getMovieById(movieId: movieId);
    // print('movie: ${movie?.toString()}');
    if (movie == null) return;
    setMovie(movie);
  }

  void setMovie(Movie movie) {
    state = {...state, movie.id.toString(): movie};
  }
}
