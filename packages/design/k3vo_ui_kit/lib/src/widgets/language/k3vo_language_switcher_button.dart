import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:k3vo_foundation/k3vo_foundation.dart';
import 'package:k3vo_ui_kit/k3vo_ui_kit.dart';

class K3voLanguageSwitcherButton extends StatelessWidget {
  const K3voLanguageSwitcherButton({
    super.key,
    this.showLabel = false, // Default to icon-only
  });
  final bool showLabel;

  @override
  Widget build(BuildContext context) {
    final language = context.watch<LanguageCubit>().state.selectedLanguage;

    return OutlinedButton(
      onPressed: () => showLanguageSelectionSheet(context),
      style: OutlinedButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 12),
      ),
      child: showLabel
          ? Row(
              children: [
                SvgPicture.asset(
                  language.iconPath,
                  width: 24,
                  height: 24,
                ),
                const SizedBox(width: 8),
                K3voText(
                  text: language.label,
                  hasShadow: true,
                  casing: K3voTextCasing.camelCase,
                ),
              ],
            )
          : SvgPicture.asset(
              language.iconPath,
              width: 32,
              height: 32,
            ),
    );
  }
}
