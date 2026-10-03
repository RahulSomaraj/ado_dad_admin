import 'package:ado_dad_admin/models/report_model.dart';
import 'package:ado_dad_admin/repositories/reports_repo.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'reports_event.dart';
part 'reports_state.dart';
part 'reports_bloc.freezed.dart';

class ReportsBloc extends Bloc<ReportsEvent, ReportsState> {
  final ReportsRepository reportsRepository;
  ReportStatsModel? _cachedStats;
  _ReportsListData? _cachedList;

  ReportsBloc({required this.reportsRepository}) : super(ReportsInitial()) {
    on<FetchReportStats>(_onFetchReportStats);
    on<FetchReports>(_onFetchReports);
    on<DeleteReport>(_onDeleteReport);
  }

  Future<void> _onFetchReportStats(
      FetchReportStats event, Emitter<ReportsState> emit) async {
    emit(const ReportsState.statsLoading());
    try {
      final stats = await reportsRepository.fetchReportStats();
      _cachedStats = stats;
      // If reports were already loaded, emit the combined state so the list
      // doesn't disappear when stats arrive later than the list response.
      final cached = _cachedList;
      if (cached != null) {
        emit(ReportsState.loaded(
          stats: stats,
          reports: cached.reports,
          total: cached.total,
          page: cached.page,
          limit: cached.limit,
          totalPages: cached.totalPages,
          hasNext: cached.hasNext,
          hasPrev: cached.hasPrev,
        ));
      } else {
        emit(ReportsState.statsLoaded(stats: stats));
      }
    } catch (e) {
      emit(ReportsState.error("Failed to fetch report stats: $e"));
    }
  }

  Future<void> _onFetchReports(
      FetchReports event, Emitter<ReportsState> emit) async {
    emit(const ReportsState.listLoading());
    try {
      final response = await reportsRepository.fetchReports(
        page: event.page ?? 1,
        limit: event.limit ?? 20,
        searchQuery: event.searchQuery ?? '',
        status: event.status ?? '',
        reason: event.reason ?? '',
      );

      _cachedList = _ReportsListData(
        reports: response.data,
        total: response.total,
        page: response.page,
        limit: response.limit,
        totalPages: response.totalPages,
        hasNext: response.hasNext,
        hasPrev: response.hasPrev,
      );

      if (_cachedStats != null) {
        emit(ReportsState.loaded(
          stats: _cachedStats!,
          reports: response.data,
          total: response.total,
          page: response.page,
          limit: response.limit,
          totalPages: response.totalPages,
          hasNext: response.hasNext,
          hasPrev: response.hasPrev,
        ));
      } else {
        emit(ReportsState.listLoaded(
          reports: response.data,
          total: response.total,
          page: response.page,
          limit: response.limit,
          totalPages: response.totalPages,
          hasNext: response.hasNext,
          hasPrev: response.hasPrev,
        ));
      }
    } catch (e) {
      emit(ReportsState.error("Failed to fetch reports: $e"));
    }
  }

  Future<void> _onDeleteReport(
      DeleteReport event, Emitter<ReportsState> emit) async {
    try {
      await reportsRepository.deleteReport(event.reportId);
      emit(const ReportsState.reportDeleted());
    } catch (e) {
      emit(ReportsState.error("Failed to delete report: $e"));
    }
  }
}

class _ReportsListData {
  final List<ReportModel> reports;
  final int total;
  final int page;
  final int limit;
  final int totalPages;
  final bool hasNext;
  final bool hasPrev;

  _ReportsListData({
    required this.reports,
    required this.total,
    required this.page,
    required this.limit,
    required this.totalPages,
    required this.hasNext,
    required this.hasPrev,
  });
}
