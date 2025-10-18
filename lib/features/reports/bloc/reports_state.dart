part of 'reports_bloc.dart';

@freezed
class ReportsState with _$ReportsState {
  const factory ReportsState.initial() = ReportsInitial;
  const factory ReportsState.loading() = ReportsLoading;
  const factory ReportsState.statsLoading() = ReportsStatsLoading;
  const factory ReportsState.listLoading() = ReportsListLoading;

  const factory ReportsState.statsLoaded({
    required ReportStatsModel stats,
  }) = ReportsStatsLoaded;

  const factory ReportsState.listLoaded({
    required List<ReportModel> reports,
    required int total,
    required int page,
    required int limit,
    required int totalPages,
    required bool hasNext,
    required bool hasPrev,
  }) = ReportsListLoaded;

  const factory ReportsState.loaded({
    required ReportStatsModel stats,
    required List<ReportModel> reports,
    required int total,
    required int page,
    required int limit,
    required int totalPages,
    required bool hasNext,
    required bool hasPrev,
  }) = ReportsLoaded;

  const factory ReportsState.reportDeleted() = ReportDeleted;

  const factory ReportsState.error(String message) = ReportsError;
}
