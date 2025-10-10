import 'package:ado_dad_admin/models/ad_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'ads_state.freezed.dart';

@freezed
class AdsState with _$AdsState {
  const factory AdsState.initial() = _Initial;

  const factory AdsState.loading() = _Loading;

  const factory AdsState.loaded({
    required List<AdModel> ads,
    required int total,
    @Default(1) int currentPage,
    @Default(10) int itemsPerPage,
  }) = _Loaded;

  const factory AdsState.error({
    required String message,
  }) = _Error;

  const factory AdsState.approvalLoading({
    required String adId,
  }) = _ApprovalLoading;

  const factory AdsState.approvalSuccess({
    required String message,
    required AdModel updatedAd,
  }) = _ApprovalSuccess;

  const factory AdsState.approvalError({
    required String message,
    required String adId,
  }) = _ApprovalError;
}
