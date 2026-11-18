import 'package:cinemapedia/presentation/providers/storage/favorites_movies_provider.dart';
import 'package:cinemapedia/presentation/screens/movies/movie_masonry.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FavoritesView extends ConsumerStatefulWidget {
  static const name = 'favorites';
  const FavoritesView({super.key});

  @override
  ConsumerState<FavoritesView> createState() => _FavoritesViewState();
}

class _FavoritesViewState extends ConsumerState<FavoritesView> {
  @override
  void initState() {
    ref.read(favoriteMovieProvider.notifier).loadNextPage();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final favoritesMovies = ref.watch(favoriteMovieProvider).values.toList();
    final colorPrimary = Theme.of(context).colorScheme.primary;

    return Scaffold(
      appBar: AppBar(title: const Text('Fvorites view')),
      body: favoritesMovies.isEmpty
          ? Center(
              child: Column(
                mainAxisAlignment: .center,
                children: [
                  Icon(Icons.favorite_border, size: 50, color: colorPrimary),
                  const Text(
                    'No tiene peliculas favoritas',
                    style: TextStyle(color: Colors.grey),
                  ),
                ],
              ),
            )
          : MovieMasonry(
              movieList: favoritesMovies,
              loadNextPage: ref
                  .read(favoriteMovieProvider.notifier)
                  .loadNextPage,
            ),
    );
  }
}
