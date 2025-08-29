part of 'banner_bloc.dart';

@freezed
class BannerState with _$BannerState {
  const factory BannerState.initial() = _Initial;
  const factory BannerState.loading() = Loading;
  const factory BannerState.success(List<BannerInfo> banners) = _Success;
  const factory BannerState.failure(String message) = Failure;
  // const factory BannerState.successMessage(String message) = _SuccessMessage;
  const factory BannerState.loaded({
    required List<BannerUploadRequest> banners,
    required int totalPages,
    required int currentPage,
  }) = BannerLoaded;
  const factory BannerState.updated() = BannerUpdated;
}

class BannerInfo {
  final String imageUrl;
  final DateTime uploadedAt;

  BannerInfo({required this.imageUrl, required this.uploadedAt});
}
