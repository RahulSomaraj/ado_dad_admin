import 'dart:async';
import 'dart:typed_data';

import 'package:ado_dad_admin/models/user_model.dart';
import 'package:ado_dad_admin/repositories/showroom_rep.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'showroom_event.dart';
part 'showroom_state.dart';
part 'showroom_bloc.freezed.dart';

class ShowroomBloc extends Bloc<ShowroomEvent, ShowroomState> {
  final ShowroomRepository showroomRepository;
  ShowroomBloc({required this.showroomRepository}) : super(ShowroomInitial()) {
    on<FetchAllShowrooms>(_onFetchAllShowrooms);
    on<AddShowroom>(_onAddShowroom);
    on<AddShowroomWithProfilePic>(_onAddShowroomWithProfilePic);
    on<UpdateShowroom>(_onUpdateShowroom);
    on<UpdateShowroomWithProfilePic>(_onUpdateShowroomWithProfilePic);
    on<FetchCurrentUserShowroom>(_onFetchCurrentUserShowroom);
  }

  Future<void> _onFetchAllShowrooms(
      FetchAllShowrooms event, Emitter<ShowroomState> emit) async {
    emit(const ShowroomState.loading());

    try {
      final userResponse = await showroomRepository.fetchAllShowroom(
          page: event.page ?? 1,
          limit: event.limit ?? 10,
          userType: event.userType ?? '',
          searchQuery: event.searchQuery ?? '');
      // print(userResponse.users);
      emit(ShowroomState.loaded(
        showroomusers: userResponse.users,
        totalPages: userResponse.totalPages,
        currentPage: userResponse.currentPage,
      ));
    } catch (e) {
      emit(ShowroomState.error("Failed to fetch showrooms"));
    }
  }

  Future<void> _onAddShowroom(
      AddShowroom event, Emitter<ShowroomState> emit) async {
    emit(const ShowroomState.addingShowroom());
    try {
      final responseMessage =
          await showroomRepository.createShowroom(event.showroomData);
      emit(ShowroomState.showroomAddedSuccess(responseMessage));
      add(const FetchAllShowrooms());
    } catch (e) {
      emit(ShowroomState.error(e.toString()));
    }
  }

  Future<void> _onAddShowroomWithProfilePic(
      AddShowroomWithProfilePic event, Emitter<ShowroomState> emit) async {
    emit(const ShowroomState.addingShowroom());
    try {
      // Upload profile picture to S3
      final profilePicUrl = await showroomRepository.uploadImageToS3(
        event.profilePicBytes,
        'showroomProfilePic_${DateTime.now().millisecondsSinceEpoch}',
      );

      if (profilePicUrl == null) {
        throw Exception("Failed to upload profile picture");
      }

      // Create showroom with profile picture URL
      final showroomWithProfilePic =
          event.showroomData.copyWith(profilePic: profilePicUrl);
      final responseMessage =
          await showroomRepository.createShowroom(showroomWithProfilePic);
      emit(ShowroomState.showroomAddedSuccess(responseMessage));
      add(const FetchAllShowrooms());
    } catch (e) {
      emit(ShowroomState.error(e.toString()));
    }
  }

  Future<void> _onUpdateShowroom(
      UpdateShowroom event, Emitter<ShowroomState> emit) async {
    emit(const ShowroomState.loading());
    try {
      final updatedUser =
          await showroomRepository.updateShowroom(event.updatedShowroom);
      emit(ShowroomState.updated(updatedUser: updatedUser));
      // Refresh the showroom list after successful update
      add(const FetchAllShowrooms());
    } catch (e) {
      emit(ShowroomState.error("Failed to update showroom"));
    }
  }

  Future<void> _onUpdateShowroomWithProfilePic(
      UpdateShowroomWithProfilePic event, Emitter<ShowroomState> emit) async {
    emit(const ShowroomState.loading());
    try {
      // Upload profile picture to S3
      final profilePicUrl = await showroomRepository.uploadImageToS3(
        event.profilePicBytes,
        'showroomProfilePic_${DateTime.now().millisecondsSinceEpoch}',
      );

      if (profilePicUrl == null) {
        throw Exception("Failed to upload profile picture");
      }

      // Update showroom with profile picture URL
      final showroomWithProfilePic =
          event.updatedShowroom.copyWith(profilePic: profilePicUrl);
      final updatedUser =
          await showroomRepository.updateShowroom(showroomWithProfilePic);
      emit(ShowroomState.updated(updatedUser: updatedUser));
      // Refresh the showroom list after successful update
      add(const FetchAllShowrooms());
    } catch (e) {
      emit(ShowroomState.error("Failed to update showroom"));
    }
  }

  Future<void> _onFetchCurrentUserShowroom(
      FetchCurrentUserShowroom event, Emitter<ShowroomState> emit) async {
    emit(const ShowroomState.loading());

    try {
      final userResponse = await showroomRepository.fetchCurrentUserShowroom();
      emit(ShowroomState.loaded(
        showroomusers: userResponse.users,
        totalPages: userResponse.totalPages,
        currentPage: userResponse.currentPage,
      ));
    } catch (e) {
      emit(ShowroomState.error("Failed to fetch your showroom information"));
    }
  }
}
