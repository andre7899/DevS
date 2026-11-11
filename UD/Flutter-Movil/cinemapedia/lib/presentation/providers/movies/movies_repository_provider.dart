import 'package:cinemapedia/domain/repositories/movies_repository.dart';
import 'package:cinemapedia/infrastructure_data/datasources/movies_datasource.dart';
import 'package:cinemapedia/infrastructure_data/repositories/movie_repository_impl.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Provider de solo lectura: crea y expone el repositorio, no es un caso de uso.
// Equivale a RepositoryProvider en Bloc/Cubit.
final movieRepositoryProvider = Provider<MoviesRepository>((ref) {
  return MoviesRepositoryImpl(MoviesDataSourceImpl());
});
