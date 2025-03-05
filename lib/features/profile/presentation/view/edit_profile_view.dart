import 'package:fitness_app/features/profile/presentation/widgets/app_bar.dart';
import 'package:fitness_app/features/profile/presentation/widgets/picture_profile_screen.dart';
import 'package:fitness_app/features/profile/presentation/widgets/profile_date_section.dart';
import 'package:fitness_app/generated/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class EditProfileView extends StatelessWidget {
  const EditProfileView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
          fit: StackFit.expand,
          children: [
            Image.asset(
              Assets.imagesEditBg,
              fit: BoxFit.cover,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                appBar(context),
                SizedBox(height: 40.h,),
                const PictureProfileScreen(),
                SizedBox(height: 48.h,),
                 ProfileDateSection(),
              ],
            ),
          ]
      ),
    );
  }
}
