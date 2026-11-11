import 'package:cinemapedia/domain/entities/actor.dart';
import 'package:cinemapedia/presentation/providers/movies/actors_repository_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final actorsByMovieProvider =
    NotifierProvider<ActorsByMovieNotifier, Map<String, List<Actor>>>(
      ActorsByMovieNotifier.new,
    );

class ActorsByMovieNotifier extends Notifier<Map<String, List<Actor>>> {
  @override
  Map<String, List<Actor>> build() {
    return {};
  }

  Future<void> loadActors(int? movieId) async {
    // print('loadMovie: $movieId');
    if (movieId == null) return;
    if (state[movieId.toString()] != null) return;

    final actorList = await ref
        .read(actorsRepositoryProvider)
        .getActorsByMovie(movieId.toString());
    // print('movie: ${movie?.toString()}');
    setActorList(actorList, movieId.toString());
  }

  void setActorList(List<Actor> actors, String movieId) {
    state = {...state, movieId: actors};
  }
}
