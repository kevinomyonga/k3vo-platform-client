import 'package:flutter/material.dart';
import 'package:split_screen/split_screen.dart';

class MotyBaseSplitLayout extends StatelessWidget {
  const MotyBaseSplitLayout({
    required this.startPane,
    required this.endPane,
    this.scrollable,
    this.scrollDirection = Axis.vertical,
    this.padding = const EdgeInsets.symmetric(horizontal: 24, vertical: 48),
    this.alignment = CrossAxisAlignment.center,
    super.key,
  });

  final Widget startPane;
  final Widget endPane;
  final bool? scrollable; // null = auto
  final Axis scrollDirection;
  final EdgeInsetsGeometry padding;
  final CrossAxisAlignment alignment;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isWideScreen = size.width > 650;
    final isSmallScreen = size.width < 650;

    // Auto-determine scrollable if not explicitly set
    final shouldScroll = scrollable ?? isSmallScreen;

    if (isWideScreen) {
      return TwoPane(
        startPane: startPane,
        endPane: endPane,
      );
    }

    final layout = Flex(
      direction: scrollDirection,
      crossAxisAlignment: alignment,
      children: [
        startPane,
        const SizedBox(height: 32),
        endPane,
      ],
    );

    if (shouldScroll) {
      return SingleChildScrollView(
        scrollDirection: scrollDirection,
        padding: padding,
        child: layout,
      );
    }

    return TwoPane(
      startPane: startPane,
      endPane: endPane,
      panePriority: TwoPanePriority.start,
    );
  }
}
