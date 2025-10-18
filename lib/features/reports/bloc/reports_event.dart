part of 'reports_bloc.dart';

@freezed
class ReportsEvent with _$ReportsEvent {
  const factory ReportsEvent.started() = _Started;

  const factory ReportsEvent.fetchReportStats() = FetchReportStats;

  const factory ReportsEvent.fetchReports({
    @Default(1) int? page,
    @Default(20) int? limit,
    @Default('') String? searchQuery,
    @Default('') String? status,
    @Default('') String? reason,
  }) = FetchReports;

  const factory ReportsEvent.deleteReport({
    required String reportId,
  }) = DeleteReport;
}
