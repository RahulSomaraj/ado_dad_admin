part of 'banner_bloc.dart';

@freezed
class BannerEvent with _$BannerEvent {
  const factory BannerEvent.started() = _Started;
  const factory BannerEvent.uploadBannerToS3({
    required String title,
    required String link,
    required Uint8List desktopImage,
    required Uint8List tabletImage,
    required Uint8List phoneImage,
  }) = _UploadBannersToS3;
  const factory BannerEvent.fetchAllBanners({
    @Default(1) int? page,
    @Default(10) int? limit,
    @Default('') String? searchQuery,
  }) = FetchAllBanners;
  const factory BannerEvent.updateBanner(
      {required BannerUploadRequest updatedBanner}) = UpdateBanner;
  const factory BannerEvent.deleteBanner({required String bannerId}) =
      DeleteBanner;
}
