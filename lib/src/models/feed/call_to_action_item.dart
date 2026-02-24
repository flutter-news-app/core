import 'package:core/src/enums/feed_decorator_type.dart';
import 'package:core/src/enums/supported_language.dart';
import 'package:core/src/models/feed/feed_item.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

part 'call_to_action_item.g.dart';

/// {@template call_to_action_item}
/// A feed item representing a single, actionable card.
///
/// This is used for decorators like linking an account, rating the app, or
/// upgrading a subscription.
/// {@endtemplate}
@immutable
@JsonSerializable(explicitToJson: true, includeIfNull: true, checked: true)
class CallToActionItem extends FeedItem {
  /// {@macro call_to_action_item}
  const CallToActionItem({
    required this.id,
    required this.decoratorType,
    required this.title,
    required this.description,
    required this.callToActionText,
    required this.callToActionUrl,
  }) : super(type: 'callToAction');

  /// Factory method to create a [CallToActionItem] instance from a JSON map.
  factory CallToActionItem.fromJson(Map<String, dynamic> json) =>
      _$CallToActionItemFromJson(json);

  /// Unique identifier for the item.
  final String id;

  /// The specific type of decorator this item represents.
  final FeedDecoratorType decoratorType;

  /// The main title or heading for the call-to-action.
  final Map<SupportedLanguage, String> title;

  /// A description providing more details.
  final Map<SupportedLanguage, String> description;

  /// The text for the call-to-action button or link.
  final Map<SupportedLanguage, String> callToActionText;

  /// The URL to navigate to when the call-to-action is triggered.
  final String callToActionUrl;

  Map<String, dynamic> toJson() {
    final json = _$CallToActionItemToJson(this);
    json['type'] = type;
    return json;
  }

  @override
  List<Object?> get props => [
    id,
    decoratorType,
    title,
    description,
    callToActionText,
    callToActionUrl,
    type,
  ];
}
