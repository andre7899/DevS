import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tok_tik/config/theme/app_theme.dart';
import 'package:tok_tik/infraestructure/datasources/local_video_datasource_impl.dart';
import 'package:tok_tik/infraestructure/repositories/video_post_repository_impl.dart';
import 'package:tok_tik/presentation/providers/discover_provider.dart';
import 'package:tok_tik/presentation/screens/discover/discover_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    //Creando instancia de repositorio y datasource
    final videoPostRepository =
        VideoPostRepositoryImpl(videosDatasource: LocalVideoDatasourceImpl());

    return MultiProvider(
      providers: [
        //!Tambien se puede ejecutar en el constructor del provider
        ChangeNotifierProvider(
          lazy:
              false, // cuando se pone en false, el provider se inicializa inmediatamente
          create: (_) =>
              DiscoverProvider(videoPostRepository: videoPostRepository)
                ..loadNextPage(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Tok Tik',
        theme: AppTheme().getTheme(),
        home: const DiscoverScreen(),
      ),
    );
  }
}
