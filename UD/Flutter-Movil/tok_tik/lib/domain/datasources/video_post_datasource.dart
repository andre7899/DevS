import 'package:tok_tik/domain/entities/video_post.dart';

abstract class VideoPostDatasource {
  Future<List<VideoPost>> getTrendingVideos({required int page});

  Future<List<VideoPost>> getFavoriteVideosByUser({required String userId});
}
