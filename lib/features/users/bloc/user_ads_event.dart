import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_ads_event.freezed.dart';

@freezed
class UserAdsEvent with _$UserAdsEvent {
  const factory UserAdsEvent.fetchUserAds({
    required String userId,
  }) = _FetchUserAds;
  const factory UserAdsEvent.refreshUserAds({
    required String userId,
  }) = _RefreshUserAds;
}
