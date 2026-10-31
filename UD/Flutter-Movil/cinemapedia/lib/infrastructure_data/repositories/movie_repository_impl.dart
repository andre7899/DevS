import 'package:cinemapedia/domain/datasources/movies_datasources.dart';
import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:cinemapedia/domain/repositories/movies_repository.dart';

class MoviesRepositoryImpl extends MoviesRepository {
  final MovieDataSource movieDataSource;

  MoviesRepositoryImpl(this.movieDataSource);

  @override
  Future<List<Movie>> getNowPlaying({int page = 1}) {
    return movieDataSource.getNowPlaying(page: page);
  }
}
