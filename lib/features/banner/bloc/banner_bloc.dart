import 'dart:typed_data';

import 'package:ado_dad_admin/models/banner_model.dart';
import 'package:ado_dad_admin/repositories/banner_rep.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'banner_event.dart';
part 'banner_state.dart';
part 'banner_bloc.freezed.dart';

class BannerBloc extends Bloc<BannerEvent, BannerState> {
  final BannerRepository repository;
  // final List<BannerInfo> _banners = [];
  BannerBloc({required this.repository}) : super(BannerState.initial()) {
    on<_UploadBannersToS3>(_onUploadBanners);
    on<FetchAllBanners>(_onFetchAllBanners);
    on<UpdateBanner>(_onUpdateBanner);
    on<DeleteBanner>(_onDeleteBanner);
  }

  Future<void> _onUploadBanners(
    _UploadBannersToS3 event,
    Emitter<BannerState> emit,
  ) async {
    emit(const BannerState.loading());

    try {
      // for (final image in event.image) {
      //   final String? imageUrl = await repository.uploadImageToS3(image);
      //   print('bloc called :   $imageUrl');
      //   if (imageUrl != null) {
      //     _banners
      //         .add(BannerInfo(imageUrl: imageUrl, uploadedAt: DateTime.now()));
      //   }
      // }

      final desktopUrl =
          await repository.uploadImageToS3(event.desktopImage, 'desktopImage');
      final tabletUrl =
          await repository.uploadImageToS3(event.tabletImage, 'tabletImage');
      final phoneUrl =
          await repository.uploadImageToS3(event.phoneImage, 'phoneImage');

      if (desktopUrl == null || tabletUrl == null || phoneUrl == null) {
        throw Exception("Image upload failed");
      }

      final bannerRequest = BannerUploadRequest(
        title: event.title,
        desktopImage: desktopUrl,
        tabletImage: tabletUrl,
        phoneImage: phoneUrl,
        link: event.link,
      );

      await repository.saveBannerToDB(bannerRequest);

      // emit(BannerState.success(List.from(_banners)));

      emit(BannerState.success([
        BannerInfo(imageUrl: desktopUrl, uploadedAt: DateTime.now()),
        BannerInfo(imageUrl: tabletUrl, uploadedAt: DateTime.now()),
        BannerInfo(imageUrl: phoneUrl, uploadedAt: DateTime.now()),
      ]));
      add(FetchAllBanners(page: 1, limit: 10));
    } catch (e) {
      emit(BannerState.failure("Upload error: ${e.toString()}"));
    }
  }

  Future<void> _onFetchAllBanners(
      FetchAllBanners event, Emitter<BannerState> emit) async {
    emit(const BannerState.loading());

    try {
      final bannerResponse = await repository.fetchAllBanners(
        page: event.page ?? 1,
        limit: event.limit ?? 10,
        searchQuery: event.searchQuery ?? '',
      );

      emit(BannerState.loaded(
        banners: bannerResponse.banners,
        totalPages: bannerResponse.totalPages,
        currentPage: bannerResponse.currentPage,
      ));
    } catch (e) {
      emit(BannerState.failure("Failed to fetch banners"));
    }
  }

  Future<void> _onUpdateBanner(
      UpdateBanner event, Emitter<BannerState> emit) async {
    emit(Loading());
    try {
      await repository.updateBanner(event.updatedBanner);
      emit(const BannerState.updated());
      add(FetchAllBanners(page: 1, limit: 10));
    } catch (e) {
      emit(BannerState.failure("Failed to update banner"));
    }
  }

  Future<void> _onDeleteBanner(
      DeleteBanner event, Emitter<BannerState> emit) async {
    try {
      await repository.deleteBanner(event.bannerId);
      add(FetchAllBanners(page: 1, limit: 10));
    } catch (e) {
      emit(Failure("Failed to delete banner"));
    }
  }
}
