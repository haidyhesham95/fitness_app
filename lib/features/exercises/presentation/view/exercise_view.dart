import 'package:fitness_app/core/utils/extension/my_context.dart';
import 'package:fitness_app/generated/assets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../core/utils/widgets/base/base_view.dart';
import '../../../meals/presentation/provider/youtube_player_provider.dart';
import '../../../meals/presentation/widget/food_video_widget.dart';
import '../../../meals/presentation/widget/pinned_sliver_widget.dart';
import '../widget/exercise_selector.dart';

class ExerciseView extends StatelessWidget {
  const ExerciseView({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView(
      extendBodyBehindAppBar: true,
      child: [
        // SliverToBoxAdapter(child: Image.asset('assets/images/Frame 88.png')),
        PinnedSliverWidget(
          height: context.height * 0.4,
          child: ChangeNotifierProvider(
            create: (context) => YoutubePlayerProvider()..initialize(''),
            child: const FoodVideoWidget(
              videoUrl: 'https://youtu.be/fGaqVUHB1aA',
              imageUrl: 'https://iili.io/33p7y9p.png',
              title: '',
              description: 'Zzz',
            ),
          ),
        ),
        const ExerciseSelector(),
      ],
      image: Assets.imagesMealBg,
      isArrowBackShow: true,
      blur: 7
    );
  }
}
