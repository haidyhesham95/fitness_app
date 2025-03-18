import 'package:fitness_app/core/utils/extension/my_context.dart';
import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class YoutubePlayerWidget extends StatelessWidget {
  const YoutubePlayerWidget({
    super.key,
    required this.controller,
    this.thumbnail,
  });

  final Widget? thumbnail;
  final YoutubePlayerController controller;

  @override
  Widget build(BuildContext context) {
    return YoutubePlayer(
      controller: controller,
      showVideoProgressIndicator: true,
      progressIndicatorColor: context.colors.baseColor,
      progressColors: ProgressBarColors(
        bufferedColor: context.colors.baseColor.withValues(alpha: .5),
        playedColor: context.colors.baseColor,
        backgroundColor: context.colors.bgColor.withValues(alpha: .2),
        handleColor: context.colors.baseColor,
      ),
      thumbnail: thumbnail,
      aspectRatio: 16 / 9,
    );
  }
}
