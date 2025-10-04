part of 'showroom_ads_bloc.dart';

@freezed
class ShowroomAdsState with _$ShowroomAdsState {
  const factory ShowroomAdsState.initial() = ShowroomAdsInitial;
  const factory ShowroomAdsState.loading() = ShowroomAdsLoading;
  const factory ShowroomAdsState.loaded({
    required List<AdModel> ads,
    required int currentPage,
    required int totalPages,
    required int totalAds,
  }) = ShowroomAdsLoaded;
  const factory ShowroomAdsState.error(String message) = ShowroomAdsError;
}
