import 'package:core/src/enums/chart_card_id.dart';
import 'package:core/src/enums/chart_time_frame.dart';
import 'package:core/src/enums/chart_type.dart';
import 'package:core/src/enums/supported_language.dart';
import 'package:core/src/models/analytics/dashboard/data_point.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

part 'chart_card_data.g.dart';

/// {@template chart_card_data}
/// A comprehensive data model for a single chart card on the dashboard.
///
/// This object is designed to be sent from the backend in one piece,
/// containing all the necessary data for the UI to render the chart and handle
/// interactive time frame switching without additional network requests.
/// {@endtemplate}
@immutable
@JsonSerializable(explicitToJson: true, includeIfNull: true, checked: true)
class ChartCardData extends Equatable {
  /// {@macro chart_card_data}
  const ChartCardData({
    required this.id,
    required this.cardId,
    required this.label,
    required this.type,
    required this.timeFrames,
  });

  /// Creates a [ChartCardData] from JSON data.
  factory ChartCardData.fromJson(Map<String, dynamic> json) =>
      _$ChartCardDataFromJson(json);

  /// The unique identifier for the document, typically a MongoDB ObjectId.
  final String id;

  /// The logical, type-safe identifier for this chart card.
  final ChartCardId cardId;

  /// The display label for the card (e.g., 'Views Over Time').
  final Map<SupportedLanguage, String> label;

  /// The type of chart to render (e.g., `line`, `bar`).
  final ChartType type;

  /// A map containing the pre-calculated time-series data for each supported
  /// time frame.
  ///
  /// The key is the [ChartTimeFrame], and the value is the list of [DataPoint]s
  /// for that period.
  final Map<ChartTimeFrame, List<DataPoint>> timeFrames;

  /// Converts this [ChartCardData] instance to JSON data.
  Map<String, dynamic> toJson() => _$ChartCardDataToJson(this);

  /// Creates a copy of this [ChartCardData] with the given fields
  /// replaced with the new values.
  ChartCardData copyWith({
    String? id,
    ChartCardId? cardId,
    Map<SupportedLanguage, String>? label,
    ChartType? type,
    Map<ChartTimeFrame, List<DataPoint>>? timeFrames,
  }) {
    return ChartCardData(
      id: id ?? this.id,
      cardId: cardId ?? this.cardId,
      label: label ?? this.label,
      type: type ?? this.type,
      timeFrames: timeFrames ?? this.timeFrames,
    );
  }

  @override
  List<Object> get props => [id, cardId, label, type, timeFrames];
}
