import 'package:core/src/enums/content_type.dart';
import 'package:core/src/enums/push_notification_subscription_delivery_type.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

part 'push_notification_payload.g.dart';

/// {@template push_notification_payload}
/// Represents the generic structure of a push notification message.
///
/// This model defines the content of a notification, such as its title and
/// image, and includes a flexible `data` map for custom payloads, typically
/// used for deep-linking or passing additional information to the client app.
/// {@endtemplate}
@immutable
@JsonSerializable(explicitToJson: true, includeIfNull: true, checked: true)
class PushNotificationPayload extends Equatable {
  /// {@macro push_notification_payload}
  const PushNotificationPayload({
    required this.title,
    required this.notificationId,
    required this.notificationType,
    required this.contentType,
    required this.contentId,
    this.imageUrl,
  });

  /// Creates a [PushNotificationPayload] from JSON data.
  factory PushNotificationPayload.fromJson(Map<String, dynamic> json) =>
      _$PushNotificationPayloadFromJson(json);

  /// The title of the notification.
  final String title;

  /// The unique identifier of the notification.
  final String notificationId;

  /// The type of notification, which determines its delivery characteristics.
  final PushNotificationSubscriptionDeliveryType notificationType;

  /// The type of content the notification is related to (e.g., headline, topic).
  final ContentType contentType;

  /// The unique identifier of the content associated with the notification.
  final String contentId;

  /// An optional URL for an image to be displayed in the notification.
  final String? imageUrl;

  /// Converts this [PushNotificationPayload] instance to JSON data.
  Map<String, dynamic> toJson() => _$PushNotificationPayloadToJson(this);

  @override
  List<Object?> get props => [
    title,
    notificationId,
    notificationType,
    contentType,
    contentId,
    imageUrl,
  ];

  /// Creates a copy of this [PushNotificationPayload] but with the given fields
  /// replaced with the new values.
  PushNotificationPayload copyWith({
    String? title,
    String? notificationId,
    PushNotificationSubscriptionDeliveryType? notificationType,
    ContentType? contentType,
    String? contentId,
    String? imageUrl,
  }) {
    return PushNotificationPayload(
      title: title ?? this.title,
      notificationId: notificationId ?? this.notificationId,
      notificationType: notificationType ?? this.notificationType,
      contentType: contentType ?? this.contentType,
      contentId: contentId ?? this.contentId,
      imageUrl: imageUrl ?? this.imageUrl,
    );
  }
}
