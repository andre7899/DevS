import 'package:cinemapedia/domain/datasources/movies_datasource.dart';
import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:cinemapedia/domain/repositories/movies_repository.dart';

class MoviesRepositoryImpl extends MoviesRepository {
  final MovieDataSource movieDataSource;

  MoviesRepositoryImpl(this.movieDataSource);

  @override
  Future<List<Movie>> getNowPlaying({int page = 1}) {
    return movieDataSource.getNowPlaying(page: page);
  }

  @override
  Future<List<Movie>> getPopular({int page = 1}) {
    return movieDataSource.getPopular(page: page);
  }

  @override
  Future<List<Movie>> getTopRated({int page = 1}) {
    return movieDataSource.getTopRated(page: page);
  }

  @override
  Future<List<Movie>> getUpcoming({int page = 1}) {
    return movieDataSource.getUpcoming(page: page);
  }

  @override
  Future<Movie?> getMovieById({required int movieId}) {
    return movieDataSource.getMovieById(movieId: movieId);
  }
}
