// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'shortener_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ShortenerEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ShortenerEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ShortenerEvent()';
}


}

/// @nodoc
class $ShortenerEventCopyWith<$Res>  {
$ShortenerEventCopyWith(ShortenerEvent _, $Res Function(ShortenerEvent) __);
}


/// Adds pattern-matching-related methods to [ShortenerEvent].
extension ShortenerEventPatterns on ShortenerEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Reset value)?  reset,TResult Function( _Shorten value)?  shorten,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Reset() when reset != null:
return reset(_that);case _Shorten() when shorten != null:
return shorten(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Reset value)  reset,required TResult Function( _Shorten value)  shorten,}){
final _that = this;
switch (_that) {
case _Reset():
return reset(_that);case _Shorten():
return shorten(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Reset value)?  reset,TResult? Function( _Shorten value)?  shorten,}){
final _that = this;
switch (_that) {
case _Reset() when reset != null:
return reset(_that);case _Shorten() when shorten != null:
return shorten(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  reset,TResult Function( InputUrl inputUrl)?  shorten,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Reset() when reset != null:
return reset();case _Shorten() when shorten != null:
return shorten(_that.inputUrl);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  reset,required TResult Function( InputUrl inputUrl)  shorten,}) {final _that = this;
switch (_that) {
case _Reset():
return reset();case _Shorten():
return shorten(_that.inputUrl);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  reset,TResult? Function( InputUrl inputUrl)?  shorten,}) {final _that = this;
switch (_that) {
case _Reset() when reset != null:
return reset();case _Shorten() when shorten != null:
return shorten(_that.inputUrl);case _:
  return null;

}
}

}

/// @nodoc


class _Reset implements ShortenerEvent {
  const _Reset();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Reset);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ShortenerEvent.reset()';
}


}




/// @nodoc


class _Shorten implements ShortenerEvent {
  const _Shorten({required this.inputUrl});
  

 final  InputUrl inputUrl;

/// Create a copy of ShortenerEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ShortenCopyWith<_Shorten> get copyWith => __$ShortenCopyWithImpl<_Shorten>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Shorten&&(identical(other.inputUrl, inputUrl) || other.inputUrl == inputUrl));
}


@override
int get hashCode => Object.hash(runtimeType,inputUrl);

@override
String toString() {
  return 'ShortenerEvent.shorten(inputUrl: $inputUrl)';
}


}

/// @nodoc
abstract mixin class _$ShortenCopyWith<$Res> implements $ShortenerEventCopyWith<$Res> {
  factory _$ShortenCopyWith(_Shorten value, $Res Function(_Shorten) _then) = __$ShortenCopyWithImpl;
@useResult
$Res call({
 InputUrl inputUrl
});




}
/// @nodoc
class __$ShortenCopyWithImpl<$Res>
    implements _$ShortenCopyWith<$Res> {
  __$ShortenCopyWithImpl(this._self, this._then);

  final _Shorten _self;
  final $Res Function(_Shorten) _then;

/// Create a copy of ShortenerEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? inputUrl = null,}) {
  return _then(_Shorten(
inputUrl: null == inputUrl ? _self.inputUrl : inputUrl // ignore: cast_nullable_to_non_nullable
as InputUrl,
  ));
}


}

/// @nodoc
mixin _$ShortenerState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ShortenerState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ShortenerState()';
}


}

/// @nodoc
class $ShortenerStateCopyWith<$Res>  {
$ShortenerStateCopyWith(ShortenerState _, $Res Function(ShortenerState) __);
}


/// Adds pattern-matching-related methods to [ShortenerState].
extension ShortenerStatePatterns on ShortenerState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Initial value)?  initial,TResult Function( _Loading value)?  loading,TResult Function( _Success value)?  success,TResult Function( _Failure value)?  failure,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case _Loading() when loading != null:
return loading(_that);case _Success() when success != null:
return success(_that);case _Failure() when failure != null:
return failure(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Initial value)  initial,required TResult Function( _Loading value)  loading,required TResult Function( _Success value)  success,required TResult Function( _Failure value)  failure,}){
final _that = this;
switch (_that) {
case _Initial():
return initial(_that);case _Loading():
return loading(_that);case _Success():
return success(_that);case _Failure():
return failure(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Initial value)?  initial,TResult? Function( _Loading value)?  loading,TResult? Function( _Success value)?  success,TResult? Function( _Failure value)?  failure,}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case _Loading() when loading != null:
return loading(_that);case _Success() when success != null:
return success(_that);case _Failure() when failure != null:
return failure(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( ShortenedUrl shortenedUrl)?  success,TResult Function( Failure failure)?  failure,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case _Loading() when loading != null:
return loading();case _Success() when success != null:
return success(_that.shortenedUrl);case _Failure() when failure != null:
return failure(_that.failure);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( ShortenedUrl shortenedUrl)  success,required TResult Function( Failure failure)  failure,}) {final _that = this;
switch (_that) {
case _Initial():
return initial();case _Loading():
return loading();case _Success():
return success(_that.shortenedUrl);case _Failure():
return failure(_that.failure);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( ShortenedUrl shortenedUrl)?  success,TResult? Function( Failure failure)?  failure,}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case _Loading() when loading != null:
return loading();case _Success() when success != null:
return success(_that.shortenedUrl);case _Failure() when failure != null:
return failure(_that.failure);case _:
  return null;

}
}

}

/// @nodoc


class _Initial implements ShortenerState {
  const _Initial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Initial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ShortenerState.initial()';
}


}




/// @nodoc


class _Loading implements ShortenerState {
  const _Loading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Loading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ShortenerState.loading()';
}


}




/// @nodoc


class _Success implements ShortenerState {
  const _Success({required this.shortenedUrl});
  

 final  ShortenedUrl shortenedUrl;

/// Create a copy of ShortenerState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SuccessCopyWith<_Success> get copyWith => __$SuccessCopyWithImpl<_Success>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Success&&(identical(other.shortenedUrl, shortenedUrl) || other.shortenedUrl == shortenedUrl));
}


@override
int get hashCode => Object.hash(runtimeType,shortenedUrl);

@override
String toString() {
  return 'ShortenerState.success(shortenedUrl: $shortenedUrl)';
}


}

/// @nodoc
abstract mixin class _$SuccessCopyWith<$Res> implements $ShortenerStateCopyWith<$Res> {
  factory _$SuccessCopyWith(_Success value, $Res Function(_Success) _then) = __$SuccessCopyWithImpl;
@useResult
$Res call({
 ShortenedUrl shortenedUrl
});




}
/// @nodoc
class __$SuccessCopyWithImpl<$Res>
    implements _$SuccessCopyWith<$Res> {
  __$SuccessCopyWithImpl(this._self, this._then);

  final _Success _self;
  final $Res Function(_Success) _then;

/// Create a copy of ShortenerState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? shortenedUrl = null,}) {
  return _then(_Success(
shortenedUrl: null == shortenedUrl ? _self.shortenedUrl : shortenedUrl // ignore: cast_nullable_to_non_nullable
as ShortenedUrl,
  ));
}


}

/// @nodoc


class _Failure implements ShortenerState {
  const _Failure({required this.failure});
  

 final  Failure failure;

/// Create a copy of ShortenerState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FailureCopyWith<_Failure> get copyWith => __$FailureCopyWithImpl<_Failure>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Failure&&(identical(other.failure, failure) || other.failure == failure));
}


@override
int get hashCode => Object.hash(runtimeType,failure);

@override
String toString() {
  return 'ShortenerState.failure(failure: $failure)';
}


}

/// @nodoc
abstract mixin class _$FailureCopyWith<$Res> implements $ShortenerStateCopyWith<$Res> {
  factory _$FailureCopyWith(_Failure value, $Res Function(_Failure) _then) = __$FailureCopyWithImpl;
@useResult
$Res call({
 Failure failure
});


$FailureCopyWith<dynamic, $Res> get failure;

}
/// @nodoc
class __$FailureCopyWithImpl<$Res>
    implements _$FailureCopyWith<$Res> {
  __$FailureCopyWithImpl(this._self, this._then);

  final _Failure _self;
  final $Res Function(_Failure) _then;

/// Create a copy of ShortenerState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? failure = null,}) {
  return _then(_Failure(
failure: null == failure ? _self.failure : failure // ignore: cast_nullable_to_non_nullable
as Failure,
  ));
}

/// Create a copy of ShortenerState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$FailureCopyWith<dynamic, $Res> get failure {
  
  return $FailureCopyWith<dynamic, $Res>(_self.failure, (value) {
    return _then(_self.copyWith(failure: value));
  });
}
}

// dart format on
