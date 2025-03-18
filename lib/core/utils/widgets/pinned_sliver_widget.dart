import 'package:fitness_app/core/utils/widgets/pinned_header_widget.dart';
import 'package:flutter/material.dart';

class PinnedSliverWidget extends StatelessWidget {
  final Widget child;
  final double? height;

  const PinnedSliverWidget({Key? key, required this.child, this.height})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverPersistentHeader(
        pinned: true,
        floating: true,
        delegate: PinnedHeaderWidget(
          height: height,
          child: child,
        ));
  }
}
