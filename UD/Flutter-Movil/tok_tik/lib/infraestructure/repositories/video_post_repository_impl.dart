import 'package:tok_tik/domain/datasources/video_post_datasource.dart';
import 'package:tok_tik/domain/entities/video_post.dart';
import 'package:tok_tik/domain/repositories/video_post_repository.dart';

class VideoPostRepositoryImpl implements VideoPostRepository {
  final VideoPostDatasource videosDatasource;

  VideoPostRepositoryImpl({required this.videosDatasource});

  @override
  Future<List<VideoPost>> getFavoriteVideosByUser({required String userId}) {
    // TODO: implement getFavoriteVideosByUser
    throw UnimplementedError();
  }

  @override
  Future<List<VideoPost>> getTrendingVideos({required int page}) {
    return videosDatasource.getTrendingVideos(page: page);
  }
}
