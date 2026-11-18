import 'package:cinemapedia/presentation/widgets/shared/custom_bottom_navigation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

// ConsumerStatefulWidget es un StatefulWidget con acceso a ref para usar Riverpod.
// ConsumerState reemplaza a State y permite usar ref también en initState.
class HomeScreen extends ConsumerWidget {
  static const name = 'home_screen';

  final StatefulNavigationShell navigationShell;

  const HomeScreen({super.key, required this.navigationShell});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      bottomNavigationBar: CustomBottomNavigation(
        index: navigationShell.currentIndex,
        onTap: (index) => navigationShell.goBranch(
          index,
          initialLocation: index == navigationShell.currentIndex,
        ),
      ),

      body: navigationShell,
    );
  }
}
