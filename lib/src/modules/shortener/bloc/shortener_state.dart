part of 'shortener_bloc.dart';

@freezed
sealed class ShortenerState with _$ShortenerState {
  const factory ShortenerState.initial() = ShortenerInitial;
  const factory ShortenerState.hasInput({
    required InputUrl inputUrl,
  }) = ShortenerHasInput;
  const factory ShortenerState.loading() = ShortenerLoading;
  const factory ShortenerState.success({
    required ShortenedUrl shortenedUrl,
  }) = ShortenerSuccess;
  const factory ShortenerState.failure({
    required Failure failure,
  }) = ShortenerFailure;
}
