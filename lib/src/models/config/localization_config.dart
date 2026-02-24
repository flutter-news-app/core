import 'package:core/src/enums/supported_language.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

part 'localization_config.g.dart';

/// {@template localization_config}
/// Defines the **active language policy** for this specific application instance.
///
/// While the [SupportedLanguage] enum defines the total technical capabilities
/// of the codebase, this configuration acts as a **policy filter**, determining
/// which of those languages are actually exposed to the end-user.
///
/// This allows for "white-label" or multi-tenant deployments where different
/// apps share the same core code but support different languages.
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

  /// The strict subset of `SupportedLanguage` capabilities that are enabled
  /// for this deployment.
  ///
  /// **Client Logic:** The mobile app must intersect `SupportedLanguage.values`
  /// with this list. Only languages present in this list should be rendered
  /// in the settings language picker.
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
      enabledLanguages: supportedLanguages ?? enabledLanguages,
      defaultLanguage: defaultLanguage ?? this.defaultLanguage,
    );
  }
}
