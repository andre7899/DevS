import 'package:tok_tik/domain/entities/video_post.dart';

class LocalVideoModel {
  final String name;
  final String videoUrl;
  final int likes;
  final int views;

  LocalVideoModel({
    required this.name,
    required this.videoUrl,
    this.likes = 0,
    this.views = 0,
  });

  factory LocalVideoModel.fromJson(Map<String, dynamic> map) {
    return LocalVideoModel(
      name: map['name'] as String,
      videoUrl: map['videoUrl'] as String,
      likes: map['likes'],
      views: map['views'],
    );
  }

  // Map<String, dynamic> toJson() {
  //   return {
  //     'name': name,
  //     'videoUrl': videoUrl,
  //     'likes': likes,
  //     'views': views,
  //   };
  // }

  VideoPost toVideoPostEntity() => VideoPost(
        caption: name,
        videoUrl: videoUrl,
        likes: likes,
        views: views,
      );
}
