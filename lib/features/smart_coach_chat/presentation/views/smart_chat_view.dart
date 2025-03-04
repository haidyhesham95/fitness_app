import 'package:fitness_app/core/localization/lang_keys.dart';
import 'package:fitness_app/core/utils/extension/my_context.dart';
import 'package:fitness_app/core/utils/widgets/base/app_loader.dart';
import 'package:fitness_app/core/utils/widgets/base/base_view.dart';
import 'package:fitness_app/core/utils/widgets/spacing.dart';
import 'package:fitness_app/features/smart_coach_chat/presentation/viewModel/smart_chat_action.dart';
import 'package:fitness_app/features/smart_coach_chat/presentation/viewModel/smart_chat_state.dart';
import 'package:fitness_app/features/smart_coach_chat/presentation/viewModel/smart_chat_view_model.dart';
import 'package:fitness_app/features/smart_coach_chat/presentation/widgets/build_message_input.dart';
import 'package:fitness_app/features/smart_coach_chat/presentation/widgets/smart_chat_list.dart';
import 'package:fitness_app/generated/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/styles/fonts/my_fonts.dart';
import '../widgets/custom_saved_message.dart';

class SmartChatView extends StatefulWidget {
  const SmartChatView({Key? key}) : super(key: key);

  @override
  State<SmartChatView> createState() => _SmartChatViewState();
}

class _SmartChatViewState extends State<SmartChatView> {
  final ScrollController _scrollController = ScrollController();
  late SmartChatViewModel smartChatViewModel;
  final TextEditingController promptController = TextEditingController();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    smartChatViewModel = context.read<SmartChatViewModel>();
    smartChatViewModel.doAction(GetTitlesAction());
  }

  @override
  void dispose() {
    if (smartChatViewModel.chatMessages.isNotEmpty) {
      smartChatViewModel.doAction(SaveMessagesAction());
    }
    super.dispose();
  }

  void _scrollToBottom() {
    Future.delayed(const Duration(milliseconds: 100), () {
      if (_scrollController.hasClients) {
        _scrollController.animateTo(
          _scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 100),
          curve: Curves.easeOut,
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return BaseView(
      scaffoldKey: _scaffoldKey,
      image: Assets.imagesChatBg,
      subTitle: context.translate(LangKeys.smartCoach),
      isArrowBackShow: true,
      drawer: Drawer(
        backgroundColor: Colors.black.withValues(alpha: 0.8),
        child: Padding(
          padding: const EdgeInsets.only(top: 48, left: 20, right: 20),
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                  child: Center(
                      child: Text(
                "Previous conversations",
                style: MyFonts.styleExtraBold800_20
                    .copyWith(color: context.colors.white),
              ))),
              const SliverToBoxAdapter(
                child: SizedBox(
                  height: 20,
                ),
              ),
              BlocBuilder<SmartChatViewModel, SmartChatState>(
                  builder: (context, state) {
                if (state is SmartChatTitlesLoaded) {
                  return SliverList(
                    delegate: SliverChildBuilderDelegate(
                      (context, index) => GestureDetector(
                        onTap: () {},
                        child: CustomSavedMessage(
                          text: state.titles[index],
                        ),
                      ),
                      childCount: smartChatViewModel.titles.length,
                    ),
                  );
                }
                return const SliverToBoxAdapter();
              })
            ],
          ),
        ),
      ),
      actions: [
        IconButton(
          onPressed: () {
            if (smartChatViewModel.chatMessages.isNotEmpty) {
              smartChatViewModel.doAction(SaveMessagesAction());
              smartChatViewModel.doAction(GetTitlesAction());
            }
            _scaffoldKey.currentState?.openEndDrawer();
          },
          icon: SvgPicture.asset(Assets.svgMenu),
        ),
      ],
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
