import 'package:cinemapedia/presentation/providers/providers.dart';
import 'package:cinemapedia/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// ConsumerStatefulWidget para que sea stateful y reemplaza los state por consumerstate para usar riverpod
class HomeScreen extends ConsumerStatefulWidget {
  static const name = 'home_screen';

  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  @override
  void initState() {
    super.initState();
    ref.read(nowPlayingMoviesProvider.notifier).loadNextPage();
  }

  @override
  Widget build(BuildContext context) {
    final nowPlayingMovies = ref.watch(nowPlayingMoviesProvider);
    return Scaffold(
      body: Column(
        children: [
          const CustomAppbar(),
          MoviesSlidesShow(movies: nowPlayingMovies),
        ],
      ),
    );
  }
}
