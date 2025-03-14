import 'package:fitness_app/features/exercises/presentation/widget/cached_network_widget.dart';
import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../../domain/entities/exercises_entity.dart';

class ImageExerciseSelector extends StatelessWidget {
  const ImageExerciseSelector({super.key, required this.exercise});

  final Exercises exercise;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      clipBehavior: Clip.hardEdge,
      child: Container(
        height: 88,
        width: 81,
        child: CachedNetworkWidget(
          imageUrl: _getThumbnailUrl(
              exercise.shortYoutubeDemonstrationLink.toString()),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  String _getThumbnailUrl(String videoUrl) {
    final videoId = YoutubePlayer.convertUrlToId(videoUrl);
    return 'https://img.youtube.com/vi/$videoId/0.jpg';
  }
}
