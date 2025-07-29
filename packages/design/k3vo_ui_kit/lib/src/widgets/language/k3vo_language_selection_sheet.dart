import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:k3vo_foundation/k3vo_foundation.dart';
import 'package:k3vo_localization/k3vo_localization.dart';
import 'package:k3vo_ui_kit/k3vo_ui_kit.dart';

class K3voLanguageSelectionSheet extends StatelessWidget {
  const K3voLanguageSelectionSheet({super.key});

  @override
  Widget build(BuildContext context) {
    final currentLanguage = context.watch<LanguageCubit>().state;

    return SafeArea(
      child: ListView(
        shrinkWrap: true,
        children: Language.values.map((lang) {
          return K3voLanguageListTile(
            language: lang,
            isSelected: lang.label == currentLanguage.selectedLanguage.label,
            onTap: () {
              context.read<LanguageCubit>().updateLanguage(lang);
              Navigator.of(context).pop();
            },
          );
        }).toList(),
      ),
    );
  }
}

/// Helper function to show [MotybaseLanguageSelectionSheet].
Future<dynamic> showLanguageSelectionSheet(BuildContext context) {
  return showModalBottomSheet(
    isScrollControlled: true,
    useRootNavigator: true,
    showDragHandle: true,
    context: context,
    builder: (_) => const K3voLanguageSelectionSheet(),
  );
}
