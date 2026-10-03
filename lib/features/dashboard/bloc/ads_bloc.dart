import 'package:ado_dad_admin/repositories/ads_rep.dart';
import 'package:bloc/bloc.dart';

import 'ads_event.dart';
import 'ads_state.dart';

class AdsBloc extends Bloc<AdsEvent, AdsState> {
  final AdsRepository _adsRepository;

  /// Optional owner filter for the admin ads view (set when navigating from a
  /// user's detail page). Cleared by setting it back to null.
  String? userFilter;

  AdsBloc({required AdsRepository adsRepository})
      : _adsRepository = adsRepository,
        super(const AdsState.initial()) {
    on<AdsEvent>((event, emit) async {
      await event.when(
        fetchAllAds: (page, limit, searchQuery) =>
            _onFetchAllAds(page, limit, searchQuery, emit),
        updateAdApproval: (adId, isApproved) =>
            _onUpdateAdApproval(adId, isApproved, emit),
        refreshAds: (page, limit, searchQuery) =>
            _onRefreshAds(page, limit, searchQuery, emit),
      );
    });
  }

  Future<void> _onFetchAllAds(
    int page,
    int limit,
    String? searchQuery,
    Emitter<AdsState> emit,
  ) async {
    emit(const AdsState.loading());

    try {
      final response = await _adsRepository.fetchAllAds(
        page: page,
        limit: limit,
        searchQuery: searchQuery,
        userId: userFilter,
      );

      emit(AdsState.loaded(
        ads: response.data,
        total: response.total,
        currentPage: page,
        itemsPerPage: limit,
      ));
    } catch (e) {
      emit(AdsState.error(message: 'Failed to load ads: $e'));
    }
  }

  Future<void> _onUpdateAdApproval(
    String adId,
    bool isApproved,
    Emitter<AdsState> emit,
  ) async {
    // Store the current state before emitting loading
    final currentState = state;

    emit(AdsState.approvalLoading(adId: adId));

    try {
      final updatedAd = await _adsRepository.updateAdApproval(
        adId: adId,
        isApproved: isApproved,
      );

      // Update the previous loaded state with the updated ad
      currentState.whenOrNull(
        loaded: (ads, total, currentPage, itemsPerPage) {
          final updatedAds = ads.map((ad) {
            return ad.id == adId ? updatedAd : ad;
          }).toList();

          emit(AdsState.loaded(
            ads: updatedAds,
            total: total,
            currentPage: currentPage,
            itemsPerPage: itemsPerPage,
          ));
        },
      );

      // Show success message briefly
      emit(AdsState.approvalSuccess(
        message: isApproved
            ? 'Ad approved successfully!'
            : 'Ad rejected successfully!',
        updatedAd: updatedAd,
      ));

      // Return to loaded state after a brief delay
      await Future.delayed(const Duration(milliseconds: 1000));
      currentState.whenOrNull(
        loaded: (ads, total, currentPage, itemsPerPage) {
          final updatedAds = ads.map((ad) {
            return ad.id == adId ? updatedAd : ad;
          }).toList();

          emit(AdsState.loaded(
            ads: updatedAds,
            total: total,
            currentPage: currentPage,
            itemsPerPage: itemsPerPage,
          ));
        },
      );
    } catch (e) {
      // Return to the previous loaded state on error
      currentState.whenOrNull(
        loaded: (ads, total, currentPage, itemsPerPage) {
          emit(AdsState.loaded(
            ads: ads,
            total: total,
            currentPage: currentPage,
            itemsPerPage: itemsPerPage,
          ));
        },
      );

      // Show error message briefly
      emit(AdsState.approvalError(
        message: 'Failed to update approval: $e',
        adId: adId,
      ));

      // Return to loaded state after a brief delay
      await Future.delayed(const Duration(milliseconds: 1000));
      currentState.whenOrNull(
        loaded: (ads, total, currentPage, itemsPerPage) {
          emit(AdsState.loaded(
            ads: ads,
            total: total,
            currentPage: currentPage,
            itemsPerPage: itemsPerPage,
          ));
        },
      );
    }
  }

  Future<void> _onRefreshAds(
    int page,
    int limit,
    String? searchQuery,
    Emitter<AdsState> emit,
  ) async {
    // For refresh, we can emit loading state and then fetch
    emit(const AdsState.loading());

    try {
      final response = await _adsRepository.fetchAllAds(
        page: page,
        limit: limit,
        searchQuery: searchQuery,
        userId: userFilter,
      );

      emit(AdsState.loaded(
        ads: response.data,
        total: response.total,
        currentPage: page,
        itemsPerPage: limit,
      ));
    } catch (e) {
      emit(AdsState.error(message: 'Failed to refresh ads: $e'));
    }
  }
}
