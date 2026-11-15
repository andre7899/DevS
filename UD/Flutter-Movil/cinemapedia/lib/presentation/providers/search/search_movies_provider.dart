import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:cinemapedia/presentation/providers/providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Texto de la última búsqueda.
final searchQueryProvider = NotifierProvider<SearchQueryNotifier, String>(
  SearchQueryNotifier.new,
);

class SearchQueryNotifier extends Notifier<String> {
  @override
  String build() => '';

  void setQuery(String query) => state = query;
}

// Resultados de la última búsqueda. Al buscar también actualiza searchQueryProvider.
final searchedMoviesProvider =
    NotifierProvider<SearchedMoviesNotifier, List<Movie>>(
      SearchedMoviesNotifier.new,
    );

class SearchedMoviesNotifier extends Notifier<List<Movie>> {
  @override
  List<Movie> build() => [];

  Future<List<Movie>> searchMoviesByQuery(String query) async {
    ref.read(searchQueryProvider.notifier).setQuery(query);

    if (query.isEmpty) {
      state = [];
      return [];
    }

    final movies = await ref.read(movieRepositoryProvider).searchMovies(query);

    // Si mientras tanto el usuario escribió otra cosa, descartar estos resultados viejos
    if (ref.read(searchQueryProvider) != query) return state;

    state = movies;
    return movies;
  }
}
