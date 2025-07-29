import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:k3vo_localization/k3vo_localization.dart';
import 'package:k3vo_ui_kit/k3vo_ui_kit.dart';

class K3voLanguageListTile extends StatelessWidget {
  const K3voLanguageListTile({
    required this.language,
    required this.isSelected,
    required this.onTap,
    super.key,
  });

  final Language language;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: SvgPicture.asset(
        language.iconPath,
        width: 32,
        height: 32,
      ),
      title: Text(language.label),
      trailing: isSelected
          ? const Icon(Icons.radio_button_checked)
          : const Icon(Icons.radio_button_unchecked),
      onTap: onTap,
      selected: isSelected,
    );
  }
}
