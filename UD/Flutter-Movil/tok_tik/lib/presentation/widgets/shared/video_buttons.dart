import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:tok_tik/config/helpers/human_formats.dart';
import 'package:tok_tik/domain/entities/video_post.dart';

class VideoButtons extends StatelessWidget {
  const VideoButtons({
    super.key,
    required this.video,
  });

  final VideoPost video;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _CustomButton(
            value: video.likes,
            iconData: Icons.favorite,
            iconColor: Colors.red),
        const SizedBox(
          height: 20,
        ),
        _CustomButton(
          value: video.likes,
          iconData: Icons.remove_red_eye_outlined,
        ),
        const SizedBox(
          height: 20,
        ),
        SpinPerfect(
          infinite: true,
          duration: const Duration(seconds: 5),
          child: const _CustomButton(
            value: 0,
            iconData: Icons.play_circle_outline_outlined,
          ),
        ),
      ],
    );
  }
}

class _CustomButton extends StatelessWidget {
  const _CustomButton(
      {required this.value, required this.iconData, Color? iconColor})
      : color = iconColor ?? Colors.white;

  final int value;
  final IconData iconData;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        IconButton(
          onPressed: () {},
          icon: Icon(
            iconData,
            color: color,
          ),
        ),
        if (value > 0)
          Text(
            HumanFormats.humanReadbleNumber(value.toDouble()),
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16,
            ),
          ),
      ],
    );
  }
}
