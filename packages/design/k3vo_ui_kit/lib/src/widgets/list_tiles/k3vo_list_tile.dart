import 'package:flutter/material.dart';

class MotyBaseListTile extends StatelessWidget {
  const MotyBaseListTile({
    required this.title,
    this.subtitle,
    this.leadingIcon,
    this.onTap,
    this.color,
    this.trailingIcon = Icons.chevron_right,
    this.showDivider = false,
    this.padding,
    this.switchValue,
    this.onSwitchChanged,
    this.selected = false,
    super.key,
  });

  final IconData? leadingIcon;
  final String title;
  final String? subtitle;
  final VoidCallback? onTap;
  final Color? color;
  final IconData? trailingIcon;
  final bool showDivider;
  final EdgeInsetsGeometry? padding;
  final bool selected;

  // Switch properties
  final bool? switchValue;
  final ValueChanged<bool>? onSwitchChanged;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textColor = color ?? theme.textTheme.bodyLarge?.color;
    final iconColor = color ?? theme.iconTheme.color;

    Widget trailingWidget;
    if (switchValue != null && onSwitchChanged != null) {
      trailingWidget = Switch.adaptive(
        value: switchValue!,
        onChanged: onSwitchChanged,
      );
    } else if (trailingIcon != null) {
      trailingWidget = Icon(trailingIcon, color: iconColor);
    } else {
      trailingWidget = const SizedBox.shrink();
    }

    Widget tile = ListTile(
      contentPadding: padding ?? const EdgeInsets.symmetric(horizontal: 16),
      leading: leadingIcon != null ? Icon(leadingIcon, color: iconColor) : null,
      title: Text(
        title,
        style: theme.textTheme.bodyLarge?.copyWith(color: textColor),
      ),
      subtitle: subtitle != null
          ? Text(subtitle!, style: theme.textTheme.bodyMedium)
          : null,
      trailing: trailingWidget,
      selected: selected,
      onTap: switchValue == null ? onTap : null,
    );

    if (showDivider) {
      tile = Column(
        children: [
          tile,
          const Divider(height: 1),
        ],
      );
    }

    return tile;
  }
}
