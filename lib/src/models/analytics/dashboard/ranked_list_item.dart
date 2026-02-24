import 'package:core/src/enums/content_language.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

part 'ranked_list_item.g.dart';

/// {@template ranked_list_item}
/// Represents a single item within a ranked list on the dashboard.
///
/// For example, an entry in "Top 5 Most Viewed Headlines".
/// {@endtemplate}
@immutable
@JsonSerializable(explicitToJson: true, includeIfNull: true, checked: true)
class RankedListItem extends Equatable {
  /// {@macro ranked_list_item}
  const RankedListItem({
    required this.entityId,
    required this.displayTitle,
    required this.metricValue,
  });

  /// Creates a [RankedListItem] from JSON data.
  factory RankedListItem.fromJson(Map<String, dynamic> json) =>
      _$RankedListItemFromJson(json);

  /// The unique ID of the entity being ranked (e.g., a headline ID).
  final String entityId;

  /// The title or name to display for the item.
  final Map<ContentLanguage, String> displayTitle;

  /// The numeric value of the metric used for ranking (e.g., view count).
  final num metricValue;

  /// Converts this [RankedListItem] instance to JSON data.
  Map<String, dynamic> toJson() => _$RankedListItemToJson(this);

  /// Creates a copy of this [RankedListItem] with the given fields
  /// replaced with the new values.
  RankedListItem copyWith({
    String? entityId,
    Map<ContentLanguage, String>? displayTitle,
    num? metricValue,
  }) {
    return RankedListItem(
      entityId: entityId ?? this.entityId,
      displayTitle: displayTitle ?? this.displayTitle,
      metricValue: metricValue ?? this.metricValue,
    );
  }

  @override
  List<Object> get props => [entityId, displayTitle, metricValue];
}
