part of 'shortener_bloc.dart';

@freezed
sealed class ShortenerEvent with _$ShortenerEvent {
  const factory ShortenerEvent.reset() = _Reset;
  const factory ShortenerEvent.addInput({
    required InputUrl inputUrl,
  }) = _AddInput;
  const factory ShortenerEvent.shorten() = _Shorten;
}
