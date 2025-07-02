import 'package:flutter/material.dart';

class HerMessageBubble extends StatelessWidget {
  const HerMessageBubble({super.key, required this.message, this.imageUrl});

  final String message;
  final String? imageUrl;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          decoration: BoxDecoration(
            color: colors.secondary,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Text(
            message,
            style: const TextStyle(
              color: Colors.white,
            ),
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        if (imageUrl != null && imageUrl!.isNotEmpty) _ImageBubble(imageUrl!),
        const SizedBox(
          height: 10,
        ),
      ],
    );
  }
}

class _ImageBubble extends StatelessWidget {
  const _ImageBubble(this.imageUrl);

  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Image.network(
        imageUrl,
        loadingBuilder: (context, child, loadingProgress) {
          // print(loadingProgress);
          if (loadingProgress == null) return child;
          // return LinearProgressIndicator(
          //   value: loadingProgress.cumulativeBytesLoaded /
          //       loadingProgress.expectedTotalBytes!,
          // );
          return SizedBox(
            width: size.width * 0.7,
            height: 150,
            child: const Text('Mi bot está enviando una imagen'),
          );
        },
        width: size.width * 0.7,
        height: 150,
        fit: BoxFit.cover,
      ),
    );
  }
}
