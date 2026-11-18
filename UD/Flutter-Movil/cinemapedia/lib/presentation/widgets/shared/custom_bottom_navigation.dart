import 'package:flutter/material.dart';

class CustomBottomNavigation extends StatelessWidget {
  final int index;
  final void Function(int index) onTap;
  const CustomBottomNavigation({
    super.key,
    required this.index,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      elevation: 0,
      onTap: onTap,
      currentIndex: index,
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home_outlined), label: 'Home'),
        BottomNavigationBarItem(icon: Icon(Icons.label), label: 'categorias'),
        BottomNavigationBarItem(icon: Icon(Icons.favorite), label: 'Favoritos'),
      ],
    );
  }
}
