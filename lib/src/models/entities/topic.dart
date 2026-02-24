import 'package:core/core.dart';
import 'package:core/src/utils/date_time_converter.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

part 'topic.g.dart';

/// {@template topic}
/// Represents a news topic.
/// {@endtemplate}
@immutable
@JsonSerializable(explicitToJson: true, includeIfNull: true, checked: true)
class Topic extends FeedItem {
  /// {@macro topic}
  const Topic({
    required this.id,
    required this.name,
    required this.description,
    required this.createdAt,
    required this.updatedAt,
    required this.status,
    this.iconUrl,
    this.mediaAssetId,
  }) : super(type: 'topic');

  /// Creates a Topic instance from a JSON map.
  factory Topic.fromJson(Map<String, dynamic> json) => _$TopicFromJson(json);

  /// The unique identifier of the topic.
  final String id;

  /// The display name of the topic.
  @JsonKey(required: true)
  final Map<SupportedLanguage, String> name;

  /// The description for the topic.
  final Map<SupportedLanguage, String> description;

  /// The URL for an icon representing the topic.
  /// This is nullable as it may be populated asynchronously by the backend
  /// after a media asset has been processed.
  @JsonKey(includeIfNull: false)
  final String? iconUrl;

  /// The creation timestamp of the topic.
  @DateTimeConverter()
  final DateTime createdAt;

  /// The last update timestamp of the topic.
  @DateTimeConverter()
  final DateTime updatedAt;

  /// The current status of the topic.
  final ContentStatus status;

  /// The ID of the associated [MediaAsset]. This is used to link the topic
  /// to an icon managed by the application's media system.
  @JsonKey(includeIfNull: false)
  final String? mediaAssetId;

  /// Converts this Topic instance to a JSON map.
  Map<String, dynamic> toJson() {
    final json = _$TopicToJson(this);
    json['type'] = type;
    return json;
  }

  @override
  List<Object?> get props => [
    id,
    name,
    description,
    iconUrl,
    createdAt,
    updatedAt,
    status,
    mediaAssetId,
    type,
  ];

  @override
  bool get stringify => true;

  /// Creates a copy of this Topic but with the given fields replaced with
  /// the new values.
  Topic copyWith({
    String? id,
    Map<SupportedLanguage, String>? name,
    Map<SupportedLanguage, String>? description,
    ValueWrapper<String?>? iconUrl,
    DateTime? createdAt,
    DateTime? updatedAt,
    ContentStatus? status,
    ValueWrapper<String?>? mediaAssetId,
  }) {
    return Topic(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      iconUrl: iconUrl != null ? iconUrl.value : this.iconUrl,
      mediaAssetId: mediaAssetId != null
          ? mediaAssetId.value
          : this.mediaAssetId,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      status: status ?? this.status,
    );
  }
}
