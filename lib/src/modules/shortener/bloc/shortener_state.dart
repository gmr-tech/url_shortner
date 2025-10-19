part of 'shortener_bloc.dart';

@freezed
sealed class ShortenerState with _$ShortenerState {
  const factory ShortenerState.initial() = _Initial;
  const factory ShortenerState.loading() = _Loading;
  const factory ShortenerState.success({
    required ShortenedUrl shortenedUrl,
  }) = _Success;
  const factory ShortenerState.failure({
    required Failure failure,
  }) = _Failure;
}
