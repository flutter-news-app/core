import 'package:core/core.dart';
import 'package:core/src/utils/date_time_converter.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

part 'headline.g.dart';

/// {@template headline}
/// Headline model
///
/// Represents a news headline item.
/// {@endtemplate}
@immutable
@JsonSerializable(explicitToJson: true, includeIfNull: true, checked: true)
class Headline extends FeedItem {
  /// {@macro headline}
  const Headline({
    required this.id,
    required this.title,
    required this.url,
    required this.source,
    required this.topic,
    required this.createdAt,
    required this.updatedAt,
    required this.status,
    required this.isBreaking,
    this.mentionedCountries = const [],
    this.mentionedPersons = const [],
    this.imageUrl,
    this.mediaAssetId,
  }) : super(type: 'headline');

  /// Creates a [Headline] instance from a JSON map.
  factory Headline.fromJson(Map<String, dynamic> json) =>
      _$HeadlineFromJson(json);

  /// Unique identifier for the headline.
  final String id;

  /// Title of the headline.
  final Map<SupportedLanguage, String> title;

  /// URL to the full article or content.
  final String url;

  /// URL to an image associated with the headline.
  /// This is nullable as it may be populated asynchronously by the backend
  /// after a media asset has been processed.
  @JsonKey(includeIfNull: false)
  final String? imageUrl;

  /// Source or origin of the headline.
  final Source source;

  /// The internal timestamp recording when this headline was first ingested
  /// and saved into our system.
  @DateTimeConverter()
  final DateTime createdAt;

  /// The internal timestamp of the last update to this headline record in our
  /// system.
  @DateTimeConverter()
  final DateTime updatedAt;

  /// The current status of the headline.
  ///
  /// Defaults to `active` if the field is not present in the JSON payload,
  /// ensuring backward compatibility. This is suitable for ingested content.
  final ContentStatus status;

  /// A flag indicating whether this headline is considered "breaking news".
  ///
  /// This is editorially controlled and used to trigger immediate push
  /// notifications for users subscribed to `breakingOnly` alerts.
  final bool isBreaking;

  /// Topic of the current headline.
  final Topic topic;

  /// The ID of the associated [MediaAsset]. This is used to link the headline
  /// to an image managed by the application's media system.
  @JsonKey(includeIfNull: false)
  final String? mediaAssetId;

  /// A list of countries mentioned in the headline.
  final List<Country> mentionedCountries;

  /// A list of persons mentioned in the headline.
  final List<Person> mentionedPersons;

  /// Converts this [Headline] instance to a JSON map.
  Map<String, dynamic> toJson() {
    final json = _$HeadlineToJson(this);
    json['type'] = type;
    return json;
  }

  @override
  List<Object?> get props => [
    id,
    title,
    url,
    imageUrl,
    createdAt,
    updatedAt,
    status,
    source,
    topic,
    isBreaking,
    mediaAssetId,
    type,
    mentionedCountries,
    mentionedPersons,
  ];

  @override
  bool get stringify => true;

  /// Creates a new [Headline] with updated properties.
  /// Use this to modify a [Headline] without changing the original instance.
  Headline copyWith({
    String? id,
    Map<SupportedLanguage, String>? title,
    String? url,
    ValueWrapper<String?>? imageUrl,
    DateTime? createdAt,
    DateTime? updatedAt,
    ContentStatus? status,
    Source? source,
    Topic? topic,
    bool? isBreaking,
    ValueWrapper<String?>? mediaAssetId,
    List<Country>? mentionedCountries,
    List<Person>? mentionedPersons,
  }) {
    return Headline(
      id: id ?? this.id,
      title: title ?? this.title,
      url: url ?? this.url,
      imageUrl: imageUrl != null ? imageUrl.value : this.imageUrl,
      mediaAssetId: mediaAssetId != null
          ? mediaAssetId.value
          : this.mediaAssetId,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      status: status ?? this.status,
      source: source ?? this.source,
      topic: topic ?? this.topic,
      isBreaking: isBreaking ?? this.isBreaking,
      mentionedCountries: mentionedCountries ?? this.mentionedCountries,
      mentionedPersons: mentionedPersons ?? this.mentionedPersons,
    );
  }
}
