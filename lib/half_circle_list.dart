library half_circle_list;

import 'dart:math' as math;

import 'package:flutter/material.dart';

class HalfCircleList extends StatelessWidget {
  final List<Widget> children;

  HalfCircleList({required this.children});

  @override
  Widget build(BuildContext context) {
    const startAngle = math.pi / 2;
    final angleStep = math.pi / (children.length - 1);
    final layouts = <Widget>[];

    int i = 0;
    for (var value in children) {
      layouts.add(LayoutId(
          id: i,
          child: Transform.rotate(
            angle: i * -1 * angleStep + startAngle,
            child: value,
          )));

      i++;
    }

    return CustomMultiChildLayout(
      delegate: HalfCircleLayoutDelegate(
          childCount: children.length,
          startAngle: startAngle,
          angleStep: angleStep),
      children: layouts,
    );
  }
}

class HalfCircleLayoutDelegate extends MultiChildLayoutDelegate {
  final int childCount;
  final double startAngle;
  final double angleStep;

  HalfCircleLayoutDelegate(
      {required this.childCount,
        required this.startAngle,
        required this.angleStep});

  @override
  void performLayout(Size size) {
    final xRadius = size.width / 2;
    final yRadius = size.height;
    final center = Offset(xRadius, yRadius);
    final angleDelta = childCount > 1 ? angleStep * (childCount - 1) : 0;

    for (int i = 0; i < childCount; i++) {
      final double angle = startAngle - angleDelta / 2 + angleStep * i;
      final double xOffset = center.dx + xRadius * math.cos(angle);
      final double yOffset = center.dy - yRadius * math.sin(angle);

      final childId = i;
      if (hasChild(childId)) {
        final Size childSize = layoutChild(childId, BoxConstraints.loose(size));
        positionChild(
            childId,
            Offset(
                xOffset - childSize.width / 2, yOffset - childSize.height / 2));
      }
    }
  }

  @override
  bool shouldRelayout(covariant MultiChildLayoutDelegate oldDelegate) {
    return true;
  }

  @override
  Size getSize(BoxConstraints constraints) {
    return Size(constraints.maxWidth,
        constraints.maxHeight); // Set the size of the half circle widget
  }
}
