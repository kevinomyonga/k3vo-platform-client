import 'package:flutter/material.dart';
import 'package:k3vo_ui_kit/k3vo_ui_kit.dart';

class MotybaseTextDivider extends StatelessWidget {
  const MotybaseTextDivider({
    required this.text,
    super.key,
    this.lineWidth = 100,
    this.startColor = Colors.white10,
    this.endColor = Colors.white10,
    this.textStyle,
    this.padding = const EdgeInsets.symmetric(vertical: 20),
  });
  final String text;
  final double lineWidth;
  final Color startColor;
  final Color endColor;
  final TextStyle? textStyle;
  final EdgeInsetsGeometry padding;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _buildLineGradient(startColor, endColor, lineWidth),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: K3voText(
              text: text,
              type: K3voTextType.bodyMedium,
              color: Colors.white,
              hasShadow: true,
            ),
          ),
          _buildLineGradient(endColor, startColor, lineWidth),
        ],
      ),
    );
  }

  Widget _buildLineGradient(Color start, Color end, double width) {
    return Container(
      width: width,
      height: 1,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [start, end],
        ),
      ),
    );
  }
}
