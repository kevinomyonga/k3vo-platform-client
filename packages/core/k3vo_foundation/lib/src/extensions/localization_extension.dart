import 'package:flutter/widgets.dart';
import 'package:k3vo_localization/k3vo_localization.dart';

extension K3voLocalizationX on BuildContext {
  AppLocalizations get k3voL10n => AppLocalizations.of(this);
}
