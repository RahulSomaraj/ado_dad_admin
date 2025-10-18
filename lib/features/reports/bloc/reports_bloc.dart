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

  ReportsBloc({required this.reportsRepository}) : super(ReportsInitial()) {
    on<FetchReportStats>(_onFetchReportStats);
    on<FetchReports>(_onFetchReports);
    on<DeleteReport>(_onDeleteReport);
  }

  Future<void> _onFetchReportStats(
      FetchReportStats event, Emitter<ReportsState> emit) async {
    print('🔄 ReportsBloc: Starting to fetch report stats');
    emit(const ReportsState.statsLoading());

    try {
      final stats = await reportsRepository.fetchReportStats();
      _cachedStats = stats;
      print(
          '✅ ReportsBloc: Successfully fetched stats - Total: ${stats.totalReports}');
      print('📤 ReportsBloc: Emitting ReportsStatsLoaded state');
      emit(ReportsState.statsLoaded(stats: stats));
      print('📤 ReportsBloc: State emitted successfully');
    } catch (e) {
      print('❌ ReportsBloc: Error fetching report stats: $e');
      emit(ReportsState.error("Failed to fetch report stats: $e"));
    }
  }

  Future<void> _onFetchReports(
      FetchReports event, Emitter<ReportsState> emit) async {
    print('🔄 ReportsBloc: Starting to fetch reports');
    emit(const ReportsState.listLoading());

    try {
      final response = await reportsRepository.fetchReports(
        page: event.page ?? 1,
        limit: event.limit ?? 20,
        searchQuery: event.searchQuery ?? '',
        status: event.status ?? '',
        reason: event.reason ?? '',
      );

      print(
          '✅ ReportsBloc: Successfully fetched ${response.data.length} reports');

      // If we have cached stats, emit combined state
      if (_cachedStats != null) {
        print('📤 ReportsBloc: Emitting combined ReportsLoaded state');
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
        print('📤 ReportsBloc: Emitting ReportsListLoaded state');
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
      print('📤 ReportsBloc: State emitted successfully');
    } catch (e) {
      print('❌ ReportsBloc: Error fetching reports: $e');
      emit(ReportsState.error("Failed to fetch reports: $e"));
    }
  }

  Future<void> _onDeleteReport(
      DeleteReport event, Emitter<ReportsState> emit) async {
    print('🔄 ReportsBloc: Starting to delete report: ${event.reportId}');
    try {
      await reportsRepository.deleteReport(event.reportId);
      print('✅ ReportsBloc: Report deleted successfully');
      emit(const ReportsState.reportDeleted());
    } catch (e) {
      print('❌ ReportsBloc: Error deleting report: $e');
      emit(ReportsState.error("Failed to delete report: $e"));
    }
  }
}
