import 'package:fitness_app/core/utils/extension/my_context.dart';
import 'package:fitness_app/features/profile/presentation/widgets/info_center_item.dart';
import 'package:flutter/material.dart';

import '../../../../core/localization/lang_keys.dart';
import 'info_center_widget.dart';

class SecurityPage extends StatelessWidget {
  const SecurityPage({super.key});

  @override
  Widget build(BuildContext context) {
    List<InfoCenterItem> items = [
      InfoCenterItem(
        title: context.translate(LangKeys.titleSecurity),
        subtitle: context.translate(LangKeys.descriptionSecurityOne),
      ),
      InfoCenterItem(
        title: context.translate(LangKeys.titleSecurityTwo),
        subtitle: context.translate(LangKeys.descriptionSecurityTwo),
      ),
      InfoCenterItem(
        title: context.translate(LangKeys.titleSecurityThree),
        subtitle: context.translate(LangKeys.descriptionSecurityThree),
      ),
    ];

    return InfoCenterWidget(items: items , title: context.translate(LangKeys.security));
  }
}
