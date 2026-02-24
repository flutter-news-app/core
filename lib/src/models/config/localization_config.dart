import 'package:core/src/enums/supported_language.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

part 'localization_config.g.dart';

/// {@template localization_config}
/// Defines the language policy for the application instance.
///
/// This configuration controls which languages are exposed to the end-user
/// and which language is used as a fallback.
/// {@endtemplate}
@immutable
@JsonSerializable(explicitToJson: true, includeIfNull: true, checked: true)
class LocalizationConfig extends Equatable {
  /// {@macro localization_config}
  const LocalizationConfig({
    required this.enabledLanguages,
    required this.defaultLanguage,
  });

  /// Creates a [LocalizationConfig] from JSON data.
  factory LocalizationConfig.fromJson(Map<String, dynamic> json) =>
      _$LocalizationConfigFromJson(json);

  /// The strict subset of languages that this app instance supports.
  /// The mobile client must ONLY render these options in the language picker.
  final List<SupportedLanguage> enabledLanguages;

  /// The primary fallback language if a user's device language isn't supported.
  final SupportedLanguage defaultLanguage;

  /// Converts this [LocalizationConfig] instance to JSON data.
  Map<String, dynamic> toJson() => _$LocalizationConfigToJson(this);

  @override
  List<Object> get props => [enabledLanguages, defaultLanguage];

  /// Creates a copy of this [LocalizationConfig] but with the given fields
  /// replaced with the new values.
  LocalizationConfig copyWith({
    List<SupportedLanguage>? supportedLanguages,
    SupportedLanguage? defaultLanguage,
  }) {
    return LocalizationConfig(
      enabledLanguages: supportedLanguages ?? this.enabledLanguages,
      defaultLanguage: defaultLanguage ?? this.defaultLanguage,
    );
  }
}
