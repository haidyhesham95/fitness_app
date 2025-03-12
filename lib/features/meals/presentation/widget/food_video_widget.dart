import 'package:fitness_app/core/styles/fonts/my_fonts.dart';
import 'package:fitness_app/core/utils/extension/my_context.dart';
import 'package:fitness_app/core/utils/widgets/spacing.dart';
import 'package:fitness_app/features/meals/presentation/provider/youtube_player_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class FoodVideoWidget extends StatefulWidget {
  final String imageUrl, title, description, videoUrl;

  const FoodVideoWidget({
    Key? key,
    required this.imageUrl,
    required this.title,
    required this.description,
    required this.videoUrl,
  }) : super(key: key);

  @override
  State<FoodVideoWidget> createState() => _FoodVideoWidgetState();
}

class _FoodVideoWidgetState extends State<FoodVideoWidget> {
  @override
  void initState() {
    super.initState();

    // Ensure the provider is accessed correctly after build
    Future.microtask(() {
      final provider =
          Provider.of<YoutubePlayerProvider>(context, listen: false);
      provider.initialize(widget.videoUrl);
      debugPrint(' video url ${widget.videoUrl}');
    });
  }

  @override
  void dispose() {
    super.dispose();
    Provider.of<YoutubePlayerProvider>(context, listen: false)
        .disposeController();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, YoutubePlayerProvider provider, _) {
        if (provider.error != null) {
          return _buildThumbnail(context);
        }

        return ClipRRect(
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(20),
            bottomRight: Radius.circular(20),
          ),
          child: Stack(
            children: [
              if (provider.controller != null)
                Positioned.fill(
                  child: YoutubePlayer(
                    controller: provider.controller!,
                    showVideoProgressIndicator: true,
                    progressIndicatorColor: context.colors.baseColor,
                    progressColors: ProgressBarColors(
                      bufferedColor:
                          context.colors.baseColor.withValues(alpha: .5),
                      playedColor: context.colors.baseColor,
                      backgroundColor:
                          context.colors.bgColor.withValues(alpha: .2),
                      handleColor: context.colors.baseColor,
                    ),
                    thumbnail: _buildThumbnail(context),
                    aspectRatio: 16 / 9,
                    onReady: () {
                      //provider.notifyListeners();
                    },
                  ),
                ),

              // _buildPlayPauseOverlay(context, provider),

            ],
          ),
        );
      },
    );
  }

  /// Builds a loading thumbnail
  Widget _buildThumbnail(BuildContext context) {
    return Stack(
      children: [
        Image.network(
          widget.imageUrl,
          fit: BoxFit.cover,
          width: double.infinity,
          height: context.height * 0.4,

        ),
    Container(
    decoration: BoxDecoration(
    gradient: LinearGradient(
    begin: Alignment.bottomCenter,
    end: Alignment.topCenter,
    colors: [
    Colors.black.withValues(alpha: 0.6),
    Colors.black.withValues(alpha: .7),
      context.colors.transparent,
      context.colors.transparent,
    ],
    ),
    ),),
        _buildVideoInfo(context),
      ],
    );
  }

  /// Builds the video information (title, description)
  Widget _buildVideoInfo(BuildContext context) {
    return Positioned(
      bottom: 10.h,
      left: 10.w,
      right: 10.w,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          verticalSpacing(10.h),
          Text(
            widget.title,
            style: MyFonts.styleSemiBold600_24
                .copyWith(color: context.colors.white),
            maxLines: 1,
          ),
          Text(
            widget.description,
            style: MyFonts.styleRegular400_16
                .copyWith(color: context.colors.white),
            maxLines: 2,
          ),
        ],
      ),
    );
  }
}
