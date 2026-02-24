import 'package:core/core.dart';
import 'package:core/src/utils/utils.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

part 'source.g.dart';

/// {@template source}
/// Source model
///
/// Represents a news source.
/// {@endtemplate}
@immutable
@JsonSerializable(explicitToJson: true, includeIfNull: true, checked: true)
class Source extends FeedItem {
  /// {@macro source}
  const Source({
    required this.id,
    required this.name,
    required this.description,
    required this.url,
    required this.sourceType,
    required this.language,
    required this.headquarters,
    required this.createdAt,
    required this.updatedAt,
    required this.status,
    this.logoUrl,
    this.mediaAssetId,
  }) : super(type: 'source');

  /// Factory method to create a [Source] instance from a JSON map.
  factory Source.fromJson(Map<String, dynamic> json) => _$SourceFromJson(json);

  /// Unique identifier for the source.
  final String id;

  /// The name of the source.
  /// This is required and should not be null.
  final Map<SupportedLanguage, String> name;

  /// A description of the source.
  final Map<SupportedLanguage, String> description;

  /// The URL of the source's homepage.
  final String url;

  /// The URL for the source's logo.
  /// This is nullable as it may be populated asynchronously by the backend
  /// after a media asset has been processed.
  @JsonKey(includeIfNull: false)
  final String? logoUrl;

  /// The type of the source (e.g., newsAgency, blog).
  /// If an unknown value is encountered during deserialization,
  /// this field will be set to null.

  final SourceType sourceType;

  /// The language of the source.
  final SupportedLanguage language;

  /// The country where the source is headquartered.
  final Country headquarters;

  /// The creation timestamp of the source.
  @DateTimeConverter()
  final DateTime createdAt;

  /// The last update timestamp of the source.
  @DateTimeConverter()
  final DateTime updatedAt;

  /// The current status of the source.
  /// Defaults to `active` if the field is not present in the JSON payload,
  /// ensuring backward compatibility.
  final ContentStatus status;

  /// The ID of the associated [MediaAsset]. This is used to link the source
  /// to a logo managed by the application's media system.
  @JsonKey(includeIfNull: false)
  final String? mediaAssetId;

  /// Converts this [Source] instance to a JSON map.
  Map<String, dynamic> toJson() {
    final json = _$SourceToJson(this);
    json['type'] = type;
    return json;
  }

  @override
  List<Object?> get props => [
    id,
    name,
    description,
    url,
    logoUrl,
    sourceType,
    language,
    headquarters,
    createdAt,
    updatedAt,
    status,
    mediaAssetId,
    type,
  ];

  /// Creates a new [Source] with updated properties.
  /// Use this to modify a [Source] without changing the original instance.
  Source copyWith({
    String? id,
    Map<SupportedLanguage, String>? name,
    Map<SupportedLanguage, String>? description,
    String? url,
    ValueWrapper<String?>? logoUrl,
    SourceType? sourceType,
    SupportedLanguage? language,
    Country? headquarters,
    DateTime? createdAt,
    DateTime? updatedAt,
    ContentStatus? status,
    ValueWrapper<String?>? mediaAssetId,
  }) {
    return Source(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      url: url ?? this.url,
      logoUrl: logoUrl != null ? logoUrl.value : this.logoUrl,
      mediaAssetId: mediaAssetId != null
          ? mediaAssetId.value
          : this.mediaAssetId,
      sourceType: sourceType ?? this.sourceType,
      language: language ?? this.language,
      headquarters: headquarters ?? this.headquarters,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      status: status ?? this.status,
    );
  }
}
