import 'package:fitness_app/core/utils/extension/my_context.dart';
import 'package:flutter/material.dart';

import '../../../../core/localization/lang_keys.dart';

class MenuItemAnchor extends StatelessWidget {
  const MenuItemAnchor({super.key, this.onTapCamera, this.onTapGallery});

  final void Function()? onTapCamera;
  final void Function()? onTapGallery;

  @override
  Widget build(BuildContext context) {
    return MenuAnchor(
      builder: (context, controller, child) {
        return IconButton(
          icon: Icon(Icons.attach_file, color: context.colors.white),
          onPressed: () {
            if (controller.isOpen) {
              controller.close();
            } else {
              controller.open();
            }
          },
        );
      },
      menuChildren: [
        MenuItemButton(
          onPressed: onTapGallery,
          child:  Text(context.translate(LangKeys.gallery),),
        ),
        MenuItemButton(
          onPressed: onTapCamera,
          child:  Text(context.translate(LangKeys.camera),),
        ),
      ],
    );
  }
}
