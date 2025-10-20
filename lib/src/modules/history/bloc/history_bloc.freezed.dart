// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'history_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$HistoryEvent {

 ShortenedUrl get shortenedUrl;
/// Create a copy of HistoryEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HistoryEventCopyWith<HistoryEvent> get copyWith => _$HistoryEventCopyWithImpl<HistoryEvent>(this as HistoryEvent, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HistoryEvent&&(identical(other.shortenedUrl, shortenedUrl) || other.shortenedUrl == shortenedUrl));
}


@override
int get hashCode => Object.hash(runtimeType,shortenedUrl);

@override
String toString() {
  return 'HistoryEvent(shortenedUrl: $shortenedUrl)';
}


}

/// @nodoc
abstract mixin class $HistoryEventCopyWith<$Res>  {
  factory $HistoryEventCopyWith(HistoryEvent value, $Res Function(HistoryEvent) _then) = _$HistoryEventCopyWithImpl;
@useResult
$Res call({
 ShortenedUrl shortenedUrl
});




}
/// @nodoc
class _$HistoryEventCopyWithImpl<$Res>
    implements $HistoryEventCopyWith<$Res> {
  _$HistoryEventCopyWithImpl(this._self, this._then);

  final HistoryEvent _self;
  final $Res Function(HistoryEvent) _then;

/// Create a copy of HistoryEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? shortenedUrl = null,}) {
  return _then(_self.copyWith(
shortenedUrl: null == shortenedUrl ? _self.shortenedUrl : shortenedUrl // ignore: cast_nullable_to_non_nullable
as ShortenedUrl,
  ));
}

}


/// Adds pattern-matching-related methods to [HistoryEvent].
extension HistoryEventPatterns on HistoryEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Add value)?  add,TResult Function( _Remove value)?  remove,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Add() when add != null:
return add(_that);case _Remove() when remove != null:
return remove(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Add value)  add,required TResult Function( _Remove value)  remove,}){
final _that = this;
switch (_that) {
case _Add():
return add(_that);case _Remove():
return remove(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Add value)?  add,TResult? Function( _Remove value)?  remove,}){
final _that = this;
switch (_that) {
case _Add() when add != null:
return add(_that);case _Remove() when remove != null:
return remove(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( ShortenedUrl shortenedUrl)?  add,TResult Function( ShortenedUrl shortenedUrl)?  remove,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Add() when add != null:
return add(_that.shortenedUrl);case _Remove() when remove != null:
return remove(_that.shortenedUrl);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( ShortenedUrl shortenedUrl)  add,required TResult Function( ShortenedUrl shortenedUrl)  remove,}) {final _that = this;
switch (_that) {
case _Add():
return add(_that.shortenedUrl);case _Remove():
return remove(_that.shortenedUrl);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( ShortenedUrl shortenedUrl)?  add,TResult? Function( ShortenedUrl shortenedUrl)?  remove,}) {final _that = this;
switch (_that) {
case _Add() when add != null:
return add(_that.shortenedUrl);case _Remove() when remove != null:
return remove(_that.shortenedUrl);case _:
  return null;

}
}

}

/// @nodoc


class _Add implements HistoryEvent {
  const _Add(this.shortenedUrl);
  

@override final  ShortenedUrl shortenedUrl;

/// Create a copy of HistoryEvent
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AddCopyWith<_Add> get copyWith => __$AddCopyWithImpl<_Add>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Add&&(identical(other.shortenedUrl, shortenedUrl) || other.shortenedUrl == shortenedUrl));
}


@override
int get hashCode => Object.hash(runtimeType,shortenedUrl);

@override
String toString() {
  return 'HistoryEvent.add(shortenedUrl: $shortenedUrl)';
}


}

/// @nodoc
abstract mixin class _$AddCopyWith<$Res> implements $HistoryEventCopyWith<$Res> {
  factory _$AddCopyWith(_Add value, $Res Function(_Add) _then) = __$AddCopyWithImpl;
@override @useResult
$Res call({
 ShortenedUrl shortenedUrl
});




}
/// @nodoc
class __$AddCopyWithImpl<$Res>
    implements _$AddCopyWith<$Res> {
  __$AddCopyWithImpl(this._self, this._then);

  final _Add _self;
  final $Res Function(_Add) _then;

/// Create a copy of HistoryEvent
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? shortenedUrl = null,}) {
  return _then(_Add(
null == shortenedUrl ? _self.shortenedUrl : shortenedUrl // ignore: cast_nullable_to_non_nullable
as ShortenedUrl,
  ));
}


}

/// @nodoc


class _Remove implements HistoryEvent {
  const _Remove(this.shortenedUrl);
  

@override final  ShortenedUrl shortenedUrl;

/// Create a copy of HistoryEvent
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RemoveCopyWith<_Remove> get copyWith => __$RemoveCopyWithImpl<_Remove>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Remove&&(identical(other.shortenedUrl, shortenedUrl) || other.shortenedUrl == shortenedUrl));
}


@override
int get hashCode => Object.hash(runtimeType,shortenedUrl);

@override
String toString() {
  return 'HistoryEvent.remove(shortenedUrl: $shortenedUrl)';
}


}

/// @nodoc
abstract mixin class _$RemoveCopyWith<$Res> implements $HistoryEventCopyWith<$Res> {
  factory _$RemoveCopyWith(_Remove value, $Res Function(_Remove) _then) = __$RemoveCopyWithImpl;
@override @useResult
$Res call({
 ShortenedUrl shortenedUrl
});




}
/// @nodoc
class __$RemoveCopyWithImpl<$Res>
    implements _$RemoveCopyWith<$Res> {
  __$RemoveCopyWithImpl(this._self, this._then);

  final _Remove _self;
  final $Res Function(_Remove) _then;

/// Create a copy of HistoryEvent
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? shortenedUrl = null,}) {
  return _then(_Remove(
null == shortenedUrl ? _self.shortenedUrl : shortenedUrl // ignore: cast_nullable_to_non_nullable
as ShortenedUrl,
  ));
}


}

/// @nodoc
mixin _$HistoryState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HistoryState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'HistoryState()';
}


}

/// @nodoc
class $HistoryStateCopyWith<$Res>  {
$HistoryStateCopyWith(HistoryState _, $Res Function(HistoryState) __);
}


/// Adds pattern-matching-related methods to [HistoryState].
extension HistoryStatePatterns on HistoryState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( HistoryInitial value)?  initial,TResult Function( HistoryUpdated value)?  updated,required TResult orElse(),}){
final _that = this;
switch (_that) {
case HistoryInitial() when initial != null:
return initial(_that);case HistoryUpdated() when updated != null:
return updated(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( HistoryInitial value)  initial,required TResult Function( HistoryUpdated value)  updated,}){
final _that = this;
switch (_that) {
case HistoryInitial():
return initial(_that);case HistoryUpdated():
return updated(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( HistoryInitial value)?  initial,TResult? Function( HistoryUpdated value)?  updated,}){
final _that = this;
switch (_that) {
case HistoryInitial() when initial != null:
return initial(_that);case HistoryUpdated() when updated != null:
return updated(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function( List<ShortenedUrl> shortenedUrls,  DateTime lastUpdated)?  updated,required TResult orElse(),}) {final _that = this;
switch (_that) {
case HistoryInitial() when initial != null:
return initial();case HistoryUpdated() when updated != null:
return updated(_that.shortenedUrls,_that.lastUpdated);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function( List<ShortenedUrl> shortenedUrls,  DateTime lastUpdated)  updated,}) {final _that = this;
switch (_that) {
case HistoryInitial():
return initial();case HistoryUpdated():
return updated(_that.shortenedUrls,_that.lastUpdated);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function( List<ShortenedUrl> shortenedUrls,  DateTime lastUpdated)?  updated,}) {final _that = this;
switch (_that) {
case HistoryInitial() when initial != null:
return initial();case HistoryUpdated() when updated != null:
return updated(_that.shortenedUrls,_that.lastUpdated);case _:
  return null;

}
}

}

/// @nodoc


class HistoryInitial implements HistoryState {
  const HistoryInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HistoryInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'HistoryState.initial()';
}


}




/// @nodoc


class HistoryUpdated implements HistoryState {
  const HistoryUpdated({required final  List<ShortenedUrl> shortenedUrls, required this.lastUpdated}): _shortenedUrls = shortenedUrls;
  

 final  List<ShortenedUrl> _shortenedUrls;
 List<ShortenedUrl> get shortenedUrls {
  if (_shortenedUrls is EqualUnmodifiableListView) return _shortenedUrls;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_shortenedUrls);
}

 final  DateTime lastUpdated;

/// Create a copy of HistoryState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HistoryUpdatedCopyWith<HistoryUpdated> get copyWith => _$HistoryUpdatedCopyWithImpl<HistoryUpdated>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HistoryUpdated&&const DeepCollectionEquality().equals(other._shortenedUrls, _shortenedUrls)&&(identical(other.lastUpdated, lastUpdated) || other.lastUpdated == lastUpdated));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_shortenedUrls),lastUpdated);

@override
String toString() {
  return 'HistoryState.updated(shortenedUrls: $shortenedUrls, lastUpdated: $lastUpdated)';
}


}

/// @nodoc
abstract mixin class $HistoryUpdatedCopyWith<$Res> implements $HistoryStateCopyWith<$Res> {
  factory $HistoryUpdatedCopyWith(HistoryUpdated value, $Res Function(HistoryUpdated) _then) = _$HistoryUpdatedCopyWithImpl;
@useResult
$Res call({
 List<ShortenedUrl> shortenedUrls, DateTime lastUpdated
});




}
/// @nodoc
class _$HistoryUpdatedCopyWithImpl<$Res>
    implements $HistoryUpdatedCopyWith<$Res> {
  _$HistoryUpdatedCopyWithImpl(this._self, this._then);

  final HistoryUpdated _self;
  final $Res Function(HistoryUpdated) _then;

/// Create a copy of HistoryState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? shortenedUrls = null,Object? lastUpdated = null,}) {
  return _then(HistoryUpdated(
shortenedUrls: null == shortenedUrls ? _self._shortenedUrls : shortenedUrls // ignore: cast_nullable_to_non_nullable
as List<ShortenedUrl>,lastUpdated: null == lastUpdated ? _self.lastUpdated : lastUpdated // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

// dart format on
