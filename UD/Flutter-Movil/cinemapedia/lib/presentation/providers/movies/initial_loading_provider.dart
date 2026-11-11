import 'package:cinemapedia/presentation/providers/movies/movies_providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final initialLoadingProvider = Provider<bool>((ref) {
  final step1 = ref.watch(nowPlayingMoviesProvider).isEmpty;
  final step2 = ref.watch(popularMoviesProvider).isEmpty;
  final step3 = ref.watch(topRatedMoviesProvider).isEmpty;
  final step4 = ref.watch(upcomingMoviesProvider).isEmpty;
  print('step1: $step1, step2: $step2, step3: $step3, step4: $step4');
  return step1 || step2 || step3 || step4;
});
