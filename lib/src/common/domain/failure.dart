import 'package:freezed_annotation/freezed_annotation.dart';

part 'failure.freezed.dart';

/// **MANDARORY**: keep Failures organized in alphabetical order

@freezed
class Failure<T> with _$Failure<T> {
  const factory Failure.invalidData() = InvalidData;
  const factory Failure.networkError() = NetworkError;
  const factory Failure.serverError() = ServerError;
}
