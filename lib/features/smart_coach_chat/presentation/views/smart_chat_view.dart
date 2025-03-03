import 'package:fitness_app/core/localization/lang_keys.dart';
import 'package:fitness_app/core/utils/extension/my_context.dart';
import 'package:fitness_app/core/utils/widgets/base/app_loader.dart';
import 'package:fitness_app/core/utils/widgets/base/base_view.dart';
import 'package:fitness_app/core/utils/widgets/spacing.dart';
import 'package:fitness_app/features/smart_coach_chat/presentation/viewModel/smart_chat_state.dart';
import 'package:fitness_app/features/smart_coach_chat/presentation/viewModel/smart_chat_view_model.dart';
import 'package:fitness_app/features/smart_coach_chat/presentation/widgets/build_message_input.dart';
import 'package:fitness_app/features/smart_coach_chat/presentation/widgets/smart_chat_list.dart';
import 'package:fitness_app/generated/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class SmartChatView extends StatefulWidget {
  const SmartChatView({Key? key}) : super(key: key);

  @override
  State<SmartChatView> createState() => _SmartChatViewState();
}

class _SmartChatViewState extends State<SmartChatView> {
  final ScrollController _scrollController = ScrollController();
  late SmartChatViewModel smartChatViewModel;
  final TextEditingController promptController = TextEditingController();

  @override
  void initState() {
    super.initState();
    smartChatViewModel = context.read<SmartChatViewModel>();
  }

  void _scrollToBottom() {
    Future.delayed(const Duration(milliseconds: 300), () {
      if (_scrollController.hasClients) {
        _scrollController.animateTo(
          _scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return BaseView(
      image: Assets.imagesChatBg,
      subTitle: context.translate(LangKeys.smartCoach),
      actions: [
        IconButton(
          onPressed: () {},
          icon: SvgPicture.asset(Assets.svgMenu),
        ),
      ],
      isArrowBackShow: true,
      child: [
        SliverToBoxAdapter(child: verticalSpacing(20)),
        BlocConsumer<SmartChatViewModel, SmartChatState>(
          listener: (context, state) {
            if (state is SmartChatSuccess) {
              _scrollToBottom();
            }
          },
          builder: (context, state) {
            return SliverFillRemaining(
              hasScrollBody: true,
              child: Column(
                children: [
                  Expanded(
                    child: state is SmartChatSuccess &&
                        state.messages.isNotEmpty
                        ? CustomScrollView(
                      controller: _scrollController,
                      slivers: [SmartChatList(messages: state.messages)],
                    )
                        : const Center(child: AppLoader()),
                  ),
                  const BuildMessageInput(),
                ],
              ),
            );
          },
        ),
      ],
    );
  }
}
