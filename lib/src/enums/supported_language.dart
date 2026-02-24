import 'package:core/core.dart' show LocalizationConfig;
import 'package:json_annotation/json_annotation.dart';

/// {@template supported_language}
/// Defines the **technical capability** of the system to handle specific languages.
///
/// This enum represents the superset of all languages the codebase is engineered
/// to support (e.g., for parsing, formatting, or database storage).
///
/// **Architecture Note: Capability vs. Policy**
/// This enum defines *what is possible*. To determine *what is active* for a
/// specific deployment (e.g., "Only English and Spanish are enabled"), refer
/// to the [LocalizationConfig.enabledLanguages] property in the Remote Config.
///
/// This separation allows the system to support many languages (Capability)
/// while restricting specific app instances to a subset (Policy).
/// {@endtemplate}
@JsonEnum()
enum SupportedLanguage {
  /// English.
  en,

  /// Spanish.
  es,

  /// French.
  fr,

  /// Arabic.
  ar,

  /// Portuguese.
  pt,

  /// German.
  de,

  /// Italian.
  it,

  /// Mandarin Chinese.
  zh,

  /// Hindi.
  hi,

  /// Japanese.
  ja,
}
