import 'package:collection/collection.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:k3vo_foundation/k3vo_foundation.dart';
import 'package:k3vo_localization/k3vo_localization.dart';

class LanguageCubit extends HydratedCubit<LanguageState> {
  LanguageCubit() : super(const LanguageState(Language.english));

  void updateLanguage(Language language) => emit(LanguageState(language));

  @override
  LanguageState? fromJson(Map<String, dynamic> json) {
    final name = json['language'] as String?;
    final language = Language.values.firstWhereOrNull(
      (lang) => lang.name == name,
    );
    return language != null ? LanguageState(language) : null;
  }

  @override
  Map<String, dynamic>? toJson(LanguageState state) =>
      {'language': state.selectedLanguage.name};
}
