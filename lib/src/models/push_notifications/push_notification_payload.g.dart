// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'push_notification_payload.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PushNotificationPayload _$PushNotificationPayloadFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('PushNotificationPayload', json, ($checkedConvert) {
  final val = PushNotificationPayload(
    title: $checkedConvert('title', (v) => v as String),
    notificationId: $checkedConvert('notificationId', (v) => v as String),
    notificationType: $checkedConvert(
      'notificationType',
      (v) => $enumDecode(_$PushNotificationSubscriptionDeliveryTypeEnumMap, v),
    ),
    contentType: $checkedConvert(
      'contentType',
      (v) => $enumDecode(_$ContentTypeEnumMap, v),
    ),
    contentId: $checkedConvert('contentId', (v) => v as String),
    imageUrl: $checkedConvert('imageUrl', (v) => v as String?),
  );
  return val;
});

Map<String, dynamic> _$PushNotificationPayloadToJson(
  PushNotificationPayload instance,
) => <String, dynamic>{
  'title': instance.title,
  'notificationId': instance.notificationId,
  'notificationType':
      _$PushNotificationSubscriptionDeliveryTypeEnumMap[instance
          .notificationType]!,
  'contentType': _$ContentTypeEnumMap[instance.contentType]!,
  'contentId': instance.contentId,
  'imageUrl': instance.imageUrl,
};

const _$PushNotificationSubscriptionDeliveryTypeEnumMap = {
  PushNotificationSubscriptionDeliveryType.breakingOnly: 'breakingOnly',
};

const _$ContentTypeEnumMap = {
  ContentType.headline: 'headline',
  ContentType.topic: 'topic',
  ContentType.source: 'source',
  ContentType.country: 'country',
};
