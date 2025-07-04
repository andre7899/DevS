import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tok_tik/presentation/providers/discover_provider.dart';
import 'package:tok_tik/presentation/widgets/shared/video_scrollable_view.dart';

class DiscoverScreen extends StatelessWidget {
  const DiscoverScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final discoverProv = context.watch<DiscoverProvider>();

    // igual solo cambia listen para ver si es watch o read
    // final provider = Provider.of<DiscoverProvider>(context, listen: false);
    return Scaffold(
      body: discoverProv.initialLoading
          ? const Center(
              child: CircularProgressIndicator.adaptive(
                strokeWidth: 2,
              ),
            )
          : VideoScrollableView(
              videos: discoverProv.videos,
            ),
    );
  }
}
