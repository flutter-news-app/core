import 'package:json_annotation/json_annotation.dart';

/// Enum representing the lifecycle status of a content entity.
@JsonEnum()
enum ContentStatus {
  /// The entity is active and visible.
  /// This is the standard for all live content.
  @JsonValue('active')
  active,

  /// The entity is a draft and not yet published.
  @JsonValue('draft')
  draft,

  /// The entity has been archived and is not visible in normal queries.
  @JsonValue('archived')
  archived,

  /// The entity has been newly ingested and is awaiting AI enrichment.
  @JsonValue('ingested')
  ingested,
}
