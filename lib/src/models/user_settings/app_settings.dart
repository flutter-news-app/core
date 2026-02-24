import 'package:core/core.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

part 'app_settings.g.dart';

/// {@template app_settings}
/// Represents a collection of user-specific application settings,
/// including display preferences, language selection, and feed display options.
///
/// This model unifies settings that are tied to a specific user,
/// making it suitable for management via a generic data client.
/// {@endtemplate}
@immutable
@JsonSerializable(explicitToJson: true, includeIfNull: true, checked: true)
class AppSettings extends Equatable {
  /// {@macro app_settings}
  ///
  /// Creates a new instance of [AppSettings].
  ///
  /// An [id] is required, typically the user's unique identifier.
  /// Provides sensible defaults for nested settings if not specified.
  const AppSettings({
    required this.id,
    required this.language,
    required this.displaySettings,
    required this.feedSettings,
  });

  /// Factory method to create a [AppSettings] instance from a JSON map.
  factory AppSettings.fromJson(Map<String, dynamic> json) =>
      _$AppSettingsFromJson(json);

  /// The unique identifier for the user settings, typically the user's ID.
  final String id;

  /// The selected application language.
  final SupportedLanguage language;

  /// User-configurable settings related to the application's visual appearance.
  final DisplaySettings displaySettings;

  /// User-configurable settings for how content feeds are displayed.
  final FeedSettings feedSettings;

  /// Converts this [AppSettings] instance to a JSON map.
  Map<String, dynamic> toJson() => _$AppSettingsToJson(this);

  @override
  List<Object?> get props => [id, displaySettings, language, feedSettings];

  /// Creates a copy of this [AppSettings] but with the given fields
  /// replaced with the new values.
  AppSettings copyWith({
    String? id,
    SupportedLanguage? language,
    DisplaySettings? displaySettings,
    FeedSettings? feedSettings,
  }) {
    return AppSettings(
      id: id ?? this.id,
      language: language ?? this.language,
      displaySettings: displaySettings ?? this.displaySettings,
      feedSettings: feedSettings ?? this.feedSettings,
    );
  }
}
