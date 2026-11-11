import 'package:cinemapedia/domain/entities/actor.dart';
import 'package:cinemapedia/infrastructure_data/models/moviedb/credits_response.dart';

class ActorMapper {
  static Actor castToActorEntity(Cast cast) {
    return Actor(
      id: cast.id,
      name: cast.name,
      profilePath: cast.profilePath != null
          ? 'https://image.tmdb.org/t/p/w500${cast.profilePath}'
          : 'https://mmpizzeria.com/wp-content/uploads/2020/05/keep-calm-i-m-not-available-34297_600x675.png',
      character: cast.character ?? '',
    );
  }
}
