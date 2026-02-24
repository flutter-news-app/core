import 'package:core/core.dart';
import 'package:core/src/utils/date_time_converter.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'remote_config.g.dart';

/// Represents the overall application configuration.
///
/// This model serves as a central container for various configuration settings
/// that can be fetched from a remote source.
///
/// There should typically be only one instance of this configuration,
/// identified by a fixed ID (e.g., 'app_config').
@JsonSerializable(explicitToJson: true, includeIfNull: true, checked: true)
class RemoteConfig extends Equatable {
  /// Creates a new [RemoteConfig] instance.
  const RemoteConfig({
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    required this.app,
    required this.features,
    required this.user,
  });

  /// Factory method to create an [RemoteConfig] instance from a JSON map.
  factory RemoteConfig.fromJson(Map<String, dynamic> json) =>
      _$RemoteConfigFromJson(json);

  /// The unique identifier for this configuration.
  final String id;

  /// Configuration for application-level settings (maintenance, updates, etc.).
  final AppConfig app;

  /// Configuration for all user-facing features (ads, feed, notifications).
  final FeaturesConfig features;

  /// Configuration for user-specific settings (role-based limits, etc.).
  final UserConfig user;

  /// The creation timestamp of the remote config.
  @DateTimeConverter()
  final DateTime createdAt;

  /// The last update timestamp of the remote config.
  @DateTimeConverter()
  final DateTime updatedAt;

  /// Converts this [RemoteConfig] instance to a JSON map.
  Map<String, dynamic> toJson() => _$RemoteConfigToJson(this);

  /// Creates a new [RemoteConfig] instance with specified changes.
  RemoteConfig copyWith({
    String? id,
    DateTime? createdAt,
    DateTime? updatedAt,
    AppConfig? app,
    FeaturesConfig? features,
    UserConfig? user,
  }) {
    return RemoteConfig(
      id: id ?? this.id,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      app: app ?? this.app,
      features: features ?? this.features,
      user: user ?? this.user,
    );
  }

  @override
  List<Object> get props => [id, createdAt, updatedAt, app, features, user];

  @override
  bool get stringify => true;
}
