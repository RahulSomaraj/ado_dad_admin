// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'banner_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$BannerEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(String title, String link, Uint8List desktopImage,
            Uint8List tabletImage, Uint8List phoneImage)
        uploadBannerToS3,
    required TResult Function(int? page, int? limit, String? searchQuery)
        fetchAllBanners,
    required TResult Function(BannerUploadRequest updatedBanner) updateBanner,
    required TResult Function(String bannerId) deleteBanner,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(String title, String link, Uint8List desktopImage,
            Uint8List tabletImage, Uint8List phoneImage)?
        uploadBannerToS3,
    TResult? Function(int? page, int? limit, String? searchQuery)?
        fetchAllBanners,
    TResult? Function(BannerUploadRequest updatedBanner)? updateBanner,
    TResult? Function(String bannerId)? deleteBanner,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(String title, String link, Uint8List desktopImage,
            Uint8List tabletImage, Uint8List phoneImage)?
        uploadBannerToS3,
    TResult Function(int? page, int? limit, String? searchQuery)?
        fetchAllBanners,
    TResult Function(BannerUploadRequest updatedBanner)? updateBanner,
    TResult Function(String bannerId)? deleteBanner,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_UploadBannersToS3 value) uploadBannerToS3,
    required TResult Function(FetchAllBanners value) fetchAllBanners,
    required TResult Function(UpdateBanner value) updateBanner,
    required TResult Function(DeleteBanner value) deleteBanner,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_UploadBannersToS3 value)? uploadBannerToS3,
    TResult? Function(FetchAllBanners value)? fetchAllBanners,
    TResult? Function(UpdateBanner value)? updateBanner,
    TResult? Function(DeleteBanner value)? deleteBanner,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_UploadBannersToS3 value)? uploadBannerToS3,
    TResult Function(FetchAllBanners value)? fetchAllBanners,
    TResult Function(UpdateBanner value)? updateBanner,
    TResult Function(DeleteBanner value)? deleteBanner,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BannerEventCopyWith<$Res> {
  factory $BannerEventCopyWith(
          BannerEvent value, $Res Function(BannerEvent) then) =
      _$BannerEventCopyWithImpl<$Res, BannerEvent>;
}

/// @nodoc
class _$BannerEventCopyWithImpl<$Res, $Val extends BannerEvent>
    implements $BannerEventCopyWith<$Res> {
  _$BannerEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of BannerEvent
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
    extends _$BannerEventCopyWithImpl<$Res, _$StartedImpl>
    implements _$$StartedImplCopyWith<$Res> {
  __$$StartedImplCopyWithImpl(
      _$StartedImpl _value, $Res Function(_$StartedImpl) _then)
      : super(_value, _then);

  /// Create a copy of BannerEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$StartedImpl implements _Started {
  const _$StartedImpl();

  @override
  String toString() {
    return 'BannerEvent.started()';
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
    required TResult Function(String title, String link, Uint8List desktopImage,
            Uint8List tabletImage, Uint8List phoneImage)
        uploadBannerToS3,
    required TResult Function(int? page, int? limit, String? searchQuery)
        fetchAllBanners,
    required TResult Function(BannerUploadRequest updatedBanner) updateBanner,
    required TResult Function(String bannerId) deleteBanner,
  }) {
    return started();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(String title, String link, Uint8List desktopImage,
            Uint8List tabletImage, Uint8List phoneImage)?
        uploadBannerToS3,
    TResult? Function(int? page, int? limit, String? searchQuery)?
        fetchAllBanners,
    TResult? Function(BannerUploadRequest updatedBanner)? updateBanner,
    TResult? Function(String bannerId)? deleteBanner,
  }) {
    return started?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(String title, String link, Uint8List desktopImage,
            Uint8List tabletImage, Uint8List phoneImage)?
        uploadBannerToS3,
    TResult Function(int? page, int? limit, String? searchQuery)?
        fetchAllBanners,
    TResult Function(BannerUploadRequest updatedBanner)? updateBanner,
    TResult Function(String bannerId)? deleteBanner,
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
    required TResult Function(_UploadBannersToS3 value) uploadBannerToS3,
    required TResult Function(FetchAllBanners value) fetchAllBanners,
    required TResult Function(UpdateBanner value) updateBanner,
    required TResult Function(DeleteBanner value) deleteBanner,
  }) {
    return started(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_UploadBannersToS3 value)? uploadBannerToS3,
    TResult? Function(FetchAllBanners value)? fetchAllBanners,
    TResult? Function(UpdateBanner value)? updateBanner,
    TResult? Function(DeleteBanner value)? deleteBanner,
  }) {
    return started?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_UploadBannersToS3 value)? uploadBannerToS3,
    TResult Function(FetchAllBanners value)? fetchAllBanners,
    TResult Function(UpdateBanner value)? updateBanner,
    TResult Function(DeleteBanner value)? deleteBanner,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started(this);
    }
    return orElse();
  }
}

abstract class _Started implements BannerEvent {
  const factory _Started() = _$StartedImpl;
}

/// @nodoc
abstract class _$$UploadBannersToS3ImplCopyWith<$Res> {
  factory _$$UploadBannersToS3ImplCopyWith(_$UploadBannersToS3Impl value,
          $Res Function(_$UploadBannersToS3Impl) then) =
      __$$UploadBannersToS3ImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {String title,
      String link,
      Uint8List desktopImage,
      Uint8List tabletImage,
      Uint8List phoneImage});
}

/// @nodoc
class __$$UploadBannersToS3ImplCopyWithImpl<$Res>
    extends _$BannerEventCopyWithImpl<$Res, _$UploadBannersToS3Impl>
    implements _$$UploadBannersToS3ImplCopyWith<$Res> {
  __$$UploadBannersToS3ImplCopyWithImpl(_$UploadBannersToS3Impl _value,
      $Res Function(_$UploadBannersToS3Impl) _then)
      : super(_value, _then);

  /// Create a copy of BannerEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? link = null,
    Object? desktopImage = null,
    Object? tabletImage = null,
    Object? phoneImage = null,
  }) {
    return _then(_$UploadBannersToS3Impl(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      link: null == link
          ? _value.link
          : link // ignore: cast_nullable_to_non_nullable
              as String,
      desktopImage: null == desktopImage
          ? _value.desktopImage
          : desktopImage // ignore: cast_nullable_to_non_nullable
              as Uint8List,
      tabletImage: null == tabletImage
          ? _value.tabletImage
          : tabletImage // ignore: cast_nullable_to_non_nullable
              as Uint8List,
      phoneImage: null == phoneImage
          ? _value.phoneImage
          : phoneImage // ignore: cast_nullable_to_non_nullable
              as Uint8List,
    ));
  }
}

/// @nodoc

class _$UploadBannersToS3Impl implements _UploadBannersToS3 {
  const _$UploadBannersToS3Impl(
      {required this.title,
      required this.link,
      required this.desktopImage,
      required this.tabletImage,
      required this.phoneImage});

  @override
  final String title;
  @override
  final String link;
  @override
  final Uint8List desktopImage;
  @override
  final Uint8List tabletImage;
  @override
  final Uint8List phoneImage;

  @override
  String toString() {
    return 'BannerEvent.uploadBannerToS3(title: $title, link: $link, desktopImage: $desktopImage, tabletImage: $tabletImage, phoneImage: $phoneImage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UploadBannersToS3Impl &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.link, link) || other.link == link) &&
            const DeepCollectionEquality()
                .equals(other.desktopImage, desktopImage) &&
            const DeepCollectionEquality()
                .equals(other.tabletImage, tabletImage) &&
            const DeepCollectionEquality()
                .equals(other.phoneImage, phoneImage));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      title,
      link,
      const DeepCollectionEquality().hash(desktopImage),
      const DeepCollectionEquality().hash(tabletImage),
      const DeepCollectionEquality().hash(phoneImage));

  /// Create a copy of BannerEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UploadBannersToS3ImplCopyWith<_$UploadBannersToS3Impl> get copyWith =>
      __$$UploadBannersToS3ImplCopyWithImpl<_$UploadBannersToS3Impl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(String title, String link, Uint8List desktopImage,
            Uint8List tabletImage, Uint8List phoneImage)
        uploadBannerToS3,
    required TResult Function(int? page, int? limit, String? searchQuery)
        fetchAllBanners,
    required TResult Function(BannerUploadRequest updatedBanner) updateBanner,
    required TResult Function(String bannerId) deleteBanner,
  }) {
    return uploadBannerToS3(title, link, desktopImage, tabletImage, phoneImage);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(String title, String link, Uint8List desktopImage,
            Uint8List tabletImage, Uint8List phoneImage)?
        uploadBannerToS3,
    TResult? Function(int? page, int? limit, String? searchQuery)?
        fetchAllBanners,
    TResult? Function(BannerUploadRequest updatedBanner)? updateBanner,
    TResult? Function(String bannerId)? deleteBanner,
  }) {
    return uploadBannerToS3?.call(
        title, link, desktopImage, tabletImage, phoneImage);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(String title, String link, Uint8List desktopImage,
            Uint8List tabletImage, Uint8List phoneImage)?
        uploadBannerToS3,
    TResult Function(int? page, int? limit, String? searchQuery)?
        fetchAllBanners,
    TResult Function(BannerUploadRequest updatedBanner)? updateBanner,
    TResult Function(String bannerId)? deleteBanner,
    required TResult orElse(),
  }) {
    if (uploadBannerToS3 != null) {
      return uploadBannerToS3(
          title, link, desktopImage, tabletImage, phoneImage);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_UploadBannersToS3 value) uploadBannerToS3,
    required TResult Function(FetchAllBanners value) fetchAllBanners,
    required TResult Function(UpdateBanner value) updateBanner,
    required TResult Function(DeleteBanner value) deleteBanner,
  }) {
    return uploadBannerToS3(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_UploadBannersToS3 value)? uploadBannerToS3,
    TResult? Function(FetchAllBanners value)? fetchAllBanners,
    TResult? Function(UpdateBanner value)? updateBanner,
    TResult? Function(DeleteBanner value)? deleteBanner,
  }) {
    return uploadBannerToS3?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_UploadBannersToS3 value)? uploadBannerToS3,
    TResult Function(FetchAllBanners value)? fetchAllBanners,
    TResult Function(UpdateBanner value)? updateBanner,
    TResult Function(DeleteBanner value)? deleteBanner,
    required TResult orElse(),
  }) {
    if (uploadBannerToS3 != null) {
      return uploadBannerToS3(this);
    }
    return orElse();
  }
}

abstract class _UploadBannersToS3 implements BannerEvent {
  const factory _UploadBannersToS3(
      {required final String title,
      required final String link,
      required final Uint8List desktopImage,
      required final Uint8List tabletImage,
      required final Uint8List phoneImage}) = _$UploadBannersToS3Impl;

  String get title;
  String get link;
  Uint8List get desktopImage;
  Uint8List get tabletImage;
  Uint8List get phoneImage;

  /// Create a copy of BannerEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UploadBannersToS3ImplCopyWith<_$UploadBannersToS3Impl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$FetchAllBannersImplCopyWith<$Res> {
  factory _$$FetchAllBannersImplCopyWith(_$FetchAllBannersImpl value,
          $Res Function(_$FetchAllBannersImpl) then) =
      __$$FetchAllBannersImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int? page, int? limit, String? searchQuery});
}

/// @nodoc
class __$$FetchAllBannersImplCopyWithImpl<$Res>
    extends _$BannerEventCopyWithImpl<$Res, _$FetchAllBannersImpl>
    implements _$$FetchAllBannersImplCopyWith<$Res> {
  __$$FetchAllBannersImplCopyWithImpl(
      _$FetchAllBannersImpl _value, $Res Function(_$FetchAllBannersImpl) _then)
      : super(_value, _then);

  /// Create a copy of BannerEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? page = freezed,
    Object? limit = freezed,
    Object? searchQuery = freezed,
  }) {
    return _then(_$FetchAllBannersImpl(
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
    ));
  }
}

/// @nodoc

class _$FetchAllBannersImpl implements FetchAllBanners {
  const _$FetchAllBannersImpl(
      {this.page = 1, this.limit = 10, this.searchQuery = ''});

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
  String toString() {
    return 'BannerEvent.fetchAllBanners(page: $page, limit: $limit, searchQuery: $searchQuery)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FetchAllBannersImpl &&
            (identical(other.page, page) || other.page == page) &&
            (identical(other.limit, limit) || other.limit == limit) &&
            (identical(other.searchQuery, searchQuery) ||
                other.searchQuery == searchQuery));
  }

  @override
  int get hashCode => Object.hash(runtimeType, page, limit, searchQuery);

  /// Create a copy of BannerEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FetchAllBannersImplCopyWith<_$FetchAllBannersImpl> get copyWith =>
      __$$FetchAllBannersImplCopyWithImpl<_$FetchAllBannersImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(String title, String link, Uint8List desktopImage,
            Uint8List tabletImage, Uint8List phoneImage)
        uploadBannerToS3,
    required TResult Function(int? page, int? limit, String? searchQuery)
        fetchAllBanners,
    required TResult Function(BannerUploadRequest updatedBanner) updateBanner,
    required TResult Function(String bannerId) deleteBanner,
  }) {
    return fetchAllBanners(page, limit, searchQuery);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(String title, String link, Uint8List desktopImage,
            Uint8List tabletImage, Uint8List phoneImage)?
        uploadBannerToS3,
    TResult? Function(int? page, int? limit, String? searchQuery)?
        fetchAllBanners,
    TResult? Function(BannerUploadRequest updatedBanner)? updateBanner,
    TResult? Function(String bannerId)? deleteBanner,
  }) {
    return fetchAllBanners?.call(page, limit, searchQuery);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(String title, String link, Uint8List desktopImage,
            Uint8List tabletImage, Uint8List phoneImage)?
        uploadBannerToS3,
    TResult Function(int? page, int? limit, String? searchQuery)?
        fetchAllBanners,
    TResult Function(BannerUploadRequest updatedBanner)? updateBanner,
    TResult Function(String bannerId)? deleteBanner,
    required TResult orElse(),
  }) {
    if (fetchAllBanners != null) {
      return fetchAllBanners(page, limit, searchQuery);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_UploadBannersToS3 value) uploadBannerToS3,
    required TResult Function(FetchAllBanners value) fetchAllBanners,
    required TResult Function(UpdateBanner value) updateBanner,
    required TResult Function(DeleteBanner value) deleteBanner,
  }) {
    return fetchAllBanners(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_UploadBannersToS3 value)? uploadBannerToS3,
    TResult? Function(FetchAllBanners value)? fetchAllBanners,
    TResult? Function(UpdateBanner value)? updateBanner,
    TResult? Function(DeleteBanner value)? deleteBanner,
  }) {
    return fetchAllBanners?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_UploadBannersToS3 value)? uploadBannerToS3,
    TResult Function(FetchAllBanners value)? fetchAllBanners,
    TResult Function(UpdateBanner value)? updateBanner,
    TResult Function(DeleteBanner value)? deleteBanner,
    required TResult orElse(),
  }) {
    if (fetchAllBanners != null) {
      return fetchAllBanners(this);
    }
    return orElse();
  }
}

abstract class FetchAllBanners implements BannerEvent {
  const factory FetchAllBanners(
      {final int? page,
      final int? limit,
      final String? searchQuery}) = _$FetchAllBannersImpl;

  int? get page;
  int? get limit;
  String? get searchQuery;

  /// Create a copy of BannerEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FetchAllBannersImplCopyWith<_$FetchAllBannersImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UpdateBannerImplCopyWith<$Res> {
  factory _$$UpdateBannerImplCopyWith(
          _$UpdateBannerImpl value, $Res Function(_$UpdateBannerImpl) then) =
      __$$UpdateBannerImplCopyWithImpl<$Res>;
  @useResult
  $Res call({BannerUploadRequest updatedBanner});
}

/// @nodoc
class __$$UpdateBannerImplCopyWithImpl<$Res>
    extends _$BannerEventCopyWithImpl<$Res, _$UpdateBannerImpl>
    implements _$$UpdateBannerImplCopyWith<$Res> {
  __$$UpdateBannerImplCopyWithImpl(
      _$UpdateBannerImpl _value, $Res Function(_$UpdateBannerImpl) _then)
      : super(_value, _then);

  /// Create a copy of BannerEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? updatedBanner = null,
  }) {
    return _then(_$UpdateBannerImpl(
      updatedBanner: null == updatedBanner
          ? _value.updatedBanner
          : updatedBanner // ignore: cast_nullable_to_non_nullable
              as BannerUploadRequest,
    ));
  }
}

/// @nodoc

class _$UpdateBannerImpl implements UpdateBanner {
  const _$UpdateBannerImpl({required this.updatedBanner});

  @override
  final BannerUploadRequest updatedBanner;

  @override
  String toString() {
    return 'BannerEvent.updateBanner(updatedBanner: $updatedBanner)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdateBannerImpl &&
            (identical(other.updatedBanner, updatedBanner) ||
                other.updatedBanner == updatedBanner));
  }

  @override
  int get hashCode => Object.hash(runtimeType, updatedBanner);

  /// Create a copy of BannerEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdateBannerImplCopyWith<_$UpdateBannerImpl> get copyWith =>
      __$$UpdateBannerImplCopyWithImpl<_$UpdateBannerImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(String title, String link, Uint8List desktopImage,
            Uint8List tabletImage, Uint8List phoneImage)
        uploadBannerToS3,
    required TResult Function(int? page, int? limit, String? searchQuery)
        fetchAllBanners,
    required TResult Function(BannerUploadRequest updatedBanner) updateBanner,
    required TResult Function(String bannerId) deleteBanner,
  }) {
    return updateBanner(updatedBanner);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(String title, String link, Uint8List desktopImage,
            Uint8List tabletImage, Uint8List phoneImage)?
        uploadBannerToS3,
    TResult? Function(int? page, int? limit, String? searchQuery)?
        fetchAllBanners,
    TResult? Function(BannerUploadRequest updatedBanner)? updateBanner,
    TResult? Function(String bannerId)? deleteBanner,
  }) {
    return updateBanner?.call(updatedBanner);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(String title, String link, Uint8List desktopImage,
            Uint8List tabletImage, Uint8List phoneImage)?
        uploadBannerToS3,
    TResult Function(int? page, int? limit, String? searchQuery)?
        fetchAllBanners,
    TResult Function(BannerUploadRequest updatedBanner)? updateBanner,
    TResult Function(String bannerId)? deleteBanner,
    required TResult orElse(),
  }) {
    if (updateBanner != null) {
      return updateBanner(updatedBanner);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_UploadBannersToS3 value) uploadBannerToS3,
    required TResult Function(FetchAllBanners value) fetchAllBanners,
    required TResult Function(UpdateBanner value) updateBanner,
    required TResult Function(DeleteBanner value) deleteBanner,
  }) {
    return updateBanner(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_UploadBannersToS3 value)? uploadBannerToS3,
    TResult? Function(FetchAllBanners value)? fetchAllBanners,
    TResult? Function(UpdateBanner value)? updateBanner,
    TResult? Function(DeleteBanner value)? deleteBanner,
  }) {
    return updateBanner?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_UploadBannersToS3 value)? uploadBannerToS3,
    TResult Function(FetchAllBanners value)? fetchAllBanners,
    TResult Function(UpdateBanner value)? updateBanner,
    TResult Function(DeleteBanner value)? deleteBanner,
    required TResult orElse(),
  }) {
    if (updateBanner != null) {
      return updateBanner(this);
    }
    return orElse();
  }
}

abstract class UpdateBanner implements BannerEvent {
  const factory UpdateBanner(
      {required final BannerUploadRequest updatedBanner}) = _$UpdateBannerImpl;

  BannerUploadRequest get updatedBanner;

  /// Create a copy of BannerEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UpdateBannerImplCopyWith<_$UpdateBannerImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$DeleteBannerImplCopyWith<$Res> {
  factory _$$DeleteBannerImplCopyWith(
          _$DeleteBannerImpl value, $Res Function(_$DeleteBannerImpl) then) =
      __$$DeleteBannerImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String bannerId});
}

/// @nodoc
class __$$DeleteBannerImplCopyWithImpl<$Res>
    extends _$BannerEventCopyWithImpl<$Res, _$DeleteBannerImpl>
    implements _$$DeleteBannerImplCopyWith<$Res> {
  __$$DeleteBannerImplCopyWithImpl(
      _$DeleteBannerImpl _value, $Res Function(_$DeleteBannerImpl) _then)
      : super(_value, _then);

  /// Create a copy of BannerEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? bannerId = null,
  }) {
    return _then(_$DeleteBannerImpl(
      bannerId: null == bannerId
          ? _value.bannerId
          : bannerId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$DeleteBannerImpl implements DeleteBanner {
  const _$DeleteBannerImpl({required this.bannerId});

  @override
  final String bannerId;

  @override
  String toString() {
    return 'BannerEvent.deleteBanner(bannerId: $bannerId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DeleteBannerImpl &&
            (identical(other.bannerId, bannerId) ||
                other.bannerId == bannerId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, bannerId);

  /// Create a copy of BannerEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DeleteBannerImplCopyWith<_$DeleteBannerImpl> get copyWith =>
      __$$DeleteBannerImplCopyWithImpl<_$DeleteBannerImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(String title, String link, Uint8List desktopImage,
            Uint8List tabletImage, Uint8List phoneImage)
        uploadBannerToS3,
    required TResult Function(int? page, int? limit, String? searchQuery)
        fetchAllBanners,
    required TResult Function(BannerUploadRequest updatedBanner) updateBanner,
    required TResult Function(String bannerId) deleteBanner,
  }) {
    return deleteBanner(bannerId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(String title, String link, Uint8List desktopImage,
            Uint8List tabletImage, Uint8List phoneImage)?
        uploadBannerToS3,
    TResult? Function(int? page, int? limit, String? searchQuery)?
        fetchAllBanners,
    TResult? Function(BannerUploadRequest updatedBanner)? updateBanner,
    TResult? Function(String bannerId)? deleteBanner,
  }) {
    return deleteBanner?.call(bannerId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(String title, String link, Uint8List desktopImage,
            Uint8List tabletImage, Uint8List phoneImage)?
        uploadBannerToS3,
    TResult Function(int? page, int? limit, String? searchQuery)?
        fetchAllBanners,
    TResult Function(BannerUploadRequest updatedBanner)? updateBanner,
    TResult Function(String bannerId)? deleteBanner,
    required TResult orElse(),
  }) {
    if (deleteBanner != null) {
      return deleteBanner(bannerId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_UploadBannersToS3 value) uploadBannerToS3,
    required TResult Function(FetchAllBanners value) fetchAllBanners,
    required TResult Function(UpdateBanner value) updateBanner,
    required TResult Function(DeleteBanner value) deleteBanner,
  }) {
    return deleteBanner(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_UploadBannersToS3 value)? uploadBannerToS3,
    TResult? Function(FetchAllBanners value)? fetchAllBanners,
    TResult? Function(UpdateBanner value)? updateBanner,
    TResult? Function(DeleteBanner value)? deleteBanner,
  }) {
    return deleteBanner?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_UploadBannersToS3 value)? uploadBannerToS3,
    TResult Function(FetchAllBanners value)? fetchAllBanners,
    TResult Function(UpdateBanner value)? updateBanner,
    TResult Function(DeleteBanner value)? deleteBanner,
    required TResult orElse(),
  }) {
    if (deleteBanner != null) {
      return deleteBanner(this);
    }
    return orElse();
  }
}

abstract class DeleteBanner implements BannerEvent {
  const factory DeleteBanner({required final String bannerId}) =
      _$DeleteBannerImpl;

  String get bannerId;

  /// Create a copy of BannerEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DeleteBannerImplCopyWith<_$DeleteBannerImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$BannerState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<BannerInfo> banners) success,
    required TResult Function(String message) failure,
    required TResult Function(
            List<BannerUploadRequest> banners, int totalPages, int currentPage)
        loaded,
    required TResult Function() updated,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<BannerInfo> banners)? success,
    TResult? Function(String message)? failure,
    TResult? Function(
            List<BannerUploadRequest> banners, int totalPages, int currentPage)?
        loaded,
    TResult? Function()? updated,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<BannerInfo> banners)? success,
    TResult Function(String message)? failure,
    TResult Function(
            List<BannerUploadRequest> banners, int totalPages, int currentPage)?
        loaded,
    TResult Function()? updated,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(Loading value) loading,
    required TResult Function(_Success value) success,
    required TResult Function(Failure value) failure,
    required TResult Function(BannerLoaded value) loaded,
    required TResult Function(BannerUpdated value) updated,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(Loading value)? loading,
    TResult? Function(_Success value)? success,
    TResult? Function(Failure value)? failure,
    TResult? Function(BannerLoaded value)? loaded,
    TResult? Function(BannerUpdated value)? updated,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(Loading value)? loading,
    TResult Function(_Success value)? success,
    TResult Function(Failure value)? failure,
    TResult Function(BannerLoaded value)? loaded,
    TResult Function(BannerUpdated value)? updated,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BannerStateCopyWith<$Res> {
  factory $BannerStateCopyWith(
          BannerState value, $Res Function(BannerState) then) =
      _$BannerStateCopyWithImpl<$Res, BannerState>;
}

/// @nodoc
class _$BannerStateCopyWithImpl<$Res, $Val extends BannerState>
    implements $BannerStateCopyWith<$Res> {
  _$BannerStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of BannerState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$InitialImplCopyWith<$Res> {
  factory _$$InitialImplCopyWith(
          _$InitialImpl value, $Res Function(_$InitialImpl) then) =
      __$$InitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$BannerStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);

  /// Create a copy of BannerState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$InitialImpl implements _Initial {
  const _$InitialImpl();

  @override
  String toString() {
    return 'BannerState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$InitialImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<BannerInfo> banners) success,
    required TResult Function(String message) failure,
    required TResult Function(
            List<BannerUploadRequest> banners, int totalPages, int currentPage)
        loaded,
    required TResult Function() updated,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<BannerInfo> banners)? success,
    TResult? Function(String message)? failure,
    TResult? Function(
            List<BannerUploadRequest> banners, int totalPages, int currentPage)?
        loaded,
    TResult? Function()? updated,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<BannerInfo> banners)? success,
    TResult Function(String message)? failure,
    TResult Function(
            List<BannerUploadRequest> banners, int totalPages, int currentPage)?
        loaded,
    TResult Function()? updated,
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
    required TResult Function(_Initial value) initial,
    required TResult Function(Loading value) loading,
    required TResult Function(_Success value) success,
    required TResult Function(Failure value) failure,
    required TResult Function(BannerLoaded value) loaded,
    required TResult Function(BannerUpdated value) updated,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(Loading value)? loading,
    TResult? Function(_Success value)? success,
    TResult? Function(Failure value)? failure,
    TResult? Function(BannerLoaded value)? loaded,
    TResult? Function(BannerUpdated value)? updated,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(Loading value)? loading,
    TResult Function(_Success value)? success,
    TResult Function(Failure value)? failure,
    TResult Function(BannerLoaded value)? loaded,
    TResult Function(BannerUpdated value)? updated,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements BannerState {
  const factory _Initial() = _$InitialImpl;
}

/// @nodoc
abstract class _$$LoadingImplCopyWith<$Res> {
  factory _$$LoadingImplCopyWith(
          _$LoadingImpl value, $Res Function(_$LoadingImpl) then) =
      __$$LoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadingImplCopyWithImpl<$Res>
    extends _$BannerStateCopyWithImpl<$Res, _$LoadingImpl>
    implements _$$LoadingImplCopyWith<$Res> {
  __$$LoadingImplCopyWithImpl(
      _$LoadingImpl _value, $Res Function(_$LoadingImpl) _then)
      : super(_value, _then);

  /// Create a copy of BannerState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$LoadingImpl implements Loading {
  const _$LoadingImpl();

  @override
  String toString() {
    return 'BannerState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<BannerInfo> banners) success,
    required TResult Function(String message) failure,
    required TResult Function(
            List<BannerUploadRequest> banners, int totalPages, int currentPage)
        loaded,
    required TResult Function() updated,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<BannerInfo> banners)? success,
    TResult? Function(String message)? failure,
    TResult? Function(
            List<BannerUploadRequest> banners, int totalPages, int currentPage)?
        loaded,
    TResult? Function()? updated,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<BannerInfo> banners)? success,
    TResult Function(String message)? failure,
    TResult Function(
            List<BannerUploadRequest> banners, int totalPages, int currentPage)?
        loaded,
    TResult Function()? updated,
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
    required TResult Function(_Initial value) initial,
    required TResult Function(Loading value) loading,
    required TResult Function(_Success value) success,
    required TResult Function(Failure value) failure,
    required TResult Function(BannerLoaded value) loaded,
    required TResult Function(BannerUpdated value) updated,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(Loading value)? loading,
    TResult? Function(_Success value)? success,
    TResult? Function(Failure value)? failure,
    TResult? Function(BannerLoaded value)? loaded,
    TResult? Function(BannerUpdated value)? updated,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(Loading value)? loading,
    TResult Function(_Success value)? success,
    TResult Function(Failure value)? failure,
    TResult Function(BannerLoaded value)? loaded,
    TResult Function(BannerUpdated value)? updated,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class Loading implements BannerState {
  const factory Loading() = _$LoadingImpl;
}

/// @nodoc
abstract class _$$SuccessImplCopyWith<$Res> {
  factory _$$SuccessImplCopyWith(
          _$SuccessImpl value, $Res Function(_$SuccessImpl) then) =
      __$$SuccessImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<BannerInfo> banners});
}

/// @nodoc
class __$$SuccessImplCopyWithImpl<$Res>
    extends _$BannerStateCopyWithImpl<$Res, _$SuccessImpl>
    implements _$$SuccessImplCopyWith<$Res> {
  __$$SuccessImplCopyWithImpl(
      _$SuccessImpl _value, $Res Function(_$SuccessImpl) _then)
      : super(_value, _then);

  /// Create a copy of BannerState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? banners = null,
  }) {
    return _then(_$SuccessImpl(
      null == banners
          ? _value._banners
          : banners // ignore: cast_nullable_to_non_nullable
              as List<BannerInfo>,
    ));
  }
}

/// @nodoc

class _$SuccessImpl implements _Success {
  const _$SuccessImpl(final List<BannerInfo> banners) : _banners = banners;

  final List<BannerInfo> _banners;
  @override
  List<BannerInfo> get banners {
    if (_banners is EqualUnmodifiableListView) return _banners;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_banners);
  }

  @override
  String toString() {
    return 'BannerState.success(banners: $banners)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SuccessImpl &&
            const DeepCollectionEquality().equals(other._banners, _banners));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_banners));

  /// Create a copy of BannerState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SuccessImplCopyWith<_$SuccessImpl> get copyWith =>
      __$$SuccessImplCopyWithImpl<_$SuccessImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<BannerInfo> banners) success,
    required TResult Function(String message) failure,
    required TResult Function(
            List<BannerUploadRequest> banners, int totalPages, int currentPage)
        loaded,
    required TResult Function() updated,
  }) {
    return success(banners);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<BannerInfo> banners)? success,
    TResult? Function(String message)? failure,
    TResult? Function(
            List<BannerUploadRequest> banners, int totalPages, int currentPage)?
        loaded,
    TResult? Function()? updated,
  }) {
    return success?.call(banners);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<BannerInfo> banners)? success,
    TResult Function(String message)? failure,
    TResult Function(
            List<BannerUploadRequest> banners, int totalPages, int currentPage)?
        loaded,
    TResult Function()? updated,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(banners);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(Loading value) loading,
    required TResult Function(_Success value) success,
    required TResult Function(Failure value) failure,
    required TResult Function(BannerLoaded value) loaded,
    required TResult Function(BannerUpdated value) updated,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(Loading value)? loading,
    TResult? Function(_Success value)? success,
    TResult? Function(Failure value)? failure,
    TResult? Function(BannerLoaded value)? loaded,
    TResult? Function(BannerUpdated value)? updated,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(Loading value)? loading,
    TResult Function(_Success value)? success,
    TResult Function(Failure value)? failure,
    TResult Function(BannerLoaded value)? loaded,
    TResult Function(BannerUpdated value)? updated,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class _Success implements BannerState {
  const factory _Success(final List<BannerInfo> banners) = _$SuccessImpl;

  List<BannerInfo> get banners;

  /// Create a copy of BannerState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SuccessImplCopyWith<_$SuccessImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$FailureImplCopyWith<$Res> {
  factory _$$FailureImplCopyWith(
          _$FailureImpl value, $Res Function(_$FailureImpl) then) =
      __$$FailureImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$FailureImplCopyWithImpl<$Res>
    extends _$BannerStateCopyWithImpl<$Res, _$FailureImpl>
    implements _$$FailureImplCopyWith<$Res> {
  __$$FailureImplCopyWithImpl(
      _$FailureImpl _value, $Res Function(_$FailureImpl) _then)
      : super(_value, _then);

  /// Create a copy of BannerState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$FailureImpl(
      null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$FailureImpl implements Failure {
  const _$FailureImpl(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'BannerState.failure(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FailureImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  /// Create a copy of BannerState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FailureImplCopyWith<_$FailureImpl> get copyWith =>
      __$$FailureImplCopyWithImpl<_$FailureImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<BannerInfo> banners) success,
    required TResult Function(String message) failure,
    required TResult Function(
            List<BannerUploadRequest> banners, int totalPages, int currentPage)
        loaded,
    required TResult Function() updated,
  }) {
    return failure(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<BannerInfo> banners)? success,
    TResult? Function(String message)? failure,
    TResult? Function(
            List<BannerUploadRequest> banners, int totalPages, int currentPage)?
        loaded,
    TResult? Function()? updated,
  }) {
    return failure?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<BannerInfo> banners)? success,
    TResult Function(String message)? failure,
    TResult Function(
            List<BannerUploadRequest> banners, int totalPages, int currentPage)?
        loaded,
    TResult Function()? updated,
    required TResult orElse(),
  }) {
    if (failure != null) {
      return failure(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(Loading value) loading,
    required TResult Function(_Success value) success,
    required TResult Function(Failure value) failure,
    required TResult Function(BannerLoaded value) loaded,
    required TResult Function(BannerUpdated value) updated,
  }) {
    return failure(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(Loading value)? loading,
    TResult? Function(_Success value)? success,
    TResult? Function(Failure value)? failure,
    TResult? Function(BannerLoaded value)? loaded,
    TResult? Function(BannerUpdated value)? updated,
  }) {
    return failure?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(Loading value)? loading,
    TResult Function(_Success value)? success,
    TResult Function(Failure value)? failure,
    TResult Function(BannerLoaded value)? loaded,
    TResult Function(BannerUpdated value)? updated,
    required TResult orElse(),
  }) {
    if (failure != null) {
      return failure(this);
    }
    return orElse();
  }
}

abstract class Failure implements BannerState {
  const factory Failure(final String message) = _$FailureImpl;

  String get message;

  /// Create a copy of BannerState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FailureImplCopyWith<_$FailureImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$BannerLoadedImplCopyWith<$Res> {
  factory _$$BannerLoadedImplCopyWith(
          _$BannerLoadedImpl value, $Res Function(_$BannerLoadedImpl) then) =
      __$$BannerLoadedImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {List<BannerUploadRequest> banners, int totalPages, int currentPage});
}

/// @nodoc
class __$$BannerLoadedImplCopyWithImpl<$Res>
    extends _$BannerStateCopyWithImpl<$Res, _$BannerLoadedImpl>
    implements _$$BannerLoadedImplCopyWith<$Res> {
  __$$BannerLoadedImplCopyWithImpl(
      _$BannerLoadedImpl _value, $Res Function(_$BannerLoadedImpl) _then)
      : super(_value, _then);

  /// Create a copy of BannerState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? banners = null,
    Object? totalPages = null,
    Object? currentPage = null,
  }) {
    return _then(_$BannerLoadedImpl(
      banners: null == banners
          ? _value._banners
          : banners // ignore: cast_nullable_to_non_nullable
              as List<BannerUploadRequest>,
      totalPages: null == totalPages
          ? _value.totalPages
          : totalPages // ignore: cast_nullable_to_non_nullable
              as int,
      currentPage: null == currentPage
          ? _value.currentPage
          : currentPage // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$BannerLoadedImpl implements BannerLoaded {
  const _$BannerLoadedImpl(
      {required final List<BannerUploadRequest> banners,
      required this.totalPages,
      required this.currentPage})
      : _banners = banners;

  final List<BannerUploadRequest> _banners;
  @override
  List<BannerUploadRequest> get banners {
    if (_banners is EqualUnmodifiableListView) return _banners;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_banners);
  }

  @override
  final int totalPages;
  @override
  final int currentPage;

  @override
  String toString() {
    return 'BannerState.loaded(banners: $banners, totalPages: $totalPages, currentPage: $currentPage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BannerLoadedImpl &&
            const DeepCollectionEquality().equals(other._banners, _banners) &&
            (identical(other.totalPages, totalPages) ||
                other.totalPages == totalPages) &&
            (identical(other.currentPage, currentPage) ||
                other.currentPage == currentPage));
  }

  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(_banners), totalPages, currentPage);

  /// Create a copy of BannerState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BannerLoadedImplCopyWith<_$BannerLoadedImpl> get copyWith =>
      __$$BannerLoadedImplCopyWithImpl<_$BannerLoadedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<BannerInfo> banners) success,
    required TResult Function(String message) failure,
    required TResult Function(
            List<BannerUploadRequest> banners, int totalPages, int currentPage)
        loaded,
    required TResult Function() updated,
  }) {
    return loaded(banners, totalPages, currentPage);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<BannerInfo> banners)? success,
    TResult? Function(String message)? failure,
    TResult? Function(
            List<BannerUploadRequest> banners, int totalPages, int currentPage)?
        loaded,
    TResult? Function()? updated,
  }) {
    return loaded?.call(banners, totalPages, currentPage);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<BannerInfo> banners)? success,
    TResult Function(String message)? failure,
    TResult Function(
            List<BannerUploadRequest> banners, int totalPages, int currentPage)?
        loaded,
    TResult Function()? updated,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(banners, totalPages, currentPage);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(Loading value) loading,
    required TResult Function(_Success value) success,
    required TResult Function(Failure value) failure,
    required TResult Function(BannerLoaded value) loaded,
    required TResult Function(BannerUpdated value) updated,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(Loading value)? loading,
    TResult? Function(_Success value)? success,
    TResult? Function(Failure value)? failure,
    TResult? Function(BannerLoaded value)? loaded,
    TResult? Function(BannerUpdated value)? updated,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(Loading value)? loading,
    TResult Function(_Success value)? success,
    TResult Function(Failure value)? failure,
    TResult Function(BannerLoaded value)? loaded,
    TResult Function(BannerUpdated value)? updated,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class BannerLoaded implements BannerState {
  const factory BannerLoaded(
      {required final List<BannerUploadRequest> banners,
      required final int totalPages,
      required final int currentPage}) = _$BannerLoadedImpl;

  List<BannerUploadRequest> get banners;
  int get totalPages;
  int get currentPage;

  /// Create a copy of BannerState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BannerLoadedImplCopyWith<_$BannerLoadedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$BannerUpdatedImplCopyWith<$Res> {
  factory _$$BannerUpdatedImplCopyWith(
          _$BannerUpdatedImpl value, $Res Function(_$BannerUpdatedImpl) then) =
      __$$BannerUpdatedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$BannerUpdatedImplCopyWithImpl<$Res>
    extends _$BannerStateCopyWithImpl<$Res, _$BannerUpdatedImpl>
    implements _$$BannerUpdatedImplCopyWith<$Res> {
  __$$BannerUpdatedImplCopyWithImpl(
      _$BannerUpdatedImpl _value, $Res Function(_$BannerUpdatedImpl) _then)
      : super(_value, _then);

  /// Create a copy of BannerState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$BannerUpdatedImpl implements BannerUpdated {
  const _$BannerUpdatedImpl();

  @override
  String toString() {
    return 'BannerState.updated()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$BannerUpdatedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<BannerInfo> banners) success,
    required TResult Function(String message) failure,
    required TResult Function(
            List<BannerUploadRequest> banners, int totalPages, int currentPage)
        loaded,
    required TResult Function() updated,
  }) {
    return updated();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<BannerInfo> banners)? success,
    TResult? Function(String message)? failure,
    TResult? Function(
            List<BannerUploadRequest> banners, int totalPages, int currentPage)?
        loaded,
    TResult? Function()? updated,
  }) {
    return updated?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<BannerInfo> banners)? success,
    TResult Function(String message)? failure,
    TResult Function(
            List<BannerUploadRequest> banners, int totalPages, int currentPage)?
        loaded,
    TResult Function()? updated,
    required TResult orElse(),
  }) {
    if (updated != null) {
      return updated();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(Loading value) loading,
    required TResult Function(_Success value) success,
    required TResult Function(Failure value) failure,
    required TResult Function(BannerLoaded value) loaded,
    required TResult Function(BannerUpdated value) updated,
  }) {
    return updated(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(Loading value)? loading,
    TResult? Function(_Success value)? success,
    TResult? Function(Failure value)? failure,
    TResult? Function(BannerLoaded value)? loaded,
    TResult? Function(BannerUpdated value)? updated,
  }) {
    return updated?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(Loading value)? loading,
    TResult Function(_Success value)? success,
    TResult Function(Failure value)? failure,
    TResult Function(BannerLoaded value)? loaded,
    TResult Function(BannerUpdated value)? updated,
    required TResult orElse(),
  }) {
    if (updated != null) {
      return updated(this);
    }
    return orElse();
  }
}

abstract class BannerUpdated implements BannerState {
  const factory BannerUpdated() = _$BannerUpdatedImpl;
}
