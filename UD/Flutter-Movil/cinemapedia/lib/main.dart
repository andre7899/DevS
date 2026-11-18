import 'package:cinemapedia/config/router/app_router.dart';
import 'package:cinemapedia/config/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() async {
  await dotenv.load(fileName: ".env");
  WidgetsFlutterBinding.ensureInitialized();
  // await db
  //     .into(db.favoritesMovies)
  //     .insert(
  //       FavoritesMoviesCompanion.insert(
  //         movieId: 1,
  //         backdropPath: 'backdropPath.png',
  //         originalTitle: 'My first movie',
  //         posterPath: 'posterPath.png',
  //         title: 'Mi primera pelicula',
  //       ),
  //     );
  // final allItems = await db.select(db.favoritesMovies).get();

  // print('movies: $allItems');
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: appRouter,
      title: 'Flutter Demo',
      theme: AppTheme().lightTheme,
    );
  }
}
