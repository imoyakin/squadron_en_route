import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

extension LocalizationHelper on BuildContext {
  AppLocalizations get L => AppLocalizations.of(this)!;
}