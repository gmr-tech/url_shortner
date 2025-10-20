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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Reset value)?  reset,TResult Function( _AddInput value)?  addInput,TResult Function( _Shorten value)?  shorten,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Reset() when reset != null:
return reset(_that);case _AddInput() when addInput != null:
return addInput(_that);case _Shorten() when shorten != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Reset value)  reset,required TResult Function( _AddInput value)  addInput,required TResult Function( _Shorten value)  shorten,}){
final _that = this;
switch (_that) {
case _Reset():
return reset(_that);case _AddInput():
return addInput(_that);case _Shorten():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Reset value)?  reset,TResult? Function( _AddInput value)?  addInput,TResult? Function( _Shorten value)?  shorten,}){
final _that = this;
switch (_that) {
case _Reset() when reset != null:
return reset(_that);case _AddInput() when addInput != null:
return addInput(_that);case _Shorten() when shorten != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  reset,TResult Function( InputUrl inputUrl)?  addInput,TResult Function()?  shorten,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Reset() when reset != null:
return reset();case _AddInput() when addInput != null:
return addInput(_that.inputUrl);case _Shorten() when shorten != null:
return shorten();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  reset,required TResult Function( InputUrl inputUrl)  addInput,required TResult Function()  shorten,}) {final _that = this;
switch (_that) {
case _Reset():
return reset();case _AddInput():
return addInput(_that.inputUrl);case _Shorten():
return shorten();}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  reset,TResult? Function( InputUrl inputUrl)?  addInput,TResult? Function()?  shorten,}) {final _that = this;
switch (_that) {
case _Reset() when reset != null:
return reset();case _AddInput() when addInput != null:
return addInput(_that.inputUrl);case _Shorten() when shorten != null:
return shorten();case _:
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


class _AddInput implements ShortenerEvent {
  const _AddInput({required this.inputUrl});
  

 final  InputUrl inputUrl;

/// Create a copy of ShortenerEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AddInputCopyWith<_AddInput> get copyWith => __$AddInputCopyWithImpl<_AddInput>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AddInput&&(identical(other.inputUrl, inputUrl) || other.inputUrl == inputUrl));
}


@override
int get hashCode => Object.hash(runtimeType,inputUrl);

@override
String toString() {
  return 'ShortenerEvent.addInput(inputUrl: $inputUrl)';
}


}

/// @nodoc
abstract mixin class _$AddInputCopyWith<$Res> implements $ShortenerEventCopyWith<$Res> {
  factory _$AddInputCopyWith(_AddInput value, $Res Function(_AddInput) _then) = __$AddInputCopyWithImpl;
@useResult
$Res call({
 InputUrl inputUrl
});




}
/// @nodoc
class __$AddInputCopyWithImpl<$Res>
    implements _$AddInputCopyWith<$Res> {
  __$AddInputCopyWithImpl(this._self, this._then);

  final _AddInput _self;
  final $Res Function(_AddInput) _then;

/// Create a copy of ShortenerEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? inputUrl = null,}) {
  return _then(_AddInput(
inputUrl: null == inputUrl ? _self.inputUrl : inputUrl // ignore: cast_nullable_to_non_nullable
as InputUrl,
  ));
}


}

/// @nodoc


class _Shorten implements ShortenerEvent {
  const _Shorten();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Shorten);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ShortenerEvent.shorten()';
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( ShortenerInitial value)?  initial,TResult Function( ShortenerHasInput value)?  hasInput,TResult Function( ShortenerLoading value)?  loading,TResult Function( ShortenerSuccess value)?  success,TResult Function( ShortenerFailure value)?  failure,required TResult orElse(),}){
final _that = this;
switch (_that) {
case ShortenerInitial() when initial != null:
return initial(_that);case ShortenerHasInput() when hasInput != null:
return hasInput(_that);case ShortenerLoading() when loading != null:
return loading(_that);case ShortenerSuccess() when success != null:
return success(_that);case ShortenerFailure() when failure != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( ShortenerInitial value)  initial,required TResult Function( ShortenerHasInput value)  hasInput,required TResult Function( ShortenerLoading value)  loading,required TResult Function( ShortenerSuccess value)  success,required TResult Function( ShortenerFailure value)  failure,}){
final _that = this;
switch (_that) {
case ShortenerInitial():
return initial(_that);case ShortenerHasInput():
return hasInput(_that);case ShortenerLoading():
return loading(_that);case ShortenerSuccess():
return success(_that);case ShortenerFailure():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( ShortenerInitial value)?  initial,TResult? Function( ShortenerHasInput value)?  hasInput,TResult? Function( ShortenerLoading value)?  loading,TResult? Function( ShortenerSuccess value)?  success,TResult? Function( ShortenerFailure value)?  failure,}){
final _that = this;
switch (_that) {
case ShortenerInitial() when initial != null:
return initial(_that);case ShortenerHasInput() when hasInput != null:
return hasInput(_that);case ShortenerLoading() when loading != null:
return loading(_that);case ShortenerSuccess() when success != null:
return success(_that);case ShortenerFailure() when failure != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function( InputUrl inputUrl)?  hasInput,TResult Function()?  loading,TResult Function( ShortenedUrl shortenedUrl)?  success,TResult Function( Failure failure,  InputUrl? inputUrl)?  failure,required TResult orElse(),}) {final _that = this;
switch (_that) {
case ShortenerInitial() when initial != null:
return initial();case ShortenerHasInput() when hasInput != null:
return hasInput(_that.inputUrl);case ShortenerLoading() when loading != null:
return loading();case ShortenerSuccess() when success != null:
return success(_that.shortenedUrl);case ShortenerFailure() when failure != null:
return failure(_that.failure,_that.inputUrl);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function( InputUrl inputUrl)  hasInput,required TResult Function()  loading,required TResult Function( ShortenedUrl shortenedUrl)  success,required TResult Function( Failure failure,  InputUrl? inputUrl)  failure,}) {final _that = this;
switch (_that) {
case ShortenerInitial():
return initial();case ShortenerHasInput():
return hasInput(_that.inputUrl);case ShortenerLoading():
return loading();case ShortenerSuccess():
return success(_that.shortenedUrl);case ShortenerFailure():
return failure(_that.failure,_that.inputUrl);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function( InputUrl inputUrl)?  hasInput,TResult? Function()?  loading,TResult? Function( ShortenedUrl shortenedUrl)?  success,TResult? Function( Failure failure,  InputUrl? inputUrl)?  failure,}) {final _that = this;
switch (_that) {
case ShortenerInitial() when initial != null:
return initial();case ShortenerHasInput() when hasInput != null:
return hasInput(_that.inputUrl);case ShortenerLoading() when loading != null:
return loading();case ShortenerSuccess() when success != null:
return success(_that.shortenedUrl);case ShortenerFailure() when failure != null:
return failure(_that.failure,_that.inputUrl);case _:
  return null;

}
}

}

/// @nodoc


class ShortenerInitial implements ShortenerState {
  const ShortenerInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ShortenerInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ShortenerState.initial()';
}


}




/// @nodoc


class ShortenerHasInput implements ShortenerState {
  const ShortenerHasInput({required this.inputUrl});
  

 final  InputUrl inputUrl;

/// Create a copy of ShortenerState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ShortenerHasInputCopyWith<ShortenerHasInput> get copyWith => _$ShortenerHasInputCopyWithImpl<ShortenerHasInput>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ShortenerHasInput&&(identical(other.inputUrl, inputUrl) || other.inputUrl == inputUrl));
}


@override
int get hashCode => Object.hash(runtimeType,inputUrl);

@override
String toString() {
  return 'ShortenerState.hasInput(inputUrl: $inputUrl)';
}


}

/// @nodoc
abstract mixin class $ShortenerHasInputCopyWith<$Res> implements $ShortenerStateCopyWith<$Res> {
  factory $ShortenerHasInputCopyWith(ShortenerHasInput value, $Res Function(ShortenerHasInput) _then) = _$ShortenerHasInputCopyWithImpl;
@useResult
$Res call({
 InputUrl inputUrl
});




}
/// @nodoc
class _$ShortenerHasInputCopyWithImpl<$Res>
    implements $ShortenerHasInputCopyWith<$Res> {
  _$ShortenerHasInputCopyWithImpl(this._self, this._then);

  final ShortenerHasInput _self;
  final $Res Function(ShortenerHasInput) _then;

/// Create a copy of ShortenerState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? inputUrl = null,}) {
  return _then(ShortenerHasInput(
inputUrl: null == inputUrl ? _self.inputUrl : inputUrl // ignore: cast_nullable_to_non_nullable
as InputUrl,
  ));
}


}

/// @nodoc


class ShortenerLoading implements ShortenerState {
  const ShortenerLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ShortenerLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ShortenerState.loading()';
}


}




/// @nodoc


class ShortenerSuccess implements ShortenerState {
  const ShortenerSuccess({required this.shortenedUrl});
  

 final  ShortenedUrl shortenedUrl;

/// Create a copy of ShortenerState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ShortenerSuccessCopyWith<ShortenerSuccess> get copyWith => _$ShortenerSuccessCopyWithImpl<ShortenerSuccess>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ShortenerSuccess&&(identical(other.shortenedUrl, shortenedUrl) || other.shortenedUrl == shortenedUrl));
}


@override
int get hashCode => Object.hash(runtimeType,shortenedUrl);

@override
String toString() {
  return 'ShortenerState.success(shortenedUrl: $shortenedUrl)';
}


}

/// @nodoc
abstract mixin class $ShortenerSuccessCopyWith<$Res> implements $ShortenerStateCopyWith<$Res> {
  factory $ShortenerSuccessCopyWith(ShortenerSuccess value, $Res Function(ShortenerSuccess) _then) = _$ShortenerSuccessCopyWithImpl;
@useResult
$Res call({
 ShortenedUrl shortenedUrl
});




}
/// @nodoc
class _$ShortenerSuccessCopyWithImpl<$Res>
    implements $ShortenerSuccessCopyWith<$Res> {
  _$ShortenerSuccessCopyWithImpl(this._self, this._then);

  final ShortenerSuccess _self;
  final $Res Function(ShortenerSuccess) _then;

/// Create a copy of ShortenerState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? shortenedUrl = null,}) {
  return _then(ShortenerSuccess(
shortenedUrl: null == shortenedUrl ? _self.shortenedUrl : shortenedUrl // ignore: cast_nullable_to_non_nullable
as ShortenedUrl,
  ));
}


}

/// @nodoc


class ShortenerFailure implements ShortenerState {
  const ShortenerFailure({required this.failure, this.inputUrl});
  

 final  Failure failure;
 final  InputUrl? inputUrl;

/// Create a copy of ShortenerState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ShortenerFailureCopyWith<ShortenerFailure> get copyWith => _$ShortenerFailureCopyWithImpl<ShortenerFailure>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ShortenerFailure&&(identical(other.failure, failure) || other.failure == failure)&&(identical(other.inputUrl, inputUrl) || other.inputUrl == inputUrl));
}


@override
int get hashCode => Object.hash(runtimeType,failure,inputUrl);

@override
String toString() {
  return 'ShortenerState.failure(failure: $failure, inputUrl: $inputUrl)';
}


}

/// @nodoc
abstract mixin class $ShortenerFailureCopyWith<$Res> implements $ShortenerStateCopyWith<$Res> {
  factory $ShortenerFailureCopyWith(ShortenerFailure value, $Res Function(ShortenerFailure) _then) = _$ShortenerFailureCopyWithImpl;
@useResult
$Res call({
 Failure failure, InputUrl? inputUrl
});


$FailureCopyWith<dynamic, $Res> get failure;

}
/// @nodoc
class _$ShortenerFailureCopyWithImpl<$Res>
    implements $ShortenerFailureCopyWith<$Res> {
  _$ShortenerFailureCopyWithImpl(this._self, this._then);

  final ShortenerFailure _self;
  final $Res Function(ShortenerFailure) _then;

/// Create a copy of ShortenerState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? failure = null,Object? inputUrl = freezed,}) {
  return _then(ShortenerFailure(
failure: null == failure ? _self.failure : failure // ignore: cast_nullable_to_non_nullable
as Failure,inputUrl: freezed == inputUrl ? _self.inputUrl : inputUrl // ignore: cast_nullable_to_non_nullable
as InputUrl?,
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
