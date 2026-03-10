part of 'notification_bloc.dart';

@freezed
class NotificationState with _$NotificationState {
  const factory NotificationState.initial() = _Initial;
  const factory NotificationState.loading() = NotificationLoading;
  const factory NotificationState.listLoading() = NotificationListLoading;
  const factory NotificationState.listLoaded(
    List<NotificationListItem> items,
    int page,
    int totalPages,
  ) = NotificationListLoaded;

  const factory NotificationState.success(String message) = NotificationSuccess;

  const factory NotificationState.error(String message) = NotificationError;
}
