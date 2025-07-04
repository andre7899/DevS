import 'package:flutter/material.dart';
import 'package:tok_tik/domain/entities/video_post.dart';
import 'package:tok_tik/domain/repositories/video_post_repository.dart';

class DiscoverProvider extends ChangeNotifier {
  //TODO: repository, datasource
  final VideoPostRepository videoPostRepository;

  DiscoverProvider({required this.videoPostRepository});

  bool initialLoading = true;
  List<VideoPost> videos = [];

  Future<void> loadNextPage() async {
    await Future.delayed(const Duration(seconds: 2));
    final newVideos = await videoPostRepository.getTrendingVideos(page: 1);
    videos.addAll(newVideos);
    initialLoading = false;

    notifyListeners();
  }
}
