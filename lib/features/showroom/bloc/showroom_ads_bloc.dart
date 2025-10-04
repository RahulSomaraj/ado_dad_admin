import 'package:ado_dad_admin/models/ad_model.dart';
import 'package:ado_dad_admin/repositories/ads_rep.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'showroom_ads_event.dart';
part 'showroom_ads_state.dart';
part 'showroom_ads_bloc.freezed.dart';

class ShowroomAdsBloc extends Bloc<ShowroomAdsEvent, ShowroomAdsState> {
  final AdsRepository adsRepository;

  ShowroomAdsBloc({required this.adsRepository})
      : super(const ShowroomAdsState.initial()) {
    on<FetchUserAds>(_onFetchUserAds);
  }

  Future<void> _onFetchUserAds(
      FetchUserAds event, Emitter<ShowroomAdsState> emit) async {
    emit(const ShowroomAdsState.loading());

    try {
      final response = await adsRepository.fetchUserAds(
        userId: event.userId,
        page: event.page ?? 1,
        limit: event.limit ?? 10,
        searchQuery: event.searchQuery ?? '',
      );

      // Calculate pagination info from the request parameters
      final currentPage = event.page ?? 1;
      final totalPages = (response.total / (event.limit ?? 10)).ceil();

      emit(ShowroomAdsState.loaded(
        ads: response.data,
        currentPage: currentPage,
        totalPages: totalPages,
        totalAds: response.total,
      ));
    } catch (e) {
      emit(ShowroomAdsState.error("Failed to fetch ads: ${e.toString()}"));
    }
  }
}
