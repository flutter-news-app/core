import 'package:core/core.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

part 'user_limits_config.g.dart';

/// {@template user_limits_config}
/// Defines role-based quantitative limits for user actions and preferences.
///
/// This model uses a map-based structure where the key is the
/// [AccessTier] and the value is the specific limit for that tier.
/// This allows for granular control over limits based on the user's entitlement.
/// {@endtemplate}
@immutable
@JsonSerializable(explicitToJson: true, includeIfNull: true, checked: true)
class UserLimitsConfig extends Equatable {
  /// {@macro user_limits_config}
  const UserLimitsConfig({
    required this.followedItems,
    required this.savedHeadlines,
    required this.savedHeadlineFilters,
    required this.reactionsPerDay,
    required this.commentsPerDay,
    required this.reportsPerDay,
  });

  /// Creates a [UserLimitsConfig] from JSON data.
  factory UserLimitsConfig.fromJson(Map<String, dynamic> json) =>
      _$UserLimitsConfigFromJson(json);

  /// Tier-based limits for the number of followed items (topics, sources,
  /// countries, persons). The limit applies to each category individually.
  final Map<AccessTier, int> followedItems;

  /// Tier-based limits for the number of saved headlines.
  final Map<AccessTier, int> savedHeadlines;

  /// Tier-based limits for saved headline filters, using the
  /// [SavedFilterLimits] model to define total, pinned, and notification
  /// subscription counts.
  final Map<AccessTier, SavedFilterLimits> savedHeadlineFilters;

  /// Tier-based limits for the number of reactions a user can perform per day.
  final Map<AccessTier, int> reactionsPerDay;

  /// Tier-based limits for the number of comments a user can post per day.
  ///
  /// This limit applies specifically to the creation of new comments and does
  /// not include other interactions like reactions.
  final Map<AccessTier, int> commentsPerDay;

  /// Tier-based limits for the number of reports a user can submit per day.
  final Map<AccessTier, int> reportsPerDay;

  /// Converts this [UserLimitsConfig] instance to JSON data.
  Map<String, dynamic> toJson() => _$UserLimitsConfigToJson(this);

  @override
  List<Object> get props => [
    followedItems,
    savedHeadlines,
    savedHeadlineFilters,
    reactionsPerDay,
    commentsPerDay,
    reportsPerDay,
  ];

  /// Creates a copy of this [UserLimitsConfig] but with the given fields
  /// replaced with the new values.
  UserLimitsConfig copyWith({
    Map<AccessTier, int>? followedItems,
    Map<AccessTier, int>? savedHeadlines,
    Map<AccessTier, SavedFilterLimits>? savedHeadlineFilters,
    Map<AccessTier, int>? commentsPerDay,
    Map<AccessTier, int>? reportsPerDay,
    Map<AccessTier, int>? reactionsPerDay,
  }) {
    return UserLimitsConfig(
      followedItems: followedItems ?? this.followedItems,
      savedHeadlines: savedHeadlines ?? this.savedHeadlines,
      savedHeadlineFilters: savedHeadlineFilters ?? this.savedHeadlineFilters,
      commentsPerDay: commentsPerDay ?? this.commentsPerDay,
      reportsPerDay: reportsPerDay ?? this.reportsPerDay,
      reactionsPerDay: reactionsPerDay ?? this.reactionsPerDay,
    );
  }
}
