import 'package:ado_dad_admin/repositories/user_rep.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dio/dio.dart';
import 'user_ads_event.dart';
import 'user_ads_state.dart';

class UserAdsBloc extends Bloc<UserAdsEvent, UserAdsState> {
  final UserRepository _userRepository;

  UserAdsBloc({required UserRepository userRepository})
      : _userRepository = userRepository,
        super(const UserAdsState.initial()) {
    on<UserAdsEvent>((event, emit) async {
      await event.when(
        fetchUserAds: (userId, page, limit) =>
            _onFetchUserAds(userId, page, limit, emit),
        refreshUserAds: (userId, page, limit) =>
            _onRefreshUserAds(userId, page, limit, emit),
      );
    });
  }

  Future<void> _onFetchUserAds(
    String userId,
    int? page,
    int? limit,
    Emitter<UserAdsState> emit,
  ) async {
    emit(const UserAdsState.loading());

    try {
      final currentPage = page ?? 1;
      final pageLimit = limit ?? 10;

      print(
          '🔍 Fetching ads for user ID: $userId, page: $currentPage, limit: $pageLimit');
      final response = await _userRepository.fetchUserAds(
        userId: userId,
        page: currentPage,
        limit: pageLimit,
      );
      print('📊 API Response: ${response.data.length} ads found');
      print(
          '📋 First ad user ID: ${response.data.isNotEmpty ? response.data.first.user.id : 'No ads'}');

      // Calculate pagination info
      final totalPages = (response.total / pageLimit).ceil();

      // The API endpoint /ads/user/{userId} already returns ads for the specific user
      // No need to filter further
      emit(UserAdsState.loaded(
        ads: response.data,
        total: response.total,
        currentPage: currentPage,
        totalPages: totalPages,
      ));
    } on DioException catch (e) {
      // Handle Dio exceptions with detailed error information
      String errorMessage = 'Error loading ads: ';

      if (e.response != null) {
        // Server responded with error status
        errorMessage +=
            'Status ${e.response?.statusCode}: ${e.response?.statusMessage}';
        if (e.response?.data != null) {
          errorMessage += '\nResponse: ${e.response?.data}';
        }
      } else {
        // Network or other Dio error
        errorMessage += e.message ?? 'Unknown network error';
      }

      emit(UserAdsState.error(message: errorMessage));
    } catch (e, stackTrace) {
      print('❌ Unexpected error in _onFetchUserAds: $e');
      print('❌ Error type: ${e.runtimeType}');
      print('❌ Error details: ${e.toString()}');
      print('❌ Stack trace: $stackTrace');
      emit(UserAdsState.error(message: 'Unexpected error: ${e.toString()}'));
    }
  }

  Future<void> _onRefreshUserAds(
    String userId,
    int? page,
    int? limit,
    Emitter<UserAdsState> emit,
  ) async {
    // For refresh, we can emit loading state and then fetch
    emit(const UserAdsState.loading());

    try {
      final currentPage = page ?? 1;
      final pageLimit = limit ?? 10;

      final response = await _userRepository.fetchUserAds(
        userId: userId,
        page: currentPage,
        limit: pageLimit,
      );

      // Calculate pagination info
      final totalPages = (response.total / pageLimit).ceil();

      // The API endpoint /ads/user/{userId} already returns ads for the specific user
      // No need to filter further
      emit(UserAdsState.loaded(
        ads: response.data,
        total: response.total,
        currentPage: currentPage,
        totalPages: totalPages,
      ));
    } on DioException catch (e) {
      // Handle Dio exceptions with detailed error information
      String errorMessage = 'Error loading ads: ';

      if (e.response != null) {
        // Server responded with error status
        errorMessage +=
            'Status ${e.response?.statusCode}: ${e.response?.statusMessage}';
        if (e.response?.data != null) {
          errorMessage += '\nResponse: ${e.response?.data}';
        }
      } else {
        // Network or other Dio error
        errorMessage += e.message ?? 'Unknown network error';
      }

      emit(UserAdsState.error(message: errorMessage));
    } catch (e) {
      print('❌ Unexpected error in _onRefreshUserAds: $e');
      emit(UserAdsState.error(message: 'Unexpected error: ${e.toString()}'));
    }
  }
}
