import 'package:freezed_annotation/freezed_annotation.dart';

part 'ads_event.freezed.dart';

@freezed
class AdsEvent with _$AdsEvent {
  const factory AdsEvent.fetchAllAds({
    @Default(1) int page,
    @Default(10) int limit,
    String? searchQuery,
  }) = _FetchAllAds;

  const factory AdsEvent.updateAdApproval({
    required String adId,
    required bool isApproved,
  }) = _UpdateAdApproval;

  const factory AdsEvent.refreshAds({
    @Default(1) int page,
    @Default(10) int limit,
    String? searchQuery,
  }) = _RefreshAds;
}
