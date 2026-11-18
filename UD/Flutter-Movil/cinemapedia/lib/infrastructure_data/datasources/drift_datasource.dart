import 'package:cinemapedia/config/database/database.dart';
import 'package:cinemapedia/domain/datasources/local_storage_datasource.dart';
import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:drift/drift.dart' as drift;

class DriftDatasource extends LocalStorageDatasource {
  final AppDatabase database;

  DriftDatasource([AppDatabase? databaseToUse])
    : database = databaseToUse ?? db;

  @override
  Future<bool> isFavoriteMovie(int movieId) async {
    //constuir el query
    final query = database.select(database.favoritesMovies)
      ..where((tbl) => tbl.movieId.equals(movieId));

    //ejecutar el query
    final favoriteMovie = await query.getSingleOrNull();

    //retornar el resultado
    return favoriteMovie != null;
  }

  @override
  Future<List<Movie>> loadFavoriteMovies({
    int limit = 10,
    int offset = 0,
  }) async {
    final query = database.select(database.favoritesMovies)
      ..limit(limit, offset: offset);

    final list = await query.get();
    final movies = list.map(
      (e) => Movie(
        adult: false,
        backdropPath: e.backdropPath,
        genreIds: [],
        id: e.movieId,
        originalLanguage: '',
        originalTitle: e.originalTitle,
        overview: '',
        popularity: 0,
        posterPath: e.posterPath,
        releaseDate: DateTime.now(),
        title: e.title,
        video: false,
        voteAverage: e.voteAverage,
        voteCount: 0,
      ),
    );
    return movies.toList();
  }

  @override
  Future<void> toggleFavoriteMovie(Movie movie) async {
    final isFavorite = await isFavoriteMovie(movie.id);
    if (isFavorite) {
      final deleteQuery = database.delete(database.favoritesMovies)
        ..where((tbl) => tbl.movieId.equals(movie.id));
      await deleteQuery.go();
      return;
    }

    await database
        .into(database.favoritesMovies)
        .insert(
          FavoritesMoviesCompanion.insert(
            movieId: movie.id,
            backdropPath: movie.backdropPath,
            originalTitle: movie.originalTitle,
            posterPath: movie.posterPath,
            title: movie.title,
            voteAverage: drift.Value(movie.voteAverage),
          ),
        );
  }
}
