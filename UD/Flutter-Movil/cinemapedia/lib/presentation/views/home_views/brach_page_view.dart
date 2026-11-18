import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BranchPageView extends StatefulWidget {
  final StatefulNavigationShell navigationShell;
  final List<Widget> children;

  const BranchPageView({
    super.key,
    required this.navigationShell,
    required this.children,
  });

  @override
  State<BranchPageView> createState() => _BranchPageViewState();
}

class _BranchPageViewState extends State<BranchPageView> {
  late final PageController _pageController = PageController(
    initialPage: widget.navigationShell.currentIndex,
  );
  // bool _isAnimating = false;

  // Se ejecuta cuando cambia la rama (tap en el bottom nav o context.go)
  @override
  void didUpdateWidget(covariant BranchPageView oldWidget) {
    super.didUpdateWidget(oldWidget);
    final index = widget.navigationShell.currentIndex;
    if (_pageController.hasClients && _pageController.page?.round() != index) {
      _animateToPage(index);
    }
  }

  Future<void> _animateToPage(int index) async {
    // _isAnimating = true;
    await _pageController.animateToPage(
      index,
      duration: Durations.medium2,
      curve: Curves.easeInOut,
    );
    // _isAnimating = false;
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: _pageController,
      physics: const NeverScrollableScrollPhysics(),
      // // El usuario deslizó → avisar al router para que cambie de rama
      // onPageChanged: (index) {
      //   if (_isAnimating) return;
      //   widget.navigationShell.goBranch(index);
      // },
      children: widget.children,
    );
  }
}
