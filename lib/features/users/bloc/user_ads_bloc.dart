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
        fetchUserAds: (userId) => _onFetchUserAds(userId, emit),
        refreshUserAds: (userId) => _onRefreshUserAds(userId, emit),
      );
    });
  }

  Future<void> _onFetchUserAds(
    String userId,
    Emitter<UserAdsState> emit,
  ) async {
    emit(const UserAdsState.loading());

    try {
      print('🔍 Fetching ads for user ID: $userId');
      final response = await _userRepository.fetchUserAds(userId);
      print('📊 API Response: ${response.data.length} ads found');
      print(
          '📋 First ad user ID: ${response.data.isNotEmpty ? response.data.first.user.id : 'No ads'}');

      // The API endpoint /ads/user/{userId} already returns ads for the specific user
      // No need to filter further
      emit(UserAdsState.loaded(ads: response.data, total: response.total));
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
    Emitter<UserAdsState> emit,
  ) async {
    // For refresh, we can emit loading state and then fetch
    emit(const UserAdsState.loading());

    try {
      final response = await _userRepository.fetchUserAds(userId);

      // The API endpoint /ads/user/{userId} already returns ads for the specific user
      // No need to filter further
      emit(UserAdsState.loaded(ads: response.data, total: response.total));
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
