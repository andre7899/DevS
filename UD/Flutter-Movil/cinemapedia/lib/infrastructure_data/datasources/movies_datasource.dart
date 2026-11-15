import 'package:cinemapedia/config/constants/environment.dart';
import 'package:cinemapedia/domain/datasources/movies_datasource.dart';
import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:cinemapedia/infrastructure_data/mappers/movie_mapper.dart';
import 'package:cinemapedia/infrastructure_data/models/moviedb/movie_details.dart';
import 'package:cinemapedia/infrastructure_data/models/moviedb/moviedb_response.dart';
import 'package:dio/dio.dart';

class MoviesDataSourceImpl extends MovieDataSource {
  // Dio propio para este datasource
  final dio = Dio(
    BaseOptions(
      baseUrl: 'https://api.themoviedb.org/3',
      // headers: {'Authorization': 'Bearer ${Environment.theMovieDbKey}'},
      queryParameters: {
        'api_key': Environment.theMovieDbKey,
        'language': 'es-MX',
      },
    ),
  );

  List<Movie> _jsonToMovies(Map<String, dynamic> json) {
    final movieDbResponse = MovieDbResponse.fromJson(json);
    // movieDbResponse.toJson().forEach((key, value) {
    //   print('$key : $value');
    // });
    final List<Movie> movies = movieDbResponse.results
        .where((mov) => mov.posterPath != 'no-poster')
        .map(MovieMapper.movieDbToEntity)
        .toList();

    return movies;
  }

  @override
  Future<List<Movie>> getNowPlaying({int page = 1}) async {
    final response = await dio.get(
      '/movie/now_playing',
      queryParameters: {'page': page},
    );

    final List<Movie> movies = _jsonToMovies(response.data);
    return movies;
  }

  @override
  Future<List<Movie>> getPopular({int page = 1}) async {
    final response = await dio.get(
      '/movie/popular',
      queryParameters: {'page': page},
    );

    final List<Movie> movies = _jsonToMovies(response.data);
    return movies;
  }

  @override
  Future<List<Movie>> getTopRated({int page = 1}) async {
    final response = await dio.get(
      '/movie/top_rated',
      queryParameters: {'page': page},
    );
    return _jsonToMovies(response.data);
  }

  @override
  Future<List<Movie>> getUpcoming({int page = 1}) async {
    final response = await dio.get(
      '/movie/upcoming',
      queryParameters: {'page': page},
    );
    return _jsonToMovies(response.data);
  }

  @override
  Future<Movie?> getMovieById({required int movieId}) async {
    final response = await dio.get('/movie/$movieId');
    // print('getMovieById: ${response.data.toString()}');
    if (response.statusCode != 200) {
      return throw Exception('Movie with id: $movieId not found');
    }
    final movieDB = MovieDetails.fromJson(response.data);
    return MovieMapper.movieDetailsToEntity(movieDB);
  }

  @override
  Future<List<Movie>> searchMovies(String query) async {
    print('buscnado $query');
    final response = await dio.get(
      '/search/movie',
      queryParameters: {'query': query},
    );
    print(response);
    final movies = _jsonToMovies(response.data);
    print('nro peliculas: ${movies.length}');
    return movies;
  }
}
