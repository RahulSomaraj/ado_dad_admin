part of 'notification_bloc.dart';

@freezed
class NotificationEvent with _$NotificationEvent {
  const factory NotificationEvent.started() = _Started;
  const factory NotificationEvent.sendBroadcastNotification({
    required String title,
    required String body,
    Map<String, dynamic>? data,
    Uint8List? imageBytes,
  }) = SendBroadcastNotification;

  const factory NotificationEvent.fetchNotifications({
    @Default(1) int page,
    @Default(10) int limit,
  }) = FetchNotifications;

  const factory NotificationEvent.reset() = ResetNotificationState;
}
