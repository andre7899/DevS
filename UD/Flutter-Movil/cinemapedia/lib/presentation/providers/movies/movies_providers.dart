import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:cinemapedia/domain/repositories/movies_repository.dart';
import 'package:cinemapedia/presentation/providers/movies/movies_repository_provider.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Estado de las películas en cartelera. No hay caso de uso: fetchMovieCallback
// apunta directamente a un método del repositorio.
// nowPlayingMoviesProvider equivale a BlocProvider y MovieNotifier a un Cubit.
final nowPlayingMoviesProvider = NotifierProvider<MovieNotifier, List<Movie>>(
  () {
    return MovieNotifier(
      movieFetcher: (repository) => repository.getNowPlaying,
    );
  },
);

final popularMoviesProvider = NotifierProvider<MovieNotifier, List<Movie>>(() {
  return MovieNotifier(movieFetcher: (repository) => repository.getPopular);
});
final topRatedMoviesProvider = NotifierProvider<MovieNotifier, List<Movie>>(() {
  return MovieNotifier(movieFetcher: (repository) => repository.getTopRated);
});
final upcomingMoviesProvider = NotifierProvider<MovieNotifier, List<Movie>>(() {
  // esto es como un caso de uso, pero no se crea una clase para ello, se apunta directamente al método del repositorio.

  return MovieNotifier(movieFetcher: (repository) => repository.getUpcoming);
});

typedef MovieCallback = Future<List<Movie>> Function({int page});
typedef MovieFetcher = MovieCallback Function(MoviesRepository repository);

class MovieNotifier extends Notifier<List<Movie>> {
  int currentPage = 0;
  MovieFetcher movieFetcher;
  bool isLoading = false;

  MovieNotifier({required this.movieFetcher});

  Future<void> loadNextPage() async {
    if (isLoading) return;
    isLoading = true;
    currentPage++;
    print('Cargando página $currentPage');

    final fetchMovies = movieFetcher(ref.read(movieRepositoryProvider));

    final newMovies = await fetchMovies(page: currentPage);
    state = [...state, ...newMovies];
    await SchedulerBinding.instance.endOfFrame;
    isLoading = false;
  }

  @override
  List<Movie> build() {
    return [];
  }
}
