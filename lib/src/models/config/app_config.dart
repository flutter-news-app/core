import 'package:core/src/models/config/general_app_config.dart';
import 'package:core/src/models/config/localization_config.dart';
import 'package:core/src/models/config/maintenance_config.dart';
import 'package:core/src/models/config/update_config.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

part 'app_config.g.dart';

/// {@template app_config}
/// A container for all application-level configurations.
/// {@endtemplate}
@immutable
@JsonSerializable(explicitToJson: true, includeIfNull: true, checked: true)
class AppConfig extends Equatable {
  /// {@macro app_config}
  const AppConfig({
    required this.maintenance,
    required this.update,
    required this.general,
    required this.localization,
  });

  /// Creates an [AppConfig] from JSON data.
  factory AppConfig.fromJson(Map<String, dynamic> json) =>
      _$AppConfigFromJson(json);

  /// Configuration for maintenance mode.
  final MaintenanceConfig maintenance;

  /// Configuration for application updates.
  final UpdateConfig update;

  /// General application settings.
  final GeneralAppConfig general;

  /// Configuration for language support and fallback policies.
  final LocalizationConfig localization;

  /// Converts this [AppConfig] instance to JSON data.
  Map<String, dynamic> toJson() => _$AppConfigToJson(this);

  @override
  List<Object> get props => [maintenance, update, general, localization];

  /// Creates a copy of this [AppConfig] but with the given fields
  /// replaced with the new values.
  AppConfig copyWith({
    MaintenanceConfig? maintenance,
    UpdateConfig? update,
    GeneralAppConfig? general,
    LocalizationConfig? localization,
  }) {
    return AppConfig(
      maintenance: maintenance ?? this.maintenance,
      update: update ?? this.update,
      general: general ?? this.general,
      localization: localization ?? this.localization,
    );
  }
}
