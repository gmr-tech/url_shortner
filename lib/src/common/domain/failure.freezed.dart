// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'failure.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$Failure<T> {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Failure<T>);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'Failure<$T>()';
}


}

/// @nodoc
class $FailureCopyWith<T,$Res>  {
$FailureCopyWith(Failure<T> _, $Res Function(Failure<T>) __);
}


/// Adds pattern-matching-related methods to [Failure].
extension FailurePatterns<T> on Failure<T> {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( InvalidInput<T> value)?  invalidInput,TResult Function( InvalidData<T> value)?  invalidData,TResult Function( NetworkError<T> value)?  networkError,TResult Function( ServerError<T> value)?  serverError,TResult Function( Unexpected<T> value)?  unexpected,required TResult orElse(),}){
final _that = this;
switch (_that) {
case InvalidInput() when invalidInput != null:
return invalidInput(_that);case InvalidData() when invalidData != null:
return invalidData(_that);case NetworkError() when networkError != null:
return networkError(_that);case ServerError() when serverError != null:
return serverError(_that);case Unexpected() when unexpected != null:
return unexpected(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( InvalidInput<T> value)  invalidInput,required TResult Function( InvalidData<T> value)  invalidData,required TResult Function( NetworkError<T> value)  networkError,required TResult Function( ServerError<T> value)  serverError,required TResult Function( Unexpected<T> value)  unexpected,}){
final _that = this;
switch (_that) {
case InvalidInput():
return invalidInput(_that);case InvalidData():
return invalidData(_that);case NetworkError():
return networkError(_that);case ServerError():
return serverError(_that);case Unexpected():
return unexpected(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( InvalidInput<T> value)?  invalidInput,TResult? Function( InvalidData<T> value)?  invalidData,TResult? Function( NetworkError<T> value)?  networkError,TResult? Function( ServerError<T> value)?  serverError,TResult? Function( Unexpected<T> value)?  unexpected,}){
final _that = this;
switch (_that) {
case InvalidInput() when invalidInput != null:
return invalidInput(_that);case InvalidData() when invalidData != null:
return invalidData(_that);case NetworkError() when networkError != null:
return networkError(_that);case ServerError() when serverError != null:
return serverError(_that);case Unexpected() when unexpected != null:
return unexpected(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  invalidInput,TResult Function()?  invalidData,TResult Function()?  networkError,TResult Function()?  serverError,TResult Function( T? object)?  unexpected,required TResult orElse(),}) {final _that = this;
switch (_that) {
case InvalidInput() when invalidInput != null:
return invalidInput();case InvalidData() when invalidData != null:
return invalidData();case NetworkError() when networkError != null:
return networkError();case ServerError() when serverError != null:
return serverError();case Unexpected() when unexpected != null:
return unexpected(_that.object);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  invalidInput,required TResult Function()  invalidData,required TResult Function()  networkError,required TResult Function()  serverError,required TResult Function( T? object)  unexpected,}) {final _that = this;
switch (_that) {
case InvalidInput():
return invalidInput();case InvalidData():
return invalidData();case NetworkError():
return networkError();case ServerError():
return serverError();case Unexpected():
return unexpected(_that.object);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  invalidInput,TResult? Function()?  invalidData,TResult? Function()?  networkError,TResult? Function()?  serverError,TResult? Function( T? object)?  unexpected,}) {final _that = this;
switch (_that) {
case InvalidInput() when invalidInput != null:
return invalidInput();case InvalidData() when invalidData != null:
return invalidData();case NetworkError() when networkError != null:
return networkError();case ServerError() when serverError != null:
return serverError();case Unexpected() when unexpected != null:
return unexpected(_that.object);case _:
  return null;

}
}

}

/// @nodoc


class InvalidInput<T> implements Failure<T> {
  const InvalidInput();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is InvalidInput<T>);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'Failure<$T>.invalidInput()';
}


}




/// @nodoc


class InvalidData<T> implements Failure<T> {
  const InvalidData();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is InvalidData<T>);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'Failure<$T>.invalidData()';
}


}




/// @nodoc


class NetworkError<T> implements Failure<T> {
  const NetworkError();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NetworkError<T>);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'Failure<$T>.networkError()';
}


}




/// @nodoc


class ServerError<T> implements Failure<T> {
  const ServerError();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ServerError<T>);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'Failure<$T>.serverError()';
}


}




/// @nodoc


class Unexpected<T> implements Failure<T> {
  const Unexpected({this.object});
  

 final  T? object;

/// Create a copy of Failure
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UnexpectedCopyWith<T, Unexpected<T>> get copyWith => _$UnexpectedCopyWithImpl<T, Unexpected<T>>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Unexpected<T>&&const DeepCollectionEquality().equals(other.object, object));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(object));

@override
String toString() {
  return 'Failure<$T>.unexpected(object: $object)';
}


}

/// @nodoc
abstract mixin class $UnexpectedCopyWith<T,$Res> implements $FailureCopyWith<T, $Res> {
  factory $UnexpectedCopyWith(Unexpected<T> value, $Res Function(Unexpected<T>) _then) = _$UnexpectedCopyWithImpl;
@useResult
$Res call({
 T? object
});




}
/// @nodoc
class _$UnexpectedCopyWithImpl<T,$Res>
    implements $UnexpectedCopyWith<T, $Res> {
  _$UnexpectedCopyWithImpl(this._self, this._then);

  final Unexpected<T> _self;
  final $Res Function(Unexpected<T>) _then;

/// Create a copy of Failure
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? object = freezed,}) {
  return _then(Unexpected<T>(
object: freezed == object ? _self.object : object // ignore: cast_nullable_to_non_nullable
as T?,
  ));
}


}

// dart format on
