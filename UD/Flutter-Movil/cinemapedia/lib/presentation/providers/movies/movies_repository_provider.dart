import 'package:cinemapedia/infrastructure_data/datasources/movies_datasource.dart';
import 'package:cinemapedia/infrastructure_data/repositories/movie_repository_impl.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// este repositorio es inmutable, Caso de uso??
final movieRepositoryProvider = Provider((ref) {
  return MoviesRepositoryImpl(MoviesDataSourceImpl());
});
