import 'package:core/core.dart';

/// A list of initial in-app notification data to be loaded into the in-memory
/// data repository.
///
/// This data provides realistic, client-facing notifications for users,
/// suitable for a news app demo environment.
final List<InAppNotification> inAppNotificationsFixturesData =
    _generateAdminNotifications();

/// Generates a list of 21 breaking news notifications for the admin user.
///
/// This approach makes it easy to scale up the number of notifications and
/// vary their properties (e.g., read status, creation time) programmatically.
List<InAppNotification> _generateAdminNotifications() {
  final notificationIds = List.generate(
    21,
    (index) => 'in_app_notification_${index + 1}',
  );
  final headlineIds = getHeadlinesFixturesData().map((e) => e.id).toList();

  return List.generate(21, (index) {
    final headline = getHeadlinesFixturesData()[index % headlineIds.length];
    final notificationId = notificationIds[index];
    final isRead = index > 3;

    return InAppNotification(
      id: notificationId,
      userId: kAdminUserId,
      payload: PushNotificationPayload(
        title: headline.title.entries.first.value,
        imageUrl: headline.imageUrl,
        notificationId: notificationId,
        notificationType: PushNotificationSubscriptionDeliveryType.breakingOnly,
        contentType: ContentType.headline,
        contentId: headline.id,
      ),
      createdAt: DateTime.now().subtract(Duration(days: index * 2)),
      readAt: isRead ? DateTime.now().subtract(Duration(hours: index)) : null,
    );
  });
}
