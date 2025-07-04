import 'package:tok_tik/domain/datasources/video_post_datasource.dart';
import 'package:tok_tik/domain/entities/video_post.dart';
import 'package:tok_tik/infraestructure/models/local_video_model.dart';
import 'package:tok_tik/shared/data/local_video_posts.dart';

class LocalVideoDatasourceImpl implements VideoPostDatasource {
  @override
  Future<List<VideoPost>> getFavoriteVideosByUser({required String userId}) {
    // TODO: implement getFavoriteVideosByUser
    throw UnimplementedError();
  }

  @override
  Future<List<VideoPost>> getTrendingVideos({required int page}) async {
    await Future.delayed(const Duration(seconds: 2));
    final newVideos = videoPosts
        .map((e) => LocalVideoModel.fromJson(e).toVideoPostEntity())
        .toList();

    return newVideos;
  }
}
