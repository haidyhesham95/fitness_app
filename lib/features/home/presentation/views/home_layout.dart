import 'package:fitness_app/core/localization/lang_keys.dart';
import 'package:fitness_app/core/utils/extension/my_context.dart';
import 'package:fitness_app/features/smart_coach_chat/presentation/views/smart_chat_intro_view.dart';
import 'package:fitness_app/generated/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../profile/presentation/view/profile_view.dart';

class HomeLayout extends StatefulWidget {
  const HomeLayout({super.key});

  @override
  State<HomeLayout> createState() => _HomeLayoutState();
}

class _HomeLayoutState extends State<HomeLayout> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    Container(),
    const SmartChatIntroView(),
    Container(),
    const ProfileView()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colors.white,
      body: Stack(children: [
        Positioned.fill(child: _screens[_currentIndex]),
        PositionedDirectional(
          bottom: 8.h,
          start: 0,
          end: 0,
          child: Container(
            height: 69,
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 4.h),
            decoration: const BoxDecoration(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(25),
                topRight: Radius.circular(25),
              ),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: BottomNavigationBar(
                currentIndex: _currentIndex,
                onTap: (index) {
                  setState(() {
                    _currentIndex = index;
                  });
                },
                type: BottomNavigationBarType.fixed,
                selectedItemColor: context.colors.baseColor,
                unselectedItemColor: context.colors.white,
                backgroundColor: context.colors.bgColor,
                showSelectedLabels: true,
                showUnselectedLabels: false,
                elevation: 0,
                items: [
                  BottomNavigationBarItem(
                    icon: const ImageIcon(
                      AssetImage(Assets.imagesHome),
                    ),
                    label: context.translate(LangKeys.explore),
                  ),
                  BottomNavigationBarItem(
                    icon: const ImageIcon(
                      AssetImage(Assets.imagesChatAi),
                    ),
                    label: context.translate(LangKeys.chatAi),
                  ),
                  BottomNavigationBarItem(
                    icon: const ImageIcon(
                      AssetImage(Assets.imagesGym),
                    ),
                    label: context.translate(LangKeys.workouts),
                  ),
                  BottomNavigationBarItem(
                    icon: const ImageIcon(
                      AssetImage(Assets.imagesHomeProfile),
                    ),
                    label: context.translate(LangKeys.profile),
                  ),
                ],
              ),
            ),
          ),
        )
      ]),
    );
  }
}
