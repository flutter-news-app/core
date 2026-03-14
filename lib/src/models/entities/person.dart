import 'package:core/core.dart';
import 'package:core/src/utils/date_time_converter.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

part 'person.g.dart';

/// {@template person}
/// Represents a person of interest mentioned in news articles.
/// {@endtemplate}
@immutable
@JsonSerializable(explicitToJson: true, includeIfNull: true, checked: true)
class Person extends FeedItem {
  /// {@macro person}
  const Person({
    required this.id,
    required this.name,
    required this.description,
    required this.createdAt,
    required this.updatedAt,
    required this.status,
    this.imageUrl,
    this.mediaAssetId,
  }) : super(type: 'person');

  /// Creates a [Person] instance from a JSON map.
  factory Person.fromJson(Map<String, dynamic> json) => _$PersonFromJson(json);

  /// The unique identifier of the person.
  final String id;

  /// The name of the person.
  final Map<SupportedLanguage, String> name;

  /// A short biography or description of the person.
  final Map<SupportedLanguage, String> description;

  /// The internal timestamp recording when this person was first ingested.
  @DateTimeConverter()
  final DateTime createdAt;

  /// The internal timestamp of the last update to this person record.
  @DateTimeConverter()
  final DateTime updatedAt;

  /// The current lifecycle status of the person.
  /// Defaults to `active`.
  final ContentStatus status;

  /// The URL for a photo of the person.
  @JsonKey(includeIfNull: false)
  final String? imageUrl;

  /// The ID of the associated [MediaAsset].
  @JsonKey(includeIfNull: false)
  final String? mediaAssetId;

  /// Converts this [Person] instance to a JSON map.
  Map<String, dynamic> toJson() {
    final json = _$PersonToJson(this);
    json['type'] = type;
    return json;
  }

  @override
  List<Object?> get props => [
    id,
    name,
    description,
    createdAt,
    updatedAt,
    status,
    imageUrl,
    mediaAssetId,
    type,
  ];

  /// Creates a copy of this [Person] with updated properties.
  Person copyWith({
    String? id,
    Map<SupportedLanguage, String>? name,
    Map<SupportedLanguage, String>? description,
    DateTime? createdAt,
    DateTime? updatedAt,
    ContentStatus? status,
    ValueWrapper<String?>? imageUrl,
    ValueWrapper<String?>? mediaAssetId,
  }) {
    return Person(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      status: status ?? this.status,
      imageUrl: imageUrl != null ? imageUrl.value : this.imageUrl,
      mediaAssetId: mediaAssetId != null
          ? mediaAssetId.value
          : this.mediaAssetId,
    );
  }
}
