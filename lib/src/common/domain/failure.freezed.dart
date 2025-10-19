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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( InvalidInput<T> value)?  invalidInput,TResult Function( InvalidData<T> value)?  invalidData,TResult Function( NetworkError<T> value)?  networkError,TResult Function( ServerError<T> value)?  serverError,required TResult orElse(),}){
final _that = this;
switch (_that) {
case InvalidInput() when invalidInput != null:
return invalidInput(_that);case InvalidData() when invalidData != null:
return invalidData(_that);case NetworkError() when networkError != null:
return networkError(_that);case ServerError() when serverError != null:
return serverError(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( InvalidInput<T> value)  invalidInput,required TResult Function( InvalidData<T> value)  invalidData,required TResult Function( NetworkError<T> value)  networkError,required TResult Function( ServerError<T> value)  serverError,}){
final _that = this;
switch (_that) {
case InvalidInput():
return invalidInput(_that);case InvalidData():
return invalidData(_that);case NetworkError():
return networkError(_that);case ServerError():
return serverError(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( InvalidInput<T> value)?  invalidInput,TResult? Function( InvalidData<T> value)?  invalidData,TResult? Function( NetworkError<T> value)?  networkError,TResult? Function( ServerError<T> value)?  serverError,}){
final _that = this;
switch (_that) {
case InvalidInput() when invalidInput != null:
return invalidInput(_that);case InvalidData() when invalidData != null:
return invalidData(_that);case NetworkError() when networkError != null:
return networkError(_that);case ServerError() when serverError != null:
return serverError(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  invalidInput,TResult Function()?  invalidData,TResult Function()?  networkError,TResult Function()?  serverError,required TResult orElse(),}) {final _that = this;
switch (_that) {
case InvalidInput() when invalidInput != null:
return invalidInput();case InvalidData() when invalidData != null:
return invalidData();case NetworkError() when networkError != null:
return networkError();case ServerError() when serverError != null:
return serverError();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  invalidInput,required TResult Function()  invalidData,required TResult Function()  networkError,required TResult Function()  serverError,}) {final _that = this;
switch (_that) {
case InvalidInput():
return invalidInput();case InvalidData():
return invalidData();case NetworkError():
return networkError();case ServerError():
return serverError();case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  invalidInput,TResult? Function()?  invalidData,TResult? Function()?  networkError,TResult? Function()?  serverError,}) {final _that = this;
switch (_that) {
case InvalidInput() when invalidInput != null:
return invalidInput();case InvalidData() when invalidData != null:
return invalidData();case NetworkError() when networkError != null:
return networkError();case ServerError() when serverError != null:
return serverError();case _:
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




// dart format on
