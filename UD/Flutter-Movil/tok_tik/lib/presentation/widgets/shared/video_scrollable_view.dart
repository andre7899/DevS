import 'package:flutter/material.dart';
import 'package:tok_tik/domain/entities/video_post.dart';
import 'package:tok_tik/presentation/widgets/shared/video_buttons.dart';
import 'package:tok_tik/presentation/widgets/video/fullscreen_player.dart';

class VideoScrollableView extends StatelessWidget {
  const VideoScrollableView({super.key, required this.videos});

  final List<VideoPost> videos;

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      physics: const BouncingScrollPhysics(),
      scrollDirection: Axis.vertical,
      itemCount: videos.length,
      itemBuilder: (context, index) {
        final video = videos[index];

        return Stack(
          children: [
            //Videoplayer + gradiente

            SizedBox.expand(
              child: FullScreenPlayer(
                videoUrl: video.videoUrl,
                caption: video.caption,
              ),
            ),
            // VideoPlayerWidget(videoUrl: video.videoUrl),

            Positioned(
              bottom: 40,
              right: 20,
              child: VideoButtons(video: video),
            )
            // Center(
            //   child: Text(
            //     video.caption,
            //     style: const TextStyle(
            //       color: Colors.white,
            //       fontSize: 24,
            //       fontWeight: FontWeight.bold,
            //     ),
            //   ),
            // ),
            // Positioned(
            //   bottom: 20,
            //   left: 20,
            //   child: Column(
            //     crossAxisAlignment: CrossAxisAlignment.start,
            //     children: [
            //       Text(
            //         '${video.likes} Likes',
            //         style: const TextStyle(color: Colors.white, fontSize: 16),
            //       ),
            //       Text(
            //         '${video.views} Views',
            //         style: const TextStyle(color: Colors.white, fontSize: 16),
            //       ),
            //     ],
            //   ),
            // ),
          ],
        );
      },
    );
  }
}
