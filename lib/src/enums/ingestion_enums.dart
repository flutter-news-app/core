import 'package:core/src/models/automation/news_automation_task.dart';
import 'package:json_annotation/json_annotation.dart';

/// {@template fetch_interval}
/// Defines the frequency at which a subscription should be processed.
/// {@endtemplate}
@JsonEnum()
enum FetchInterval {
  /// Every 15 minutes.
  every15Minutes,

  /// Every 30 minutes.
  every30Minutes,

  /// Every 1 hour.
  hourly,

  /// Every 6 hours.
  everySixHours,

  /// Once per day.
  daily,
}

/// {@template ingestion_status}
/// Represents the operational state of a [NewsAutomationTask].
/// {@endtemplate}
@JsonEnum()
enum IngestionStatus {
  /// The subscription is active and will be processed by the scheduler.
  active,

  /// The subscription is manually paused.
  paused,

  /// The subscription has failed repeatedly and is disabled.
  error,
}
