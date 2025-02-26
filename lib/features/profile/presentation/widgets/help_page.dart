import 'package:fitness_app/core/utils/extension/my_context.dart';
import 'package:fitness_app/features/profile/presentation/widgets/info_center_item.dart';
import 'package:fitness_app/features/profile/presentation/widgets/info_center_widget.dart';
import 'package:flutter/material.dart';

import '../../../../core/localization/lang_keys.dart';

class HelpPage extends StatelessWidget {
  const HelpPage({super.key});

  @override
  Widget build(BuildContext context) {
    List<InfoCenterItem> items = [
      InfoCenterItem(
        title: context.translate(LangKeys.titleHelp),
        subtitle: context.translate(LangKeys.descriptionHelp),
      ),
      InfoCenterItem(
        title: context.translate(LangKeys.titleHelpOne),
        subtitle: context.translate(LangKeys.descriptionHelpOne),
      ),
      InfoCenterItem(
        title: context.translate(LangKeys.titleHelpTwo),
        subtitle: context.translate(LangKeys.descriptionHelpTwo),
      ),
      InfoCenterItem(
        title: context.translate(LangKeys.titleHelpThree),
        subtitle: context.translate(LangKeys.descriptionHelpThree),
      ),
    ];

    return InfoCenterWidget(items: items , title: context.translate(LangKeys.help));
  }
}
