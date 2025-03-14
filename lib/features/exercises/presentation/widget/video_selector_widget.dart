import 'package:fitness_app/core/utils/extension/my_context.dart';
import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../../../../core/utils/widgets/youtube_player_widget.dart';
import '../../domain/entities/exercises_entity.dart';

class VideoSelectorWidget extends StatelessWidget {
  const VideoSelectorWidget({super.key, required this.exercise});

  final Exercises exercise;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: 40,
      decoration: BoxDecoration(
        color: context.colors.baseColor,
        borderRadius: BorderRadius.circular(50),
      ),
      child: IconButton(
        padding: EdgeInsets.zero,
        onPressed: () {
          _playVideo(
              context, exercise.shortYoutubeDemonstrationLink.toString());
        },
        icon: Icon(
          Icons.play_arrow,
          color: context.colors.black,
          size: 40,
        ),
      ),
    );
  }

  void _playVideo(BuildContext context, String videoUrl) {
    final videoId = YoutubePlayer.convertUrlToId(videoUrl);
    if (videoId == null) return;

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          contentPadding: EdgeInsets.zero,
          backgroundColor: Colors.transparent,
          content: Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height * 0.5,
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(20),
            ),
            child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: YoutubePlayerWidget(
                  controller: YoutubePlayerController(
                    initialVideoId: videoId,
                    flags: const YoutubePlayerFlags(
                      autoPlay: true,
                      mute: false,
                    ),
                  ),
                )),
          ),
        );
      },
    );
  }
}
