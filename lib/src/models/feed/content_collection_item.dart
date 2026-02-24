import 'package:core/src/enums/feed_decorator_type.dart';
import 'package:core/src/enums/supported_language.dart';
import 'package:core/src/models/feed/feed_item.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

part 'content_collection_item.g.dart';

/// {@template content_collection_item}
/// A feed item representing a horizontally scrollable list of other feed items.
///
/// This is used for decorators like suggesting topics or sources to follow.
/// The generic type [T] must be a subtype of [FeedItem].
/// {@endtemplate}
@immutable
@JsonSerializable(
  genericArgumentFactories: true,
  explicitToJson: true,
  includeIfNull: true,
  checked: true,
)
class ContentCollectionItem<T extends FeedItem> extends FeedItem {
  /// {@macro content_collection_item}
  ContentCollectionItem({
    required this.id,
    required this.decoratorType,
    required this.title,
    required this.items,
  }) : assert(items.isNotEmpty, 'items cannot be empty'),
       super(type: 'contentCollection');

  /// Factory method to create a [ContentCollectionItem] instance from a JSON map.
  factory ContentCollectionItem.fromJson(
    Map<String, dynamic> json,
    T Function(Object? json) fromJsonT,
  ) => _$ContentCollectionItemFromJson(json, fromJsonT);

  /// Unique identifier for the item.
  final String id;

  /// The specific type of decorator this item represents.
  final FeedDecoratorType decoratorType;

  /// The title to display above the collection.
  final Map<SupportedLanguage, String> title;

  /// The list of items to display in the collection.
  final List<T> items;

  Map<String, dynamic> toJson(Object? Function(T value) toJsonT) {
    final json = _$ContentCollectionItemToJson(this, toJsonT);
    json['type'] = type;
    json['contentType'] = items.first.type;
    return json;
  }

  @override
  List<Object?> get props => [id, decoratorType, title, items, type];
}
