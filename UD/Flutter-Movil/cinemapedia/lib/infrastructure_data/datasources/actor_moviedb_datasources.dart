import 'package:cinemapedia/config/constants/environment.dart';
import 'package:cinemapedia/domain/datasources/actors_datasource.dart';
import 'package:cinemapedia/domain/entities/actor.dart';
import 'package:cinemapedia/infrastructure_data/mappers/actor_mapper.dart';
import 'package:cinemapedia/infrastructure_data/models/moviedb/credits_response.dart';
import 'package:dio/dio.dart';

class ActorMovieDbDatasourceImpl extends ActorDatasource {
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
  @override
  Future<List<Actor>> getActorsByMovie(String movieId) async {
    final response = await dio.get('/movie/$movieId/credits');
    final creditsResponse = CreditsResponse.fromJson(response.data);
    return creditsResponse.cast.map(ActorMapper.castToActorEntity).toList();
  }
}
