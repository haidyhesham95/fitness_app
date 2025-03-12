import 'package:fitness_app/core/utils/extension/my_context.dart';
import 'package:flutter/material.dart';

class PinnedHeaderWidget extends SliverPersistentHeaderDelegate {
  final double? height;
  final Widget child;

  PinnedHeaderWidget({required this.child, this.height});

  @override
  double get minExtent => height ?? 60.0;

  @override
  double get maxExtent => height?? 60.0;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Material(
      color: context.colors.transparent,
      child: child,
    );
  }

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}
