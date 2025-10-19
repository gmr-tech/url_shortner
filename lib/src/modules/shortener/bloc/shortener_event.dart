part of 'shortener_bloc.dart';

@freezed
sealed class ShortenerEvent with _$ShortenerEvent {
  const factory ShortenerEvent.reset() = _Reset;
  const factory ShortenerEvent.shorten({
    required InputUrl inputUrl,
  }) = _Shorten;
}
