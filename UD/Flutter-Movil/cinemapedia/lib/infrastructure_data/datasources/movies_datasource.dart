import 'package:cinemapedia/config/constants/environment.dart';
import 'package:cinemapedia/domain/datasources/movies_datasources.dart';
import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:cinemapedia/infrastructure_data/mappers/movie_mapper.dart';
import 'package:cinemapedia/infrastructure_data/models/moviedb/moviedb_response.dart';
import 'package:dio/dio.dart';

class MoviesDataSourceImpl extends MovieDataSource {
  // Dio propio para este datasource
  final dio = Dio(
    BaseOptions(
      baseUrl: 'https://api.themoviedb.org/3',
      queryParameters: {
        'api_key': Environment.theMovieDbKey,
        'language': 'es-MX',
      },
    ),
  );

  @override
  Future<List<Movie>> getNowPlaying({int page = 1}) async {
    final response = await dio.get('/movie/now_playing');

    final movieDbResponse = MovieDbResponse.fromJson(response.data);

    final List<Movie> movies = movieDbResponse.results
        .where((mov) => mov.posterPath != 'no-poster')
        .map(MovieMapper.movieDbToEntity)
        .toList();

    return movies;
  }
}
