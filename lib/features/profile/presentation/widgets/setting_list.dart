import 'package:fitness_app/core/localization/app_localizations.dart';
import 'package:fitness_app/core/utils/extension/my_context.dart';
import 'package:fitness_app/core/utils/extension/navigation.dart';
import 'package:fitness_app/features/profile/presentation/widgets/setting_item.dart';
import 'package:fitness_app/generated/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/app_cubit/app_cubit.dart';
import '../../../../core/app_cubit/app_state.dart';
import '../../../../core/localization/lang_keys.dart';
import '../../../../core/routes/app_routes.dart';
import '../../../../core/styles/fonts/my_fonts.dart';
import 'logout_dialog.dart';

class SettingList extends StatelessWidget {
  const SettingList({super.key});

  @override
  Widget build(BuildContext context) {
    List<SettingItem> items = [
      SettingItem(
        text: context.translate(LangKeys.editProfile),
        icon: Assets.imagesProfile,
        onTap: () {
          Navigator.pushReplacementNamed(context,AppRoutes.editProfileView);
        },
      ),
      SettingItem(
        text: context.translate(LangKeys.changePassword),
        icon: Assets.imagesChange,
        onTap: () {
          context.pushNamed(AppRoutes.forgetPasswordView);
        },
      ),
      SettingItem(
        title: RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: context.translate(LangKeys.selectLanguage),
                style: MyFonts.styleSemiBold600_14.copyWith(
                  color: context.colors.white,
                ),
              ),
              TextSpan(
                text:
                    ' (${AppLocalizations.of(context)!.isEnLocale ? context.translate(LangKeys.english) : context.translate(LangKeys.arabic)})',
                style: MyFonts.styleSemiBold600_14.copyWith(
                  color: context.colors.baseColor,
                ),
              ),
            ],
          ),
        ),
        icon: Assets.imagesLanguage,
        onTap: () {},
        trailing: BlocBuilder<AppCubit, AppStates>(
          builder: (context, state) {
            final cubit = context.read<AppCubit>();
            return Switch(
              activeColor: context.colors.white,
              activeTrackColor: context.colors.baseColor,
              inactiveThumbColor: context.colors.baseColor,
              inactiveTrackColor: context.colors.darkGray,
              value: AppLocalizations.of(context)!.isEnLocale,
              onChanged: (value) {
                AppLocalizations.of(context)!.isEnLocale
                    ? cubit.toArabic()
                    : cubit.toEnglish();
              },
            );
          },
        ),
      ),
      SettingItem(
        text: context.translate(LangKeys.security),
        icon: Assets.imagesLockSetting,
        onTap: () {},
      ),
      SettingItem(
        text: context.translate(LangKeys.privacyPolicy),
        icon: Assets.imagesSecurityWarning,
        onTap: () {},
      ),
      SettingItem(
        text: context.translate(LangKeys.help),
        icon: Assets.imagesHelp,
        onTap: () {},
      ),
      SettingItem(
        text: context.translate(LangKeys.logout),
        icon: Assets.imagesLogout,
        onTap: () {
          showLogoutDialog(context);
        },
      ),
    ];

    return Container(
      margin: EdgeInsets.symmetric(horizontal: 15.w),
      decoration: BoxDecoration(
        color: context.colors.bgColor.withValues(alpha: 0.9),
        borderRadius: BorderRadius.circular(20),
      ),
      child: ListView.separated(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          padding: EdgeInsets.symmetric(vertical: 8.h),
          itemBuilder: (BuildContext context, int index) {
            return items[index];
          },
          separatorBuilder: (BuildContext context, int index) => Divider(
                color: context.colors.darkGray,
                thickness: 1,
              ),
          itemCount: items.length),
    );
  }
}
