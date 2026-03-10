import 'dart:async';
import 'dart:typed_data';

import 'package:ado_dad_admin/models/notification_model.dart';
import 'package:ado_dad_admin/repositories/notification_repo.dart';
import 'package:bloc/bloc.dart';
import 'package:collection/collection.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'notification_event.dart';
part 'notification_state.dart';
part 'notification_bloc.freezed.dart';

class NotificationBloc extends Bloc<NotificationEvent, NotificationState> {
  final NotificationRepository notificationRepository;

  NotificationBloc({required this.notificationRepository}) : super(_Initial()) {
    on<SendBroadcastNotification>(_onSendBroadcastNotification);
    on<FetchNotifications>(_onFetchNotifications);
    on<ResetNotificationState>(_onReset);
  }

  Future<void> _onSendBroadcastNotification(
    SendBroadcastNotification event,
    Emitter<NotificationState> emit,
  ) async {
    emit(const NotificationState.loading());

    try {
      String? imageUrl;
      if (event.imageBytes != null) {
        imageUrl = await notificationRepository.uploadImageToS3(
          event.imageBytes!,
          'notification_image',
        );
      }

      final model = AdminBroadcastNotificationModel(
        title: event.title,
        body: event.body,
        targetType: "ALL",
        priority: imageUrl != null ? "HIGH" : "NORMAL",
        media: imageUrl != null
            ? NotificationMedia(type: "IMAGE", url: imageUrl)
            : null,
        data: event.data,
      );

      final responseMessage =
          await notificationRepository.sendBroadcastNotification(model);

      emit(NotificationState.success(responseMessage));
    } catch (e) {
      emit(NotificationState.error(e.toString()));
    }
  }

  void _onReset(
    ResetNotificationState event,
    Emitter<NotificationState> emit,
  ) {
    emit(const NotificationState.initial());
  }

  Future<void> _onFetchNotifications(
    FetchNotifications event,
    Emitter<NotificationState> emit,
  ) async {
    emit(const NotificationState.listLoading());

    try {
      final response = await notificationRepository.fetchNotifications(
        page: event.page,
        limit: event.limit,
      );

      emit(NotificationState.listLoaded(
        response.data,
        response.page,
        response.totalPages,
      ));
    } catch (e) {
      emit(NotificationState.error(e.toString()));
    }
  }
}
