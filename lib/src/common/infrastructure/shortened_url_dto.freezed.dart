// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'shortened_url_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ShortenedUrlDTO {

 int get aliasId; String get originalUrl; String get shortUrl;
/// Create a copy of ShortenedUrlDTO
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ShortenedUrlDTOCopyWith<ShortenedUrlDTO> get copyWith => _$ShortenedUrlDTOCopyWithImpl<ShortenedUrlDTO>(this as ShortenedUrlDTO, _$identity);

  /// Serializes this ShortenedUrlDTO to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ShortenedUrlDTO&&(identical(other.aliasId, aliasId) || other.aliasId == aliasId)&&(identical(other.originalUrl, originalUrl) || other.originalUrl == originalUrl)&&(identical(other.shortUrl, shortUrl) || other.shortUrl == shortUrl));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,aliasId,originalUrl,shortUrl);

@override
String toString() {
  return 'ShortenedUrlDTO(aliasId: $aliasId, originalUrl: $originalUrl, shortUrl: $shortUrl)';
}


}

/// @nodoc
abstract mixin class $ShortenedUrlDTOCopyWith<$Res>  {
  factory $ShortenedUrlDTOCopyWith(ShortenedUrlDTO value, $Res Function(ShortenedUrlDTO) _then) = _$ShortenedUrlDTOCopyWithImpl;
@useResult
$Res call({
 int aliasId, String originalUrl, String shortUrl
});




}
/// @nodoc
class _$ShortenedUrlDTOCopyWithImpl<$Res>
    implements $ShortenedUrlDTOCopyWith<$Res> {
  _$ShortenedUrlDTOCopyWithImpl(this._self, this._then);

  final ShortenedUrlDTO _self;
  final $Res Function(ShortenedUrlDTO) _then;

/// Create a copy of ShortenedUrlDTO
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? aliasId = null,Object? originalUrl = null,Object? shortUrl = null,}) {
  return _then(_self.copyWith(
aliasId: null == aliasId ? _self.aliasId : aliasId // ignore: cast_nullable_to_non_nullable
as int,originalUrl: null == originalUrl ? _self.originalUrl : originalUrl // ignore: cast_nullable_to_non_nullable
as String,shortUrl: null == shortUrl ? _self.shortUrl : shortUrl // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [ShortenedUrlDTO].
extension ShortenedUrlDTOPatterns on ShortenedUrlDTO {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ShortenedUrlDTO value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ShortenedUrlDTO() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ShortenedUrlDTO value)  $default,){
final _that = this;
switch (_that) {
case _ShortenedUrlDTO():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ShortenedUrlDTO value)?  $default,){
final _that = this;
switch (_that) {
case _ShortenedUrlDTO() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int aliasId,  String originalUrl,  String shortUrl)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ShortenedUrlDTO() when $default != null:
return $default(_that.aliasId,_that.originalUrl,_that.shortUrl);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int aliasId,  String originalUrl,  String shortUrl)  $default,) {final _that = this;
switch (_that) {
case _ShortenedUrlDTO():
return $default(_that.aliasId,_that.originalUrl,_that.shortUrl);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int aliasId,  String originalUrl,  String shortUrl)?  $default,) {final _that = this;
switch (_that) {
case _ShortenedUrlDTO() when $default != null:
return $default(_that.aliasId,_that.originalUrl,_that.shortUrl);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ShortenedUrlDTO extends ShortenedUrlDTO {
  const _ShortenedUrlDTO({required this.aliasId, required this.originalUrl, required this.shortUrl}): super._();
  factory _ShortenedUrlDTO.fromJson(Map<String, dynamic> json) => _$ShortenedUrlDTOFromJson(json);

@override final  int aliasId;
@override final  String originalUrl;
@override final  String shortUrl;

/// Create a copy of ShortenedUrlDTO
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ShortenedUrlDTOCopyWith<_ShortenedUrlDTO> get copyWith => __$ShortenedUrlDTOCopyWithImpl<_ShortenedUrlDTO>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ShortenedUrlDTOToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ShortenedUrlDTO&&(identical(other.aliasId, aliasId) || other.aliasId == aliasId)&&(identical(other.originalUrl, originalUrl) || other.originalUrl == originalUrl)&&(identical(other.shortUrl, shortUrl) || other.shortUrl == shortUrl));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,aliasId,originalUrl,shortUrl);

@override
String toString() {
  return 'ShortenedUrlDTO(aliasId: $aliasId, originalUrl: $originalUrl, shortUrl: $shortUrl)';
}


}

/// @nodoc
abstract mixin class _$ShortenedUrlDTOCopyWith<$Res> implements $ShortenedUrlDTOCopyWith<$Res> {
  factory _$ShortenedUrlDTOCopyWith(_ShortenedUrlDTO value, $Res Function(_ShortenedUrlDTO) _then) = __$ShortenedUrlDTOCopyWithImpl;
@override @useResult
$Res call({
 int aliasId, String originalUrl, String shortUrl
});




}
/// @nodoc
class __$ShortenedUrlDTOCopyWithImpl<$Res>
    implements _$ShortenedUrlDTOCopyWith<$Res> {
  __$ShortenedUrlDTOCopyWithImpl(this._self, this._then);

  final _ShortenedUrlDTO _self;
  final $Res Function(_ShortenedUrlDTO) _then;

/// Create a copy of ShortenedUrlDTO
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? aliasId = null,Object? originalUrl = null,Object? shortUrl = null,}) {
  return _then(_ShortenedUrlDTO(
aliasId: null == aliasId ? _self.aliasId : aliasId // ignore: cast_nullable_to_non_nullable
as int,originalUrl: null == originalUrl ? _self.originalUrl : originalUrl // ignore: cast_nullable_to_non_nullable
as String,shortUrl: null == shortUrl ? _self.shortUrl : shortUrl // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
