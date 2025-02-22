import 'package:fitness_app/core/utils/extension/my_context.dart';
import 'package:fitness_app/core/utils/extension/navigation.dart';
import 'package:fitness_app/features/auth/data/data_sources/contracts/offline_data_sources/auth_offline_data_source.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/localization/lang_keys.dart';
import '../../../../core/networking/common/register_context_module.dart';
import '../../../../core/routes/app_routes.dart';
import '../../../../core/styles/fonts/my_fonts.dart';
import '../../../../core/utils/widgets/base/snack_bar.dart';
import '../../../../core/utils/widgets/buttons/custom_button.dart';

void showLogoutDialog(BuildContext context) {
  final AuthOfflineDataSource offlineDataSource =
      getIt<AuthOfflineDataSource>();

  showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          contentPadding:
              EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
          titlePadding:
              EdgeInsets.only(left: 16.w, right: 16.w, bottom: 24.h, top: 16.h),
          backgroundColor: context.colors.bgColor,
          title: Text(
            context.translate(LangKeys.logOutDescription),
            textAlign: TextAlign.center,
            style: MyFonts.styleSemiBold600_20
                .copyWith(color: context.colors.white),
          ),
          actions: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: CustomButton(
                    color: context.colors.bgColor,
                    txt: context.translate(LangKeys.no),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
                const Spacer(),
                Expanded(
                  child: CustomButton(
                    txt: context.translate(LangKeys.yes),
                    onPressed: () {
                      offlineDataSource.deleteToken();
                      context.pushReplacementNamed(AppRoutes.login);
                      aweSnackBar(
                        msg: context.translate(LangKeys.logoutSuccessfully),
                        context: context,
                        type: MessageTypeConst.success,
                        title: context.translate(LangKeys.success),
                      );
                    },
                  ),
                ),
              ],
            ),
          ],
        );
      });
}
