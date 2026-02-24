import 'package:core/src/enums/content_language.dart';
import 'package:core/src/enums/kpi_card_id.dart';
import 'package:core/src/enums/kpi_time_frame.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

part 'kpi_card_data.g.dart';

/// {@template kpi_time_frame_data}
/// A value object holding the calculated metric and trend for a single time
/// frame of a KPI card.
/// {@endtemplate}
@immutable
@JsonSerializable(explicitToJson: true, includeIfNull: true, checked: true)
class KpiTimeFrameData extends Equatable {
  /// {@macro kpi_time_frame_data}
  const KpiTimeFrameData({required this.value, required this.trend});

  /// Creates a [KpiTimeFrameData] from JSON data.
  factory KpiTimeFrameData.fromJson(Map<String, dynamic> json) =>
      _$KpiTimeFrameDataFromJson(json);

  /// The calculated value of the metric for this time frame.
  final num value;

  /// A string representing the trend compared to the previous period
  /// (e.g., '+5.2%', '-200').
  final String trend;

  /// Converts this [KpiTimeFrameData] instance to JSON data.
  Map<String, dynamic> toJson() => _$KpiTimeFrameDataToJson(this);

  /// Creates a copy of this [KpiTimeFrameData] with the given fields
  /// replaced with the new values.
  KpiTimeFrameData copyWith({num? value, String? trend}) {
    return KpiTimeFrameData(
      value: value ?? this.value,
      trend: trend ?? this.trend,
    );
  }

  @override
  List<Object> get props => [value, trend];
}

/// {@template kpi_card_data}
/// A comprehensive data model for a single KPI card on the dashboard.
///
/// This object is designed to be sent from the backend in one piece,
/// containing all the necessary data for the UI to render the card and handle
/// interactive time frame switching without additional network requests.
/// {@endtemplate}
@immutable
@JsonSerializable(explicitToJson: true, includeIfNull: true, checked: true)
class KpiCardData extends Equatable {
  /// {@macro kpi_card_data}
  const KpiCardData({
    required this.id,
    required this.cardId,
    required this.label,
    required this.timeFrames,
  });

  /// Creates a [KpiCardData] from JSON data.
  factory KpiCardData.fromJson(Map<String, dynamic> json) =>
      _$KpiCardDataFromJson(json);

  /// The unique identifier for the document, typically a MongoDB ObjectId.
  final String id;

  /// The logical, type-safe identifier for this KPI card.
  final KpiCardId cardId;

  /// The display label for the card (e.g., 'Total Views').
  final Map<ContentLanguage, String> label;

  /// A map containing the pre-calculated data for each supported time frame.
  ///
  /// The key is the [KpiTimeFrame] (e.g., `day`, `week`), and the value is the
  /// corresponding [KpiTimeFrameData].
  final Map<KpiTimeFrame, KpiTimeFrameData> timeFrames;

  /// Converts this [KpiCardData] instance to JSON data.
  Map<String, dynamic> toJson() => _$KpiCardDataToJson(this);

  /// Creates a copy of this [KpiCardData] with the given fields
  /// replaced with the new values.
  KpiCardData copyWith({
    String? id,
    KpiCardId? cardId,
    Map<ContentLanguage, String>? label,
    Map<KpiTimeFrame, KpiTimeFrameData>? timeFrames,
  }) {
    return KpiCardData(
      id: id ?? this.id,
      cardId: cardId ?? this.cardId,
      label: label ?? this.label,
      timeFrames: timeFrames ?? this.timeFrames,
    );
  }

  @override
  List<Object> get props => [id, cardId, label, timeFrames];
}
