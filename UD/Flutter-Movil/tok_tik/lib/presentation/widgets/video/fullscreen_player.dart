import 'package:flutter/material.dart';
import 'package:tok_tik/presentation/widgets/video/video_background.dart';
import 'package:video_player/video_player.dart';

class FullScreenPlayer extends StatefulWidget {
  const FullScreenPlayer(
      {super.key, required this.videoUrl, required this.caption});
  final String videoUrl;
  final String caption;

  @override
  State<FullScreenPlayer> createState() => _FullScreenPlayerState();
}

class _FullScreenPlayerState extends State<FullScreenPlayer> {
  late VideoPlayerController videoController;
  late Future<void> _initializeVideoPlayerFuture;

  @override
  void initState() {
    videoController = VideoPlayerController.asset(widget.videoUrl)
      ..setVolume(0)
      ..setLooping(true)
      ..play();

    _initializeVideoPlayerFuture = videoController.initialize();
    super.initState();
  }

  @override
  void dispose() {
    videoController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _initializeVideoPlayerFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState != ConnectionState.done) {
          return const Center(
            child: CircularProgressIndicator.adaptive(),
          );
        }
        videoController.play();
        return GestureDetector(
          onTap: () {
            if (videoController.value.isPlaying) {
              videoController.pause();
              return;
            }
            videoController.play();
          },
          child: AspectRatio(
            aspectRatio: videoController.value.aspectRatio,
            child: Stack(
              children: [
                VideoPlayer(videoController),
                //Gradiente
                const VideoBackground(
                  stops: [0.05, 0.2],
                ),
                //TExto
                Positioned(
                  bottom: 50,
                  left: 20,
                  child: _VideoCaption(caption: widget.caption),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class _VideoCaption extends StatelessWidget {
  const _VideoCaption({super.key, required this.caption});

  final String caption;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final titleStyle = Theme.of(context).textTheme.titleLarge;
    return SizedBox(
      width: size.width * 0.6,
      child: Text(
        caption,
        maxLines: 2,
        style: titleStyle,
      ),
    );
  }
}
