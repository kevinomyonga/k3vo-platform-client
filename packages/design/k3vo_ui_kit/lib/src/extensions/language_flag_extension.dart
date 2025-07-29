import 'package:k3vo_localization/k3vo_localization.dart';
import 'package:k3vo_ui_kit/k3vo_ui_kit.dart';

extension LanguageFlag on Language {
  String get iconPath => switch (this) {
        Language.english => Assets.images.icons.language.gb.keyName,
        Language.french => Assets.images.icons.language.fr.keyName,
        Language.swahili => Assets.images.icons.language.ke.keyName,
      };
}
