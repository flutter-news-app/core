import 'package:core/src/enums/enums.dart';
import 'package:core/src/models/user_preferences/headline_filter_criteria.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

part 'saved_headline_filter.g.dart';

/// {@template saved_headline_filter}
/// Represents a user's saved set of content criteria, unifying the concepts
/// of a saved "Feed Filter" for on-demand feed filtering and a "Notification
/// Subscription" for push alerts.
///
/// A Saved Headline Filter is a single entity that can be used for multiple
/// purposes, determined by the `isPinned` flag and the `deliveryTypes` set.
/// {@endtemplate}
@immutable
@JsonSerializable(explicitToJson: true, includeIfNull: true, checked: true)
class SavedHeadlineFilter extends Equatable {
  /// {@macro saved_headline_filter}
  const SavedHeadlineFilter({
    required this.id,
    required this.userId,
    required this.name,
    required this.criteria,
    required this.isPinned,
    required this.deliveryTypes,
  });

  /// Creates a [SavedHeadlineFilter] from JSON data.
  factory SavedHeadlineFilter.fromJson(Map<String, dynamic> json) =>
      _$SavedHeadlineFilterFromJson(json);

  /// The unique identifier for the saved filter.
  final String id;

  /// The ID of the user who owns this filter.
  final String userId;

  /// The user-provided name for this filter (e.g., "US Tech News").
  final Map<ContentLanguage, String> name;

  /// The filtering criteria for this filter, containing lists of full
  /// Topic, Source, and Country objects.
  final HeadlineFilterCriteria criteria;

  /// A flag indicating whether this filter should be available as a
  /// one-click pinned filter in the user's feed.
  final bool isPinned;

  /// The set of notification delivery types the user has opted into for this
  /// filter (e.g., `breakingOnly`, `dailyDigest`).
  ///
  /// An empty set means the user will not receive any push notifications for
  /// news matching this filter.
  final Set<PushNotificationSubscriptionDeliveryType> deliveryTypes;

  /// Converts this [SavedHeadlineFilter] instance to JSON data.
  Map<String, dynamic> toJson() => _$SavedHeadlineFilterToJson(this);

  @override
  List<Object> get props => [
    id,
    userId,
    name,
    criteria,
    isPinned,
    deliveryTypes,
  ];

  /// Creates a copy of this [SavedHeadlineFilter] but with the given fields
  /// with the new values.
  SavedHeadlineFilter copyWith({
    String? id,
    String? userId,
    Map<ContentLanguage, String>? name,
    HeadlineFilterCriteria? criteria,
    bool? isPinned,
    Set<PushNotificationSubscriptionDeliveryType>? deliveryTypes,
  }) {
    return SavedHeadlineFilter(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      name: name ?? this.name,
      criteria: criteria ?? this.criteria,
      isPinned: isPinned ?? this.isPinned,
      deliveryTypes: deliveryTypes ?? this.deliveryTypes,
    );
  }
}
