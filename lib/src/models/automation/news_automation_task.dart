import 'package:core/core.dart';
import 'package:core/src/utils/utils.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

part 'news_automation_task.g.dart';

/// {@template news_automation_task}
/// Defines a scheduled task for automated news fetching for a specific source.
///
/// This model is a pure scheduling trigger. It links an internal [Source] to
/// a fetch schedule. The actual mapping to external provider identifiers
/// perform the fetch is determined by the API's environment configuration.
/// {@endtemplate}
@immutable
@JsonSerializable(explicitToJson: true, includeIfNull: true, checked: true)
class NewsAutomationTask extends Equatable {
  /// {@macro news_automation_task}
  const NewsAutomationTask({
    required this.id,
    required this.sourceId,
    required this.fetchInterval,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
    this.lastRunAt,
    this.nextRunAt,
    this.failureCount = 0,
    this.lastErrorMessage,
  });

  /// Creates a [NewsAutomationTask] from JSON data.
  factory NewsAutomationTask.fromJson(Map<String, dynamic> json) =>
      _$NewsAutomationTaskFromJson(json);

  /// The unique identifier for this task.
  final String id;

  /// The mandatory ID of the internal [Source] this task belongs to.
  final String sourceId;

  /// The frequency at which the API should execute this task.
  final FetchInterval fetchInterval;

  /// The current operational status of the task.
  final IngestionStatus status;

  /// The timestamp of the last attempted run.
  @NullableDateTimeConverter()
  final DateTime? lastRunAt;

  /// The calculated timestamp for the next scheduled run.
  @NullableDateTimeConverter()
  final DateTime? nextRunAt;

  /// The number of consecutive failures for circuit breaking.
  final int failureCount;

  /// The error message from the last failed run.
  final String? lastErrorMessage;

  /// The timestamp when this task was created.
  @DateTimeConverter()
  final DateTime createdAt;

  /// The timestamp when this task was last updated.
  @DateTimeConverter()
  final DateTime updatedAt;

  /// Converts this [NewsAutomationTask] instance to JSON data.
  Map<String, dynamic> toJson() => _$NewsAutomationTaskToJson(this);

  @override
  List<Object?> get props => [
    id,
    sourceId,
    fetchInterval,
    status,
    lastRunAt,
    nextRunAt,
    failureCount,
    lastErrorMessage,
    createdAt,
    updatedAt,
  ];

  /// Creates a copy of this [NewsAutomationTask] with updated values.
  NewsAutomationTask copyWith({
    String? id,
    String? sourceId,
    FetchInterval? fetchInterval,
    IngestionStatus? status,
    ValueWrapper<DateTime?>? lastRunAt,
    ValueWrapper<DateTime?>? nextRunAt,
    int? failureCount,
    ValueWrapper<String?>? lastErrorMessage,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return NewsAutomationTask(
      id: id ?? this.id,
      sourceId: sourceId ?? this.sourceId,
      fetchInterval: fetchInterval ?? this.fetchInterval,
      status: status ?? this.status,
      lastRunAt: lastRunAt != null ? lastRunAt.value : this.lastRunAt,
      nextRunAt: nextRunAt != null ? nextRunAt.value : this.nextRunAt,
      failureCount: failureCount ?? this.failureCount,
      lastErrorMessage: lastErrorMessage != null
          ? lastErrorMessage.value
          : this.lastErrorMessage,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}
