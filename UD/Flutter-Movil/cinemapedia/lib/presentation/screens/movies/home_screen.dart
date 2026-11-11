import 'package:cinemapedia/presentation/providers/movies/initial_loading_provider.dart';
import 'package:cinemapedia/presentation/providers/movies/movies_slideshow_provider.dart';
import 'package:cinemapedia/presentation/providers/providers.dart';
import 'package:cinemapedia/presentation/widgets/shared/full_screen_loader.dart';
import 'package:cinemapedia/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// ConsumerStatefulWidget es un StatefulWidget con acceso a ref para usar Riverpod.
// ConsumerState reemplaza a State y permite usar ref también en initState.
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
    ref.read(popularMoviesProvider.notifier).loadNextPage();
    ref.read(topRatedMoviesProvider.notifier).loadNextPage();
    ref.read(upcomingMoviesProvider.notifier).loadNextPage();
  }

  @override
  Widget build(BuildContext context) {
    final initialLoading = ref.watch(initialLoadingProvider);
    if (initialLoading) return const FullScreenLoader();

    final nowPlayingMovies = ref.watch(nowPlayingMoviesProvider);
    final nowPopularMovies = ref.watch(popularMoviesProvider);
    final nowTopRatedMovies = ref.watch(topRatedMoviesProvider);
    final nowUpcomingMovies = ref.watch(upcomingMoviesProvider);

    final slidesShowMovies = ref.watch(moviesSlideshowProvider);
    return CustomScrollView(
      slivers: [
        const SliverAppBar(
          floating: true,
          automaticallyImplyLeading: false,
          flexibleSpace: FlexibleSpaceBar(
            // titlePadding: EdgeInsets.symmetric(horizontal: 20),
            // centerTitle: true,
            title: CustomAppbar(),
          ),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate((context, index) {
            return Column(
              children: [
                MoviesSlidesShow(movies: slidesShowMovies),
                MovieHorizontalListView(
                  movies: nowPlayingMovies,
                  title: 'En cines',
                  subtitle: 'Lunes 20',
                  onNextPage: () {
                    ref.read(nowPlayingMoviesProvider.notifier).loadNextPage();
                  },
                ),
                MovieHorizontalListView(
                  movies: nowUpcomingMovies,
                  title: 'Proximamente',
                  subtitle: 'En este mes',
                  onNextPage: () {
                    ref.read(upcomingMoviesProvider.notifier).loadNextPage();
                  },
                ),
                MovieHorizontalListView(
                  movies: nowPopularMovies,
                  title: 'Populares',
                  // subtitle: 'En este mes',
                  onNextPage: () {
                    ref.read(popularMoviesProvider.notifier).loadNextPage();
                  },
                ),
                MovieHorizontalListView(
                  movies: nowTopRatedMovies,
                  title: 'Mejores Calificadas',
                  subtitle: 'Desde siempre',
                  onNextPage: () {
                    ref.read(topRatedMoviesProvider.notifier).loadNextPage();
                  },
                ),
              ],
            );
          }),
        ),
      ],
    );
  }
}
