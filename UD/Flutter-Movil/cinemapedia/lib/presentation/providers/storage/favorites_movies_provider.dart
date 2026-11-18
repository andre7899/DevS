import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:cinemapedia/presentation/providers/storage/is_favorite_movie_provider.dart';
import 'package:cinemapedia/presentation/providers/storage/local_storage_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final favoriteMovieProvider =
    NotifierProvider<StorageMoviesNotifier, Map<int, Movie>>(
      StorageMoviesNotifier.new,
    );

class StorageMoviesNotifier extends Notifier<Map<int, Movie>> {
  int page = 0;
  @override
  Map<int, Movie> build() {
    return {};
  }

  Future<List<Movie>> loadNextPage() async {
    final movies = await ref
        .read(localStorageRepositoryProvider)
        .loadFavoriteMovies(limit: 10, offset: page * 10);
    page++;
    state = {...state, for (final movie in movies) movie.id: movie};
    return movies;
  }

  Future<void> toggleFavoriteMovie(Movie movie) async {
    final localRepositoryProvider = ref.read(localStorageRepositoryProvider);
    final isFavorite = await localRepositoryProvider.isFavoriteMovie(movie.id);
    await localRepositoryProvider.toggleFavoriteMovie(movie);
    ref.invalidate(isFavoriteMovieProvider);
    if (isFavorite) {
      state.remove(movie.id);
      state = {...state};
      return;
    }

    state = {...state, movie.id: movie};
  }
}
