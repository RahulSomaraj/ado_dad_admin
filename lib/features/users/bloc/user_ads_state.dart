import 'package:ado_dad_admin/models/ad_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_ads_state.freezed.dart';

@freezed
class UserAdsState with _$UserAdsState {
  const factory UserAdsState.initial() = _Initial;
  const factory UserAdsState.loading() = _Loading;
  const factory UserAdsState.loaded({
    required List<AdModel> ads,
    required int total,
  }) = _Loaded;
  const factory UserAdsState.error({
    required String message,
  }) = _Error;
}
