// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'reports_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ReportsEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function() fetchReportStats,
    required TResult Function(int? page, int? limit, String? searchQuery,
            String? status, String? reason)
        fetchReports,
    required TResult Function(String reportId) deleteReport,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function()? fetchReportStats,
    TResult? Function(int? page, int? limit, String? searchQuery,
            String? status, String? reason)?
        fetchReports,
    TResult? Function(String reportId)? deleteReport,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function()? fetchReportStats,
    TResult Function(int? page, int? limit, String? searchQuery, String? status,
            String? reason)?
        fetchReports,
    TResult Function(String reportId)? deleteReport,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(FetchReportStats value) fetchReportStats,
    required TResult Function(FetchReports value) fetchReports,
    required TResult Function(DeleteReport value) deleteReport,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(FetchReportStats value)? fetchReportStats,
    TResult? Function(FetchReports value)? fetchReports,
    TResult? Function(DeleteReport value)? deleteReport,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(FetchReportStats value)? fetchReportStats,
    TResult Function(FetchReports value)? fetchReports,
    TResult Function(DeleteReport value)? deleteReport,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReportsEventCopyWith<$Res> {
  factory $ReportsEventCopyWith(
          ReportsEvent value, $Res Function(ReportsEvent) then) =
      _$ReportsEventCopyWithImpl<$Res, ReportsEvent>;
}

/// @nodoc
class _$ReportsEventCopyWithImpl<$Res, $Val extends ReportsEvent>
    implements $ReportsEventCopyWith<$Res> {
  _$ReportsEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ReportsEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$StartedImplCopyWith<$Res> {
  factory _$$StartedImplCopyWith(
          _$StartedImpl value, $Res Function(_$StartedImpl) then) =
      __$$StartedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$StartedImplCopyWithImpl<$Res>
    extends _$ReportsEventCopyWithImpl<$Res, _$StartedImpl>
    implements _$$StartedImplCopyWith<$Res> {
  __$$StartedImplCopyWithImpl(
      _$StartedImpl _value, $Res Function(_$StartedImpl) _then)
      : super(_value, _then);

  /// Create a copy of ReportsEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$StartedImpl implements _Started {
  const _$StartedImpl();

  @override
  String toString() {
    return 'ReportsEvent.started()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$StartedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function() fetchReportStats,
    required TResult Function(int? page, int? limit, String? searchQuery,
            String? status, String? reason)
        fetchReports,
    required TResult Function(String reportId) deleteReport,
  }) {
    return started();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function()? fetchReportStats,
    TResult? Function(int? page, int? limit, String? searchQuery,
            String? status, String? reason)?
        fetchReports,
    TResult? Function(String reportId)? deleteReport,
  }) {
    return started?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function()? fetchReportStats,
    TResult Function(int? page, int? limit, String? searchQuery, String? status,
            String? reason)?
        fetchReports,
    TResult Function(String reportId)? deleteReport,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(FetchReportStats value) fetchReportStats,
    required TResult Function(FetchReports value) fetchReports,
    required TResult Function(DeleteReport value) deleteReport,
  }) {
    return started(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(FetchReportStats value)? fetchReportStats,
    TResult? Function(FetchReports value)? fetchReports,
    TResult? Function(DeleteReport value)? deleteReport,
  }) {
    return started?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(FetchReportStats value)? fetchReportStats,
    TResult Function(FetchReports value)? fetchReports,
    TResult Function(DeleteReport value)? deleteReport,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started(this);
    }
    return orElse();
  }
}

abstract class _Started implements ReportsEvent {
  const factory _Started() = _$StartedImpl;
}

/// @nodoc
abstract class _$$FetchReportStatsImplCopyWith<$Res> {
  factory _$$FetchReportStatsImplCopyWith(_$FetchReportStatsImpl value,
          $Res Function(_$FetchReportStatsImpl) then) =
      __$$FetchReportStatsImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$FetchReportStatsImplCopyWithImpl<$Res>
    extends _$ReportsEventCopyWithImpl<$Res, _$FetchReportStatsImpl>
    implements _$$FetchReportStatsImplCopyWith<$Res> {
  __$$FetchReportStatsImplCopyWithImpl(_$FetchReportStatsImpl _value,
      $Res Function(_$FetchReportStatsImpl) _then)
      : super(_value, _then);

  /// Create a copy of ReportsEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$FetchReportStatsImpl implements FetchReportStats {
  const _$FetchReportStatsImpl();

  @override
  String toString() {
    return 'ReportsEvent.fetchReportStats()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$FetchReportStatsImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function() fetchReportStats,
    required TResult Function(int? page, int? limit, String? searchQuery,
            String? status, String? reason)
        fetchReports,
    required TResult Function(String reportId) deleteReport,
  }) {
    return fetchReportStats();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function()? fetchReportStats,
    TResult? Function(int? page, int? limit, String? searchQuery,
            String? status, String? reason)?
        fetchReports,
    TResult? Function(String reportId)? deleteReport,
  }) {
    return fetchReportStats?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function()? fetchReportStats,
    TResult Function(int? page, int? limit, String? searchQuery, String? status,
            String? reason)?
        fetchReports,
    TResult Function(String reportId)? deleteReport,
    required TResult orElse(),
  }) {
    if (fetchReportStats != null) {
      return fetchReportStats();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(FetchReportStats value) fetchReportStats,
    required TResult Function(FetchReports value) fetchReports,
    required TResult Function(DeleteReport value) deleteReport,
  }) {
    return fetchReportStats(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(FetchReportStats value)? fetchReportStats,
    TResult? Function(FetchReports value)? fetchReports,
    TResult? Function(DeleteReport value)? deleteReport,
  }) {
    return fetchReportStats?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(FetchReportStats value)? fetchReportStats,
    TResult Function(FetchReports value)? fetchReports,
    TResult Function(DeleteReport value)? deleteReport,
    required TResult orElse(),
  }) {
    if (fetchReportStats != null) {
      return fetchReportStats(this);
    }
    return orElse();
  }
}

abstract class FetchReportStats implements ReportsEvent {
  const factory FetchReportStats() = _$FetchReportStatsImpl;
}

/// @nodoc
abstract class _$$FetchReportsImplCopyWith<$Res> {
  factory _$$FetchReportsImplCopyWith(
          _$FetchReportsImpl value, $Res Function(_$FetchReportsImpl) then) =
      __$$FetchReportsImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {int? page,
      int? limit,
      String? searchQuery,
      String? status,
      String? reason});
}

/// @nodoc
class __$$FetchReportsImplCopyWithImpl<$Res>
    extends _$ReportsEventCopyWithImpl<$Res, _$FetchReportsImpl>
    implements _$$FetchReportsImplCopyWith<$Res> {
  __$$FetchReportsImplCopyWithImpl(
      _$FetchReportsImpl _value, $Res Function(_$FetchReportsImpl) _then)
      : super(_value, _then);

  /// Create a copy of ReportsEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? page = freezed,
    Object? limit = freezed,
    Object? searchQuery = freezed,
    Object? status = freezed,
    Object? reason = freezed,
  }) {
    return _then(_$FetchReportsImpl(
      page: freezed == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int?,
      limit: freezed == limit
          ? _value.limit
          : limit // ignore: cast_nullable_to_non_nullable
              as int?,
      searchQuery: freezed == searchQuery
          ? _value.searchQuery
          : searchQuery // ignore: cast_nullable_to_non_nullable
              as String?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      reason: freezed == reason
          ? _value.reason
          : reason // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$FetchReportsImpl implements FetchReports {
  const _$FetchReportsImpl(
      {this.page = 1,
      this.limit = 20,
      this.searchQuery = '',
      this.status = '',
      this.reason = ''});

  @override
  @JsonKey()
  final int? page;
  @override
  @JsonKey()
  final int? limit;
  @override
  @JsonKey()
  final String? searchQuery;
  @override
  @JsonKey()
  final String? status;
  @override
  @JsonKey()
  final String? reason;

  @override
  String toString() {
    return 'ReportsEvent.fetchReports(page: $page, limit: $limit, searchQuery: $searchQuery, status: $status, reason: $reason)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FetchReportsImpl &&
            (identical(other.page, page) || other.page == page) &&
            (identical(other.limit, limit) || other.limit == limit) &&
            (identical(other.searchQuery, searchQuery) ||
                other.searchQuery == searchQuery) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.reason, reason) || other.reason == reason));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, page, limit, searchQuery, status, reason);

  /// Create a copy of ReportsEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FetchReportsImplCopyWith<_$FetchReportsImpl> get copyWith =>
      __$$FetchReportsImplCopyWithImpl<_$FetchReportsImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function() fetchReportStats,
    required TResult Function(int? page, int? limit, String? searchQuery,
            String? status, String? reason)
        fetchReports,
    required TResult Function(String reportId) deleteReport,
  }) {
    return fetchReports(page, limit, searchQuery, status, reason);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function()? fetchReportStats,
    TResult? Function(int? page, int? limit, String? searchQuery,
            String? status, String? reason)?
        fetchReports,
    TResult? Function(String reportId)? deleteReport,
  }) {
    return fetchReports?.call(page, limit, searchQuery, status, reason);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function()? fetchReportStats,
    TResult Function(int? page, int? limit, String? searchQuery, String? status,
            String? reason)?
        fetchReports,
    TResult Function(String reportId)? deleteReport,
    required TResult orElse(),
  }) {
    if (fetchReports != null) {
      return fetchReports(page, limit, searchQuery, status, reason);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(FetchReportStats value) fetchReportStats,
    required TResult Function(FetchReports value) fetchReports,
    required TResult Function(DeleteReport value) deleteReport,
  }) {
    return fetchReports(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(FetchReportStats value)? fetchReportStats,
    TResult? Function(FetchReports value)? fetchReports,
    TResult? Function(DeleteReport value)? deleteReport,
  }) {
    return fetchReports?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(FetchReportStats value)? fetchReportStats,
    TResult Function(FetchReports value)? fetchReports,
    TResult Function(DeleteReport value)? deleteReport,
    required TResult orElse(),
  }) {
    if (fetchReports != null) {
      return fetchReports(this);
    }
    return orElse();
  }
}

abstract class FetchReports implements ReportsEvent {
  const factory FetchReports(
      {final int? page,
      final int? limit,
      final String? searchQuery,
      final String? status,
      final String? reason}) = _$FetchReportsImpl;

  int? get page;
  int? get limit;
  String? get searchQuery;
  String? get status;
  String? get reason;

  /// Create a copy of ReportsEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FetchReportsImplCopyWith<_$FetchReportsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$DeleteReportImplCopyWith<$Res> {
  factory _$$DeleteReportImplCopyWith(
          _$DeleteReportImpl value, $Res Function(_$DeleteReportImpl) then) =
      __$$DeleteReportImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String reportId});
}

/// @nodoc
class __$$DeleteReportImplCopyWithImpl<$Res>
    extends _$ReportsEventCopyWithImpl<$Res, _$DeleteReportImpl>
    implements _$$DeleteReportImplCopyWith<$Res> {
  __$$DeleteReportImplCopyWithImpl(
      _$DeleteReportImpl _value, $Res Function(_$DeleteReportImpl) _then)
      : super(_value, _then);

  /// Create a copy of ReportsEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? reportId = null,
  }) {
    return _then(_$DeleteReportImpl(
      reportId: null == reportId
          ? _value.reportId
          : reportId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$DeleteReportImpl implements DeleteReport {
  const _$DeleteReportImpl({required this.reportId});

  @override
  final String reportId;

  @override
  String toString() {
    return 'ReportsEvent.deleteReport(reportId: $reportId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DeleteReportImpl &&
            (identical(other.reportId, reportId) ||
                other.reportId == reportId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, reportId);

  /// Create a copy of ReportsEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DeleteReportImplCopyWith<_$DeleteReportImpl> get copyWith =>
      __$$DeleteReportImplCopyWithImpl<_$DeleteReportImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function() fetchReportStats,
    required TResult Function(int? page, int? limit, String? searchQuery,
            String? status, String? reason)
        fetchReports,
    required TResult Function(String reportId) deleteReport,
  }) {
    return deleteReport(reportId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function()? fetchReportStats,
    TResult? Function(int? page, int? limit, String? searchQuery,
            String? status, String? reason)?
        fetchReports,
    TResult? Function(String reportId)? deleteReport,
  }) {
    return deleteReport?.call(reportId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function()? fetchReportStats,
    TResult Function(int? page, int? limit, String? searchQuery, String? status,
            String? reason)?
        fetchReports,
    TResult Function(String reportId)? deleteReport,
    required TResult orElse(),
  }) {
    if (deleteReport != null) {
      return deleteReport(reportId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(FetchReportStats value) fetchReportStats,
    required TResult Function(FetchReports value) fetchReports,
    required TResult Function(DeleteReport value) deleteReport,
  }) {
    return deleteReport(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(FetchReportStats value)? fetchReportStats,
    TResult? Function(FetchReports value)? fetchReports,
    TResult? Function(DeleteReport value)? deleteReport,
  }) {
    return deleteReport?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(FetchReportStats value)? fetchReportStats,
    TResult Function(FetchReports value)? fetchReports,
    TResult Function(DeleteReport value)? deleteReport,
    required TResult orElse(),
  }) {
    if (deleteReport != null) {
      return deleteReport(this);
    }
    return orElse();
  }
}

abstract class DeleteReport implements ReportsEvent {
  const factory DeleteReport({required final String reportId}) =
      _$DeleteReportImpl;

  String get reportId;

  /// Create a copy of ReportsEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DeleteReportImplCopyWith<_$DeleteReportImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$ReportsState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() statsLoading,
    required TResult Function() listLoading,
    required TResult Function(ReportStatsModel stats) statsLoaded,
    required TResult Function(List<ReportModel> reports, int total, int page,
            int limit, int totalPages, bool hasNext, bool hasPrev)
        listLoaded,
    required TResult Function(
            ReportStatsModel stats,
            List<ReportModel> reports,
            int total,
            int page,
            int limit,
            int totalPages,
            bool hasNext,
            bool hasPrev)
        loaded,
    required TResult Function() reportDeleted,
    required TResult Function(String message) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? statsLoading,
    TResult? Function()? listLoading,
    TResult? Function(ReportStatsModel stats)? statsLoaded,
    TResult? Function(List<ReportModel> reports, int total, int page, int limit,
            int totalPages, bool hasNext, bool hasPrev)?
        listLoaded,
    TResult? Function(
            ReportStatsModel stats,
            List<ReportModel> reports,
            int total,
            int page,
            int limit,
            int totalPages,
            bool hasNext,
            bool hasPrev)?
        loaded,
    TResult? Function()? reportDeleted,
    TResult? Function(String message)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? statsLoading,
    TResult Function()? listLoading,
    TResult Function(ReportStatsModel stats)? statsLoaded,
    TResult Function(List<ReportModel> reports, int total, int page, int limit,
            int totalPages, bool hasNext, bool hasPrev)?
        listLoaded,
    TResult Function(
            ReportStatsModel stats,
            List<ReportModel> reports,
            int total,
            int page,
            int limit,
            int totalPages,
            bool hasNext,
            bool hasPrev)?
        loaded,
    TResult Function()? reportDeleted,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ReportsInitial value) initial,
    required TResult Function(ReportsLoading value) loading,
    required TResult Function(ReportsStatsLoading value) statsLoading,
    required TResult Function(ReportsListLoading value) listLoading,
    required TResult Function(ReportsStatsLoaded value) statsLoaded,
    required TResult Function(ReportsListLoaded value) listLoaded,
    required TResult Function(ReportsLoaded value) loaded,
    required TResult Function(ReportDeleted value) reportDeleted,
    required TResult Function(ReportsError value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ReportsInitial value)? initial,
    TResult? Function(ReportsLoading value)? loading,
    TResult? Function(ReportsStatsLoading value)? statsLoading,
    TResult? Function(ReportsListLoading value)? listLoading,
    TResult? Function(ReportsStatsLoaded value)? statsLoaded,
    TResult? Function(ReportsListLoaded value)? listLoaded,
    TResult? Function(ReportsLoaded value)? loaded,
    TResult? Function(ReportDeleted value)? reportDeleted,
    TResult? Function(ReportsError value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ReportsInitial value)? initial,
    TResult Function(ReportsLoading value)? loading,
    TResult Function(ReportsStatsLoading value)? statsLoading,
    TResult Function(ReportsListLoading value)? listLoading,
    TResult Function(ReportsStatsLoaded value)? statsLoaded,
    TResult Function(ReportsListLoaded value)? listLoaded,
    TResult Function(ReportsLoaded value)? loaded,
    TResult Function(ReportDeleted value)? reportDeleted,
    TResult Function(ReportsError value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReportsStateCopyWith<$Res> {
  factory $ReportsStateCopyWith(
          ReportsState value, $Res Function(ReportsState) then) =
      _$ReportsStateCopyWithImpl<$Res, ReportsState>;
}

/// @nodoc
class _$ReportsStateCopyWithImpl<$Res, $Val extends ReportsState>
    implements $ReportsStateCopyWith<$Res> {
  _$ReportsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ReportsState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$ReportsInitialImplCopyWith<$Res> {
  factory _$$ReportsInitialImplCopyWith(_$ReportsInitialImpl value,
          $Res Function(_$ReportsInitialImpl) then) =
      __$$ReportsInitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ReportsInitialImplCopyWithImpl<$Res>
    extends _$ReportsStateCopyWithImpl<$Res, _$ReportsInitialImpl>
    implements _$$ReportsInitialImplCopyWith<$Res> {
  __$$ReportsInitialImplCopyWithImpl(
      _$ReportsInitialImpl _value, $Res Function(_$ReportsInitialImpl) _then)
      : super(_value, _then);

  /// Create a copy of ReportsState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$ReportsInitialImpl implements ReportsInitial {
  const _$ReportsInitialImpl();

  @override
  String toString() {
    return 'ReportsState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ReportsInitialImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() statsLoading,
    required TResult Function() listLoading,
    required TResult Function(ReportStatsModel stats) statsLoaded,
    required TResult Function(List<ReportModel> reports, int total, int page,
            int limit, int totalPages, bool hasNext, bool hasPrev)
        listLoaded,
    required TResult Function(
            ReportStatsModel stats,
            List<ReportModel> reports,
            int total,
            int page,
            int limit,
            int totalPages,
            bool hasNext,
            bool hasPrev)
        loaded,
    required TResult Function() reportDeleted,
    required TResult Function(String message) error,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? statsLoading,
    TResult? Function()? listLoading,
    TResult? Function(ReportStatsModel stats)? statsLoaded,
    TResult? Function(List<ReportModel> reports, int total, int page, int limit,
            int totalPages, bool hasNext, bool hasPrev)?
        listLoaded,
    TResult? Function(
            ReportStatsModel stats,
            List<ReportModel> reports,
            int total,
            int page,
            int limit,
            int totalPages,
            bool hasNext,
            bool hasPrev)?
        loaded,
    TResult? Function()? reportDeleted,
    TResult? Function(String message)? error,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? statsLoading,
    TResult Function()? listLoading,
    TResult Function(ReportStatsModel stats)? statsLoaded,
    TResult Function(List<ReportModel> reports, int total, int page, int limit,
            int totalPages, bool hasNext, bool hasPrev)?
        listLoaded,
    TResult Function(
            ReportStatsModel stats,
            List<ReportModel> reports,
            int total,
            int page,
            int limit,
            int totalPages,
            bool hasNext,
            bool hasPrev)?
        loaded,
    TResult Function()? reportDeleted,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ReportsInitial value) initial,
    required TResult Function(ReportsLoading value) loading,
    required TResult Function(ReportsStatsLoading value) statsLoading,
    required TResult Function(ReportsListLoading value) listLoading,
    required TResult Function(ReportsStatsLoaded value) statsLoaded,
    required TResult Function(ReportsListLoaded value) listLoaded,
    required TResult Function(ReportsLoaded value) loaded,
    required TResult Function(ReportDeleted value) reportDeleted,
    required TResult Function(ReportsError value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ReportsInitial value)? initial,
    TResult? Function(ReportsLoading value)? loading,
    TResult? Function(ReportsStatsLoading value)? statsLoading,
    TResult? Function(ReportsListLoading value)? listLoading,
    TResult? Function(ReportsStatsLoaded value)? statsLoaded,
    TResult? Function(ReportsListLoaded value)? listLoaded,
    TResult? Function(ReportsLoaded value)? loaded,
    TResult? Function(ReportDeleted value)? reportDeleted,
    TResult? Function(ReportsError value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ReportsInitial value)? initial,
    TResult Function(ReportsLoading value)? loading,
    TResult Function(ReportsStatsLoading value)? statsLoading,
    TResult Function(ReportsListLoading value)? listLoading,
    TResult Function(ReportsStatsLoaded value)? statsLoaded,
    TResult Function(ReportsListLoaded value)? listLoaded,
    TResult Function(ReportsLoaded value)? loaded,
    TResult Function(ReportDeleted value)? reportDeleted,
    TResult Function(ReportsError value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class ReportsInitial implements ReportsState {
  const factory ReportsInitial() = _$ReportsInitialImpl;
}

/// @nodoc
abstract class _$$ReportsLoadingImplCopyWith<$Res> {
  factory _$$ReportsLoadingImplCopyWith(_$ReportsLoadingImpl value,
          $Res Function(_$ReportsLoadingImpl) then) =
      __$$ReportsLoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ReportsLoadingImplCopyWithImpl<$Res>
    extends _$ReportsStateCopyWithImpl<$Res, _$ReportsLoadingImpl>
    implements _$$ReportsLoadingImplCopyWith<$Res> {
  __$$ReportsLoadingImplCopyWithImpl(
      _$ReportsLoadingImpl _value, $Res Function(_$ReportsLoadingImpl) _then)
      : super(_value, _then);

  /// Create a copy of ReportsState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$ReportsLoadingImpl implements ReportsLoading {
  const _$ReportsLoadingImpl();

  @override
  String toString() {
    return 'ReportsState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ReportsLoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() statsLoading,
    required TResult Function() listLoading,
    required TResult Function(ReportStatsModel stats) statsLoaded,
    required TResult Function(List<ReportModel> reports, int total, int page,
            int limit, int totalPages, bool hasNext, bool hasPrev)
        listLoaded,
    required TResult Function(
            ReportStatsModel stats,
            List<ReportModel> reports,
            int total,
            int page,
            int limit,
            int totalPages,
            bool hasNext,
            bool hasPrev)
        loaded,
    required TResult Function() reportDeleted,
    required TResult Function(String message) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? statsLoading,
    TResult? Function()? listLoading,
    TResult? Function(ReportStatsModel stats)? statsLoaded,
    TResult? Function(List<ReportModel> reports, int total, int page, int limit,
            int totalPages, bool hasNext, bool hasPrev)?
        listLoaded,
    TResult? Function(
            ReportStatsModel stats,
            List<ReportModel> reports,
            int total,
            int page,
            int limit,
            int totalPages,
            bool hasNext,
            bool hasPrev)?
        loaded,
    TResult? Function()? reportDeleted,
    TResult? Function(String message)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? statsLoading,
    TResult Function()? listLoading,
    TResult Function(ReportStatsModel stats)? statsLoaded,
    TResult Function(List<ReportModel> reports, int total, int page, int limit,
            int totalPages, bool hasNext, bool hasPrev)?
        listLoaded,
    TResult Function(
            ReportStatsModel stats,
            List<ReportModel> reports,
            int total,
            int page,
            int limit,
            int totalPages,
            bool hasNext,
            bool hasPrev)?
        loaded,
    TResult Function()? reportDeleted,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ReportsInitial value) initial,
    required TResult Function(ReportsLoading value) loading,
    required TResult Function(ReportsStatsLoading value) statsLoading,
    required TResult Function(ReportsListLoading value) listLoading,
    required TResult Function(ReportsStatsLoaded value) statsLoaded,
    required TResult Function(ReportsListLoaded value) listLoaded,
    required TResult Function(ReportsLoaded value) loaded,
    required TResult Function(ReportDeleted value) reportDeleted,
    required TResult Function(ReportsError value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ReportsInitial value)? initial,
    TResult? Function(ReportsLoading value)? loading,
    TResult? Function(ReportsStatsLoading value)? statsLoading,
    TResult? Function(ReportsListLoading value)? listLoading,
    TResult? Function(ReportsStatsLoaded value)? statsLoaded,
    TResult? Function(ReportsListLoaded value)? listLoaded,
    TResult? Function(ReportsLoaded value)? loaded,
    TResult? Function(ReportDeleted value)? reportDeleted,
    TResult? Function(ReportsError value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ReportsInitial value)? initial,
    TResult Function(ReportsLoading value)? loading,
    TResult Function(ReportsStatsLoading value)? statsLoading,
    TResult Function(ReportsListLoading value)? listLoading,
    TResult Function(ReportsStatsLoaded value)? statsLoaded,
    TResult Function(ReportsListLoaded value)? listLoaded,
    TResult Function(ReportsLoaded value)? loaded,
    TResult Function(ReportDeleted value)? reportDeleted,
    TResult Function(ReportsError value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class ReportsLoading implements ReportsState {
  const factory ReportsLoading() = _$ReportsLoadingImpl;
}

/// @nodoc
abstract class _$$ReportsStatsLoadingImplCopyWith<$Res> {
  factory _$$ReportsStatsLoadingImplCopyWith(_$ReportsStatsLoadingImpl value,
          $Res Function(_$ReportsStatsLoadingImpl) then) =
      __$$ReportsStatsLoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ReportsStatsLoadingImplCopyWithImpl<$Res>
    extends _$ReportsStateCopyWithImpl<$Res, _$ReportsStatsLoadingImpl>
    implements _$$ReportsStatsLoadingImplCopyWith<$Res> {
  __$$ReportsStatsLoadingImplCopyWithImpl(_$ReportsStatsLoadingImpl _value,
      $Res Function(_$ReportsStatsLoadingImpl) _then)
      : super(_value, _then);

  /// Create a copy of ReportsState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$ReportsStatsLoadingImpl implements ReportsStatsLoading {
  const _$ReportsStatsLoadingImpl();

  @override
  String toString() {
    return 'ReportsState.statsLoading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReportsStatsLoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() statsLoading,
    required TResult Function() listLoading,
    required TResult Function(ReportStatsModel stats) statsLoaded,
    required TResult Function(List<ReportModel> reports, int total, int page,
            int limit, int totalPages, bool hasNext, bool hasPrev)
        listLoaded,
    required TResult Function(
            ReportStatsModel stats,
            List<ReportModel> reports,
            int total,
            int page,
            int limit,
            int totalPages,
            bool hasNext,
            bool hasPrev)
        loaded,
    required TResult Function() reportDeleted,
    required TResult Function(String message) error,
  }) {
    return statsLoading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? statsLoading,
    TResult? Function()? listLoading,
    TResult? Function(ReportStatsModel stats)? statsLoaded,
    TResult? Function(List<ReportModel> reports, int total, int page, int limit,
            int totalPages, bool hasNext, bool hasPrev)?
        listLoaded,
    TResult? Function(
            ReportStatsModel stats,
            List<ReportModel> reports,
            int total,
            int page,
            int limit,
            int totalPages,
            bool hasNext,
            bool hasPrev)?
        loaded,
    TResult? Function()? reportDeleted,
    TResult? Function(String message)? error,
  }) {
    return statsLoading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? statsLoading,
    TResult Function()? listLoading,
    TResult Function(ReportStatsModel stats)? statsLoaded,
    TResult Function(List<ReportModel> reports, int total, int page, int limit,
            int totalPages, bool hasNext, bool hasPrev)?
        listLoaded,
    TResult Function(
            ReportStatsModel stats,
            List<ReportModel> reports,
            int total,
            int page,
            int limit,
            int totalPages,
            bool hasNext,
            bool hasPrev)?
        loaded,
    TResult Function()? reportDeleted,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (statsLoading != null) {
      return statsLoading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ReportsInitial value) initial,
    required TResult Function(ReportsLoading value) loading,
    required TResult Function(ReportsStatsLoading value) statsLoading,
    required TResult Function(ReportsListLoading value) listLoading,
    required TResult Function(ReportsStatsLoaded value) statsLoaded,
    required TResult Function(ReportsListLoaded value) listLoaded,
    required TResult Function(ReportsLoaded value) loaded,
    required TResult Function(ReportDeleted value) reportDeleted,
    required TResult Function(ReportsError value) error,
  }) {
    return statsLoading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ReportsInitial value)? initial,
    TResult? Function(ReportsLoading value)? loading,
    TResult? Function(ReportsStatsLoading value)? statsLoading,
    TResult? Function(ReportsListLoading value)? listLoading,
    TResult? Function(ReportsStatsLoaded value)? statsLoaded,
    TResult? Function(ReportsListLoaded value)? listLoaded,
    TResult? Function(ReportsLoaded value)? loaded,
    TResult? Function(ReportDeleted value)? reportDeleted,
    TResult? Function(ReportsError value)? error,
  }) {
    return statsLoading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ReportsInitial value)? initial,
    TResult Function(ReportsLoading value)? loading,
    TResult Function(ReportsStatsLoading value)? statsLoading,
    TResult Function(ReportsListLoading value)? listLoading,
    TResult Function(ReportsStatsLoaded value)? statsLoaded,
    TResult Function(ReportsListLoaded value)? listLoaded,
    TResult Function(ReportsLoaded value)? loaded,
    TResult Function(ReportDeleted value)? reportDeleted,
    TResult Function(ReportsError value)? error,
    required TResult orElse(),
  }) {
    if (statsLoading != null) {
      return statsLoading(this);
    }
    return orElse();
  }
}

abstract class ReportsStatsLoading implements ReportsState {
  const factory ReportsStatsLoading() = _$ReportsStatsLoadingImpl;
}

/// @nodoc
abstract class _$$ReportsListLoadingImplCopyWith<$Res> {
  factory _$$ReportsListLoadingImplCopyWith(_$ReportsListLoadingImpl value,
          $Res Function(_$ReportsListLoadingImpl) then) =
      __$$ReportsListLoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ReportsListLoadingImplCopyWithImpl<$Res>
    extends _$ReportsStateCopyWithImpl<$Res, _$ReportsListLoadingImpl>
    implements _$$ReportsListLoadingImplCopyWith<$Res> {
  __$$ReportsListLoadingImplCopyWithImpl(_$ReportsListLoadingImpl _value,
      $Res Function(_$ReportsListLoadingImpl) _then)
      : super(_value, _then);

  /// Create a copy of ReportsState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$ReportsListLoadingImpl implements ReportsListLoading {
  const _$ReportsListLoadingImpl();

  @override
  String toString() {
    return 'ReportsState.listLoading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ReportsListLoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() statsLoading,
    required TResult Function() listLoading,
    required TResult Function(ReportStatsModel stats) statsLoaded,
    required TResult Function(List<ReportModel> reports, int total, int page,
            int limit, int totalPages, bool hasNext, bool hasPrev)
        listLoaded,
    required TResult Function(
            ReportStatsModel stats,
            List<ReportModel> reports,
            int total,
            int page,
            int limit,
            int totalPages,
            bool hasNext,
            bool hasPrev)
        loaded,
    required TResult Function() reportDeleted,
    required TResult Function(String message) error,
  }) {
    return listLoading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? statsLoading,
    TResult? Function()? listLoading,
    TResult? Function(ReportStatsModel stats)? statsLoaded,
    TResult? Function(List<ReportModel> reports, int total, int page, int limit,
            int totalPages, bool hasNext, bool hasPrev)?
        listLoaded,
    TResult? Function(
            ReportStatsModel stats,
            List<ReportModel> reports,
            int total,
            int page,
            int limit,
            int totalPages,
            bool hasNext,
            bool hasPrev)?
        loaded,
    TResult? Function()? reportDeleted,
    TResult? Function(String message)? error,
  }) {
    return listLoading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? statsLoading,
    TResult Function()? listLoading,
    TResult Function(ReportStatsModel stats)? statsLoaded,
    TResult Function(List<ReportModel> reports, int total, int page, int limit,
            int totalPages, bool hasNext, bool hasPrev)?
        listLoaded,
    TResult Function(
            ReportStatsModel stats,
            List<ReportModel> reports,
            int total,
            int page,
            int limit,
            int totalPages,
            bool hasNext,
            bool hasPrev)?
        loaded,
    TResult Function()? reportDeleted,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (listLoading != null) {
      return listLoading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ReportsInitial value) initial,
    required TResult Function(ReportsLoading value) loading,
    required TResult Function(ReportsStatsLoading value) statsLoading,
    required TResult Function(ReportsListLoading value) listLoading,
    required TResult Function(ReportsStatsLoaded value) statsLoaded,
    required TResult Function(ReportsListLoaded value) listLoaded,
    required TResult Function(ReportsLoaded value) loaded,
    required TResult Function(ReportDeleted value) reportDeleted,
    required TResult Function(ReportsError value) error,
  }) {
    return listLoading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ReportsInitial value)? initial,
    TResult? Function(ReportsLoading value)? loading,
    TResult? Function(ReportsStatsLoading value)? statsLoading,
    TResult? Function(ReportsListLoading value)? listLoading,
    TResult? Function(ReportsStatsLoaded value)? statsLoaded,
    TResult? Function(ReportsListLoaded value)? listLoaded,
    TResult? Function(ReportsLoaded value)? loaded,
    TResult? Function(ReportDeleted value)? reportDeleted,
    TResult? Function(ReportsError value)? error,
  }) {
    return listLoading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ReportsInitial value)? initial,
    TResult Function(ReportsLoading value)? loading,
    TResult Function(ReportsStatsLoading value)? statsLoading,
    TResult Function(ReportsListLoading value)? listLoading,
    TResult Function(ReportsStatsLoaded value)? statsLoaded,
    TResult Function(ReportsListLoaded value)? listLoaded,
    TResult Function(ReportsLoaded value)? loaded,
    TResult Function(ReportDeleted value)? reportDeleted,
    TResult Function(ReportsError value)? error,
    required TResult orElse(),
  }) {
    if (listLoading != null) {
      return listLoading(this);
    }
    return orElse();
  }
}

abstract class ReportsListLoading implements ReportsState {
  const factory ReportsListLoading() = _$ReportsListLoadingImpl;
}

/// @nodoc
abstract class _$$ReportsStatsLoadedImplCopyWith<$Res> {
  factory _$$ReportsStatsLoadedImplCopyWith(_$ReportsStatsLoadedImpl value,
          $Res Function(_$ReportsStatsLoadedImpl) then) =
      __$$ReportsStatsLoadedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({ReportStatsModel stats});
}

/// @nodoc
class __$$ReportsStatsLoadedImplCopyWithImpl<$Res>
    extends _$ReportsStateCopyWithImpl<$Res, _$ReportsStatsLoadedImpl>
    implements _$$ReportsStatsLoadedImplCopyWith<$Res> {
  __$$ReportsStatsLoadedImplCopyWithImpl(_$ReportsStatsLoadedImpl _value,
      $Res Function(_$ReportsStatsLoadedImpl) _then)
      : super(_value, _then);

  /// Create a copy of ReportsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? stats = null,
  }) {
    return _then(_$ReportsStatsLoadedImpl(
      stats: null == stats
          ? _value.stats
          : stats // ignore: cast_nullable_to_non_nullable
              as ReportStatsModel,
    ));
  }
}

/// @nodoc

class _$ReportsStatsLoadedImpl implements ReportsStatsLoaded {
  const _$ReportsStatsLoadedImpl({required this.stats});

  @override
  final ReportStatsModel stats;

  @override
  String toString() {
    return 'ReportsState.statsLoaded(stats: $stats)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReportsStatsLoadedImpl &&
            (identical(other.stats, stats) || other.stats == stats));
  }

  @override
  int get hashCode => Object.hash(runtimeType, stats);

  /// Create a copy of ReportsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ReportsStatsLoadedImplCopyWith<_$ReportsStatsLoadedImpl> get copyWith =>
      __$$ReportsStatsLoadedImplCopyWithImpl<_$ReportsStatsLoadedImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() statsLoading,
    required TResult Function() listLoading,
    required TResult Function(ReportStatsModel stats) statsLoaded,
    required TResult Function(List<ReportModel> reports, int total, int page,
            int limit, int totalPages, bool hasNext, bool hasPrev)
        listLoaded,
    required TResult Function(
            ReportStatsModel stats,
            List<ReportModel> reports,
            int total,
            int page,
            int limit,
            int totalPages,
            bool hasNext,
            bool hasPrev)
        loaded,
    required TResult Function() reportDeleted,
    required TResult Function(String message) error,
  }) {
    return statsLoaded(stats);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? statsLoading,
    TResult? Function()? listLoading,
    TResult? Function(ReportStatsModel stats)? statsLoaded,
    TResult? Function(List<ReportModel> reports, int total, int page, int limit,
            int totalPages, bool hasNext, bool hasPrev)?
        listLoaded,
    TResult? Function(
            ReportStatsModel stats,
            List<ReportModel> reports,
            int total,
            int page,
            int limit,
            int totalPages,
            bool hasNext,
            bool hasPrev)?
        loaded,
    TResult? Function()? reportDeleted,
    TResult? Function(String message)? error,
  }) {
    return statsLoaded?.call(stats);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? statsLoading,
    TResult Function()? listLoading,
    TResult Function(ReportStatsModel stats)? statsLoaded,
    TResult Function(List<ReportModel> reports, int total, int page, int limit,
            int totalPages, bool hasNext, bool hasPrev)?
        listLoaded,
    TResult Function(
            ReportStatsModel stats,
            List<ReportModel> reports,
            int total,
            int page,
            int limit,
            int totalPages,
            bool hasNext,
            bool hasPrev)?
        loaded,
    TResult Function()? reportDeleted,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (statsLoaded != null) {
      return statsLoaded(stats);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ReportsInitial value) initial,
    required TResult Function(ReportsLoading value) loading,
    required TResult Function(ReportsStatsLoading value) statsLoading,
    required TResult Function(ReportsListLoading value) listLoading,
    required TResult Function(ReportsStatsLoaded value) statsLoaded,
    required TResult Function(ReportsListLoaded value) listLoaded,
    required TResult Function(ReportsLoaded value) loaded,
    required TResult Function(ReportDeleted value) reportDeleted,
    required TResult Function(ReportsError value) error,
  }) {
    return statsLoaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ReportsInitial value)? initial,
    TResult? Function(ReportsLoading value)? loading,
    TResult? Function(ReportsStatsLoading value)? statsLoading,
    TResult? Function(ReportsListLoading value)? listLoading,
    TResult? Function(ReportsStatsLoaded value)? statsLoaded,
    TResult? Function(ReportsListLoaded value)? listLoaded,
    TResult? Function(ReportsLoaded value)? loaded,
    TResult? Function(ReportDeleted value)? reportDeleted,
    TResult? Function(ReportsError value)? error,
  }) {
    return statsLoaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ReportsInitial value)? initial,
    TResult Function(ReportsLoading value)? loading,
    TResult Function(ReportsStatsLoading value)? statsLoading,
    TResult Function(ReportsListLoading value)? listLoading,
    TResult Function(ReportsStatsLoaded value)? statsLoaded,
    TResult Function(ReportsListLoaded value)? listLoaded,
    TResult Function(ReportsLoaded value)? loaded,
    TResult Function(ReportDeleted value)? reportDeleted,
    TResult Function(ReportsError value)? error,
    required TResult orElse(),
  }) {
    if (statsLoaded != null) {
      return statsLoaded(this);
    }
    return orElse();
  }
}

abstract class ReportsStatsLoaded implements ReportsState {
  const factory ReportsStatsLoaded({required final ReportStatsModel stats}) =
      _$ReportsStatsLoadedImpl;

  ReportStatsModel get stats;

  /// Create a copy of ReportsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ReportsStatsLoadedImplCopyWith<_$ReportsStatsLoadedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ReportsListLoadedImplCopyWith<$Res> {
  factory _$$ReportsListLoadedImplCopyWith(_$ReportsListLoadedImpl value,
          $Res Function(_$ReportsListLoadedImpl) then) =
      __$$ReportsListLoadedImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {List<ReportModel> reports,
      int total,
      int page,
      int limit,
      int totalPages,
      bool hasNext,
      bool hasPrev});
}

/// @nodoc
class __$$ReportsListLoadedImplCopyWithImpl<$Res>
    extends _$ReportsStateCopyWithImpl<$Res, _$ReportsListLoadedImpl>
    implements _$$ReportsListLoadedImplCopyWith<$Res> {
  __$$ReportsListLoadedImplCopyWithImpl(_$ReportsListLoadedImpl _value,
      $Res Function(_$ReportsListLoadedImpl) _then)
      : super(_value, _then);

  /// Create a copy of ReportsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? reports = null,
    Object? total = null,
    Object? page = null,
    Object? limit = null,
    Object? totalPages = null,
    Object? hasNext = null,
    Object? hasPrev = null,
  }) {
    return _then(_$ReportsListLoadedImpl(
      reports: null == reports
          ? _value._reports
          : reports // ignore: cast_nullable_to_non_nullable
              as List<ReportModel>,
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int,
      page: null == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
      limit: null == limit
          ? _value.limit
          : limit // ignore: cast_nullable_to_non_nullable
              as int,
      totalPages: null == totalPages
          ? _value.totalPages
          : totalPages // ignore: cast_nullable_to_non_nullable
              as int,
      hasNext: null == hasNext
          ? _value.hasNext
          : hasNext // ignore: cast_nullable_to_non_nullable
              as bool,
      hasPrev: null == hasPrev
          ? _value.hasPrev
          : hasPrev // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$ReportsListLoadedImpl implements ReportsListLoaded {
  const _$ReportsListLoadedImpl(
      {required final List<ReportModel> reports,
      required this.total,
      required this.page,
      required this.limit,
      required this.totalPages,
      required this.hasNext,
      required this.hasPrev})
      : _reports = reports;

  final List<ReportModel> _reports;
  @override
  List<ReportModel> get reports {
    if (_reports is EqualUnmodifiableListView) return _reports;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_reports);
  }

  @override
  final int total;
  @override
  final int page;
  @override
  final int limit;
  @override
  final int totalPages;
  @override
  final bool hasNext;
  @override
  final bool hasPrev;

  @override
  String toString() {
    return 'ReportsState.listLoaded(reports: $reports, total: $total, page: $page, limit: $limit, totalPages: $totalPages, hasNext: $hasNext, hasPrev: $hasPrev)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReportsListLoadedImpl &&
            const DeepCollectionEquality().equals(other._reports, _reports) &&
            (identical(other.total, total) || other.total == total) &&
            (identical(other.page, page) || other.page == page) &&
            (identical(other.limit, limit) || other.limit == limit) &&
            (identical(other.totalPages, totalPages) ||
                other.totalPages == totalPages) &&
            (identical(other.hasNext, hasNext) || other.hasNext == hasNext) &&
            (identical(other.hasPrev, hasPrev) || other.hasPrev == hasPrev));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_reports),
      total,
      page,
      limit,
      totalPages,
      hasNext,
      hasPrev);

  /// Create a copy of ReportsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ReportsListLoadedImplCopyWith<_$ReportsListLoadedImpl> get copyWith =>
      __$$ReportsListLoadedImplCopyWithImpl<_$ReportsListLoadedImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() statsLoading,
    required TResult Function() listLoading,
    required TResult Function(ReportStatsModel stats) statsLoaded,
    required TResult Function(List<ReportModel> reports, int total, int page,
            int limit, int totalPages, bool hasNext, bool hasPrev)
        listLoaded,
    required TResult Function(
            ReportStatsModel stats,
            List<ReportModel> reports,
            int total,
            int page,
            int limit,
            int totalPages,
            bool hasNext,
            bool hasPrev)
        loaded,
    required TResult Function() reportDeleted,
    required TResult Function(String message) error,
  }) {
    return listLoaded(
        reports, total, page, limit, totalPages, hasNext, hasPrev);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? statsLoading,
    TResult? Function()? listLoading,
    TResult? Function(ReportStatsModel stats)? statsLoaded,
    TResult? Function(List<ReportModel> reports, int total, int page, int limit,
            int totalPages, bool hasNext, bool hasPrev)?
        listLoaded,
    TResult? Function(
            ReportStatsModel stats,
            List<ReportModel> reports,
            int total,
            int page,
            int limit,
            int totalPages,
            bool hasNext,
            bool hasPrev)?
        loaded,
    TResult? Function()? reportDeleted,
    TResult? Function(String message)? error,
  }) {
    return listLoaded?.call(
        reports, total, page, limit, totalPages, hasNext, hasPrev);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? statsLoading,
    TResult Function()? listLoading,
    TResult Function(ReportStatsModel stats)? statsLoaded,
    TResult Function(List<ReportModel> reports, int total, int page, int limit,
            int totalPages, bool hasNext, bool hasPrev)?
        listLoaded,
    TResult Function(
            ReportStatsModel stats,
            List<ReportModel> reports,
            int total,
            int page,
            int limit,
            int totalPages,
            bool hasNext,
            bool hasPrev)?
        loaded,
    TResult Function()? reportDeleted,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (listLoaded != null) {
      return listLoaded(
          reports, total, page, limit, totalPages, hasNext, hasPrev);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ReportsInitial value) initial,
    required TResult Function(ReportsLoading value) loading,
    required TResult Function(ReportsStatsLoading value) statsLoading,
    required TResult Function(ReportsListLoading value) listLoading,
    required TResult Function(ReportsStatsLoaded value) statsLoaded,
    required TResult Function(ReportsListLoaded value) listLoaded,
    required TResult Function(ReportsLoaded value) loaded,
    required TResult Function(ReportDeleted value) reportDeleted,
    required TResult Function(ReportsError value) error,
  }) {
    return listLoaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ReportsInitial value)? initial,
    TResult? Function(ReportsLoading value)? loading,
    TResult? Function(ReportsStatsLoading value)? statsLoading,
    TResult? Function(ReportsListLoading value)? listLoading,
    TResult? Function(ReportsStatsLoaded value)? statsLoaded,
    TResult? Function(ReportsListLoaded value)? listLoaded,
    TResult? Function(ReportsLoaded value)? loaded,
    TResult? Function(ReportDeleted value)? reportDeleted,
    TResult? Function(ReportsError value)? error,
  }) {
    return listLoaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ReportsInitial value)? initial,
    TResult Function(ReportsLoading value)? loading,
    TResult Function(ReportsStatsLoading value)? statsLoading,
    TResult Function(ReportsListLoading value)? listLoading,
    TResult Function(ReportsStatsLoaded value)? statsLoaded,
    TResult Function(ReportsListLoaded value)? listLoaded,
    TResult Function(ReportsLoaded value)? loaded,
    TResult Function(ReportDeleted value)? reportDeleted,
    TResult Function(ReportsError value)? error,
    required TResult orElse(),
  }) {
    if (listLoaded != null) {
      return listLoaded(this);
    }
    return orElse();
  }
}

abstract class ReportsListLoaded implements ReportsState {
  const factory ReportsListLoaded(
      {required final List<ReportModel> reports,
      required final int total,
      required final int page,
      required final int limit,
      required final int totalPages,
      required final bool hasNext,
      required final bool hasPrev}) = _$ReportsListLoadedImpl;

  List<ReportModel> get reports;
  int get total;
  int get page;
  int get limit;
  int get totalPages;
  bool get hasNext;
  bool get hasPrev;

  /// Create a copy of ReportsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ReportsListLoadedImplCopyWith<_$ReportsListLoadedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ReportsLoadedImplCopyWith<$Res> {
  factory _$$ReportsLoadedImplCopyWith(
          _$ReportsLoadedImpl value, $Res Function(_$ReportsLoadedImpl) then) =
      __$$ReportsLoadedImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {ReportStatsModel stats,
      List<ReportModel> reports,
      int total,
      int page,
      int limit,
      int totalPages,
      bool hasNext,
      bool hasPrev});
}

/// @nodoc
class __$$ReportsLoadedImplCopyWithImpl<$Res>
    extends _$ReportsStateCopyWithImpl<$Res, _$ReportsLoadedImpl>
    implements _$$ReportsLoadedImplCopyWith<$Res> {
  __$$ReportsLoadedImplCopyWithImpl(
      _$ReportsLoadedImpl _value, $Res Function(_$ReportsLoadedImpl) _then)
      : super(_value, _then);

  /// Create a copy of ReportsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? stats = null,
    Object? reports = null,
    Object? total = null,
    Object? page = null,
    Object? limit = null,
    Object? totalPages = null,
    Object? hasNext = null,
    Object? hasPrev = null,
  }) {
    return _then(_$ReportsLoadedImpl(
      stats: null == stats
          ? _value.stats
          : stats // ignore: cast_nullable_to_non_nullable
              as ReportStatsModel,
      reports: null == reports
          ? _value._reports
          : reports // ignore: cast_nullable_to_non_nullable
              as List<ReportModel>,
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int,
      page: null == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
      limit: null == limit
          ? _value.limit
          : limit // ignore: cast_nullable_to_non_nullable
              as int,
      totalPages: null == totalPages
          ? _value.totalPages
          : totalPages // ignore: cast_nullable_to_non_nullable
              as int,
      hasNext: null == hasNext
          ? _value.hasNext
          : hasNext // ignore: cast_nullable_to_non_nullable
              as bool,
      hasPrev: null == hasPrev
          ? _value.hasPrev
          : hasPrev // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$ReportsLoadedImpl implements ReportsLoaded {
  const _$ReportsLoadedImpl(
      {required this.stats,
      required final List<ReportModel> reports,
      required this.total,
      required this.page,
      required this.limit,
      required this.totalPages,
      required this.hasNext,
      required this.hasPrev})
      : _reports = reports;

  @override
  final ReportStatsModel stats;
  final List<ReportModel> _reports;
  @override
  List<ReportModel> get reports {
    if (_reports is EqualUnmodifiableListView) return _reports;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_reports);
  }

  @override
  final int total;
  @override
  final int page;
  @override
  final int limit;
  @override
  final int totalPages;
  @override
  final bool hasNext;
  @override
  final bool hasPrev;

  @override
  String toString() {
    return 'ReportsState.loaded(stats: $stats, reports: $reports, total: $total, page: $page, limit: $limit, totalPages: $totalPages, hasNext: $hasNext, hasPrev: $hasPrev)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReportsLoadedImpl &&
            (identical(other.stats, stats) || other.stats == stats) &&
            const DeepCollectionEquality().equals(other._reports, _reports) &&
            (identical(other.total, total) || other.total == total) &&
            (identical(other.page, page) || other.page == page) &&
            (identical(other.limit, limit) || other.limit == limit) &&
            (identical(other.totalPages, totalPages) ||
                other.totalPages == totalPages) &&
            (identical(other.hasNext, hasNext) || other.hasNext == hasNext) &&
            (identical(other.hasPrev, hasPrev) || other.hasPrev == hasPrev));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      stats,
      const DeepCollectionEquality().hash(_reports),
      total,
      page,
      limit,
      totalPages,
      hasNext,
      hasPrev);

  /// Create a copy of ReportsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ReportsLoadedImplCopyWith<_$ReportsLoadedImpl> get copyWith =>
      __$$ReportsLoadedImplCopyWithImpl<_$ReportsLoadedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() statsLoading,
    required TResult Function() listLoading,
    required TResult Function(ReportStatsModel stats) statsLoaded,
    required TResult Function(List<ReportModel> reports, int total, int page,
            int limit, int totalPages, bool hasNext, bool hasPrev)
        listLoaded,
    required TResult Function(
            ReportStatsModel stats,
            List<ReportModel> reports,
            int total,
            int page,
            int limit,
            int totalPages,
            bool hasNext,
            bool hasPrev)
        loaded,
    required TResult Function() reportDeleted,
    required TResult Function(String message) error,
  }) {
    return loaded(
        stats, reports, total, page, limit, totalPages, hasNext, hasPrev);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? statsLoading,
    TResult? Function()? listLoading,
    TResult? Function(ReportStatsModel stats)? statsLoaded,
    TResult? Function(List<ReportModel> reports, int total, int page, int limit,
            int totalPages, bool hasNext, bool hasPrev)?
        listLoaded,
    TResult? Function(
            ReportStatsModel stats,
            List<ReportModel> reports,
            int total,
            int page,
            int limit,
            int totalPages,
            bool hasNext,
            bool hasPrev)?
        loaded,
    TResult? Function()? reportDeleted,
    TResult? Function(String message)? error,
  }) {
    return loaded?.call(
        stats, reports, total, page, limit, totalPages, hasNext, hasPrev);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? statsLoading,
    TResult Function()? listLoading,
    TResult Function(ReportStatsModel stats)? statsLoaded,
    TResult Function(List<ReportModel> reports, int total, int page, int limit,
            int totalPages, bool hasNext, bool hasPrev)?
        listLoaded,
    TResult Function(
            ReportStatsModel stats,
            List<ReportModel> reports,
            int total,
            int page,
            int limit,
            int totalPages,
            bool hasNext,
            bool hasPrev)?
        loaded,
    TResult Function()? reportDeleted,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(
          stats, reports, total, page, limit, totalPages, hasNext, hasPrev);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ReportsInitial value) initial,
    required TResult Function(ReportsLoading value) loading,
    required TResult Function(ReportsStatsLoading value) statsLoading,
    required TResult Function(ReportsListLoading value) listLoading,
    required TResult Function(ReportsStatsLoaded value) statsLoaded,
    required TResult Function(ReportsListLoaded value) listLoaded,
    required TResult Function(ReportsLoaded value) loaded,
    required TResult Function(ReportDeleted value) reportDeleted,
    required TResult Function(ReportsError value) error,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ReportsInitial value)? initial,
    TResult? Function(ReportsLoading value)? loading,
    TResult? Function(ReportsStatsLoading value)? statsLoading,
    TResult? Function(ReportsListLoading value)? listLoading,
    TResult? Function(ReportsStatsLoaded value)? statsLoaded,
    TResult? Function(ReportsListLoaded value)? listLoaded,
    TResult? Function(ReportsLoaded value)? loaded,
    TResult? Function(ReportDeleted value)? reportDeleted,
    TResult? Function(ReportsError value)? error,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ReportsInitial value)? initial,
    TResult Function(ReportsLoading value)? loading,
    TResult Function(ReportsStatsLoading value)? statsLoading,
    TResult Function(ReportsListLoading value)? listLoading,
    TResult Function(ReportsStatsLoaded value)? statsLoaded,
    TResult Function(ReportsListLoaded value)? listLoaded,
    TResult Function(ReportsLoaded value)? loaded,
    TResult Function(ReportDeleted value)? reportDeleted,
    TResult Function(ReportsError value)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class ReportsLoaded implements ReportsState {
  const factory ReportsLoaded(
      {required final ReportStatsModel stats,
      required final List<ReportModel> reports,
      required final int total,
      required final int page,
      required final int limit,
      required final int totalPages,
      required final bool hasNext,
      required final bool hasPrev}) = _$ReportsLoadedImpl;

  ReportStatsModel get stats;
  List<ReportModel> get reports;
  int get total;
  int get page;
  int get limit;
  int get totalPages;
  bool get hasNext;
  bool get hasPrev;

  /// Create a copy of ReportsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ReportsLoadedImplCopyWith<_$ReportsLoadedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ReportDeletedImplCopyWith<$Res> {
  factory _$$ReportDeletedImplCopyWith(
          _$ReportDeletedImpl value, $Res Function(_$ReportDeletedImpl) then) =
      __$$ReportDeletedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ReportDeletedImplCopyWithImpl<$Res>
    extends _$ReportsStateCopyWithImpl<$Res, _$ReportDeletedImpl>
    implements _$$ReportDeletedImplCopyWith<$Res> {
  __$$ReportDeletedImplCopyWithImpl(
      _$ReportDeletedImpl _value, $Res Function(_$ReportDeletedImpl) _then)
      : super(_value, _then);

  /// Create a copy of ReportsState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$ReportDeletedImpl implements ReportDeleted {
  const _$ReportDeletedImpl();

  @override
  String toString() {
    return 'ReportsState.reportDeleted()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ReportDeletedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() statsLoading,
    required TResult Function() listLoading,
    required TResult Function(ReportStatsModel stats) statsLoaded,
    required TResult Function(List<ReportModel> reports, int total, int page,
            int limit, int totalPages, bool hasNext, bool hasPrev)
        listLoaded,
    required TResult Function(
            ReportStatsModel stats,
            List<ReportModel> reports,
            int total,
            int page,
            int limit,
            int totalPages,
            bool hasNext,
            bool hasPrev)
        loaded,
    required TResult Function() reportDeleted,
    required TResult Function(String message) error,
  }) {
    return reportDeleted();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? statsLoading,
    TResult? Function()? listLoading,
    TResult? Function(ReportStatsModel stats)? statsLoaded,
    TResult? Function(List<ReportModel> reports, int total, int page, int limit,
            int totalPages, bool hasNext, bool hasPrev)?
        listLoaded,
    TResult? Function(
            ReportStatsModel stats,
            List<ReportModel> reports,
            int total,
            int page,
            int limit,
            int totalPages,
            bool hasNext,
            bool hasPrev)?
        loaded,
    TResult? Function()? reportDeleted,
    TResult? Function(String message)? error,
  }) {
    return reportDeleted?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? statsLoading,
    TResult Function()? listLoading,
    TResult Function(ReportStatsModel stats)? statsLoaded,
    TResult Function(List<ReportModel> reports, int total, int page, int limit,
            int totalPages, bool hasNext, bool hasPrev)?
        listLoaded,
    TResult Function(
            ReportStatsModel stats,
            List<ReportModel> reports,
            int total,
            int page,
            int limit,
            int totalPages,
            bool hasNext,
            bool hasPrev)?
        loaded,
    TResult Function()? reportDeleted,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (reportDeleted != null) {
      return reportDeleted();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ReportsInitial value) initial,
    required TResult Function(ReportsLoading value) loading,
    required TResult Function(ReportsStatsLoading value) statsLoading,
    required TResult Function(ReportsListLoading value) listLoading,
    required TResult Function(ReportsStatsLoaded value) statsLoaded,
    required TResult Function(ReportsListLoaded value) listLoaded,
    required TResult Function(ReportsLoaded value) loaded,
    required TResult Function(ReportDeleted value) reportDeleted,
    required TResult Function(ReportsError value) error,
  }) {
    return reportDeleted(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ReportsInitial value)? initial,
    TResult? Function(ReportsLoading value)? loading,
    TResult? Function(ReportsStatsLoading value)? statsLoading,
    TResult? Function(ReportsListLoading value)? listLoading,
    TResult? Function(ReportsStatsLoaded value)? statsLoaded,
    TResult? Function(ReportsListLoaded value)? listLoaded,
    TResult? Function(ReportsLoaded value)? loaded,
    TResult? Function(ReportDeleted value)? reportDeleted,
    TResult? Function(ReportsError value)? error,
  }) {
    return reportDeleted?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ReportsInitial value)? initial,
    TResult Function(ReportsLoading value)? loading,
    TResult Function(ReportsStatsLoading value)? statsLoading,
    TResult Function(ReportsListLoading value)? listLoading,
    TResult Function(ReportsStatsLoaded value)? statsLoaded,
    TResult Function(ReportsListLoaded value)? listLoaded,
    TResult Function(ReportsLoaded value)? loaded,
    TResult Function(ReportDeleted value)? reportDeleted,
    TResult Function(ReportsError value)? error,
    required TResult orElse(),
  }) {
    if (reportDeleted != null) {
      return reportDeleted(this);
    }
    return orElse();
  }
}

abstract class ReportDeleted implements ReportsState {
  const factory ReportDeleted() = _$ReportDeletedImpl;
}

/// @nodoc
abstract class _$$ReportsErrorImplCopyWith<$Res> {
  factory _$$ReportsErrorImplCopyWith(
          _$ReportsErrorImpl value, $Res Function(_$ReportsErrorImpl) then) =
      __$$ReportsErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$ReportsErrorImplCopyWithImpl<$Res>
    extends _$ReportsStateCopyWithImpl<$Res, _$ReportsErrorImpl>
    implements _$$ReportsErrorImplCopyWith<$Res> {
  __$$ReportsErrorImplCopyWithImpl(
      _$ReportsErrorImpl _value, $Res Function(_$ReportsErrorImpl) _then)
      : super(_value, _then);

  /// Create a copy of ReportsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$ReportsErrorImpl(
      null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ReportsErrorImpl implements ReportsError {
  const _$ReportsErrorImpl(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'ReportsState.error(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReportsErrorImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  /// Create a copy of ReportsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ReportsErrorImplCopyWith<_$ReportsErrorImpl> get copyWith =>
      __$$ReportsErrorImplCopyWithImpl<_$ReportsErrorImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() statsLoading,
    required TResult Function() listLoading,
    required TResult Function(ReportStatsModel stats) statsLoaded,
    required TResult Function(List<ReportModel> reports, int total, int page,
            int limit, int totalPages, bool hasNext, bool hasPrev)
        listLoaded,
    required TResult Function(
            ReportStatsModel stats,
            List<ReportModel> reports,
            int total,
            int page,
            int limit,
            int totalPages,
            bool hasNext,
            bool hasPrev)
        loaded,
    required TResult Function() reportDeleted,
    required TResult Function(String message) error,
  }) {
    return error(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? statsLoading,
    TResult? Function()? listLoading,
    TResult? Function(ReportStatsModel stats)? statsLoaded,
    TResult? Function(List<ReportModel> reports, int total, int page, int limit,
            int totalPages, bool hasNext, bool hasPrev)?
        listLoaded,
    TResult? Function(
            ReportStatsModel stats,
            List<ReportModel> reports,
            int total,
            int page,
            int limit,
            int totalPages,
            bool hasNext,
            bool hasPrev)?
        loaded,
    TResult? Function()? reportDeleted,
    TResult? Function(String message)? error,
  }) {
    return error?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? statsLoading,
    TResult Function()? listLoading,
    TResult Function(ReportStatsModel stats)? statsLoaded,
    TResult Function(List<ReportModel> reports, int total, int page, int limit,
            int totalPages, bool hasNext, bool hasPrev)?
        listLoaded,
    TResult Function(
            ReportStatsModel stats,
            List<ReportModel> reports,
            int total,
            int page,
            int limit,
            int totalPages,
            bool hasNext,
            bool hasPrev)?
        loaded,
    TResult Function()? reportDeleted,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ReportsInitial value) initial,
    required TResult Function(ReportsLoading value) loading,
    required TResult Function(ReportsStatsLoading value) statsLoading,
    required TResult Function(ReportsListLoading value) listLoading,
    required TResult Function(ReportsStatsLoaded value) statsLoaded,
    required TResult Function(ReportsListLoaded value) listLoaded,
    required TResult Function(ReportsLoaded value) loaded,
    required TResult Function(ReportDeleted value) reportDeleted,
    required TResult Function(ReportsError value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ReportsInitial value)? initial,
    TResult? Function(ReportsLoading value)? loading,
    TResult? Function(ReportsStatsLoading value)? statsLoading,
    TResult? Function(ReportsListLoading value)? listLoading,
    TResult? Function(ReportsStatsLoaded value)? statsLoaded,
    TResult? Function(ReportsListLoaded value)? listLoaded,
    TResult? Function(ReportsLoaded value)? loaded,
    TResult? Function(ReportDeleted value)? reportDeleted,
    TResult? Function(ReportsError value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ReportsInitial value)? initial,
    TResult Function(ReportsLoading value)? loading,
    TResult Function(ReportsStatsLoading value)? statsLoading,
    TResult Function(ReportsListLoading value)? listLoading,
    TResult Function(ReportsStatsLoaded value)? statsLoaded,
    TResult Function(ReportsListLoaded value)? listLoaded,
    TResult Function(ReportsLoaded value)? loaded,
    TResult Function(ReportDeleted value)? reportDeleted,
    TResult Function(ReportsError value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class ReportsError implements ReportsState {
  const factory ReportsError(final String message) = _$ReportsErrorImpl;

  String get message;

  /// Create a copy of ReportsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ReportsErrorImplCopyWith<_$ReportsErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
