import 'package:core/src/enums/content_language.dart';
import 'package:core/src/enums/ranked_list_card_id.dart';
import 'package:core/src/enums/ranked_list_time_frame.dart';
import 'package:core/src/models/analytics/dashboard/ranked_list_item.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

part 'ranked_list_card_data.g.dart';

/// {@template ranked_list_card_data}
/// A comprehensive data model for a single "Top N" ranked list card, intended
/// for the main dashboard overview page.
///
/// This object is designed to be sent from the backend in one piece,
/// containing all the necessary data for the UI to render the list and handle
/// interactive time frame switching without additional network requests.
/// {@endtemplate}
@immutable
@JsonSerializable(explicitToJson: true, includeIfNull: true, checked: true)
class RankedListCardData extends Equatable {
  /// {@macro ranked_list_card_data}
  const RankedListCardData({
    required this.id,
    required this.cardId,
    required this.label,
    required this.timeFrames,
  });

  /// Creates a [RankedListCardData] from JSON data.
  factory RankedListCardData.fromJson(Map<String, dynamic> json) =>
      _$RankedListCardDataFromJson(json);

  /// The unique identifier for the document, typically a MongoDB ObjectId.
  final String id;

  /// The logical, type-safe identifier for this ranked list card.
  final RankedListCardId cardId;

  /// The display label for the card (e.g., 'Most Viewed Headlines').
  final Map<ContentLanguage, String> label;

  /// A map containing the pre-calculated ranked list for each supported
  /// time frame.
  ///
  /// The key is the [RankedListTimeFrame], and the value is the list of
  /// [RankedListItem]s for that period.
  final Map<RankedListTimeFrame, List<RankedListItem>> timeFrames;

  /// Converts this [RankedListCardData] instance to JSON data.
  Map<String, dynamic> toJson() => _$RankedListCardDataToJson(this);

  /// Creates a copy of this [RankedListCardData] with the given fields
  /// replaced with the new values.
  RankedListCardData copyWith({
    String? id,
    RankedListCardId? cardId,
    Map<ContentLanguage, String>? label,
    Map<RankedListTimeFrame, List<RankedListItem>>? timeFrames,
  }) {
    return RankedListCardData(
      id: id ?? this.id,
      cardId: cardId ?? this.cardId,
      label: label ?? this.label,
      timeFrames: timeFrames ?? this.timeFrames,
    );
  }

  @override
  List<Object> get props => [id, cardId, label, timeFrames];
}
