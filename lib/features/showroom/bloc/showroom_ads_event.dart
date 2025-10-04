part of 'showroom_ads_bloc.dart';

@freezed
class ShowroomAdsEvent with _$ShowroomAdsEvent {
  const factory ShowroomAdsEvent.fetchUserAds({
    required String userId,
    @Default(1) int? page,
    @Default(10) int? limit,
    @Default('') String? searchQuery,
  }) = FetchUserAds;
}
