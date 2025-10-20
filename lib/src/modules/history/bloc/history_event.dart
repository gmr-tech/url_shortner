part of 'history_bloc.dart';

@freezed
sealed class HistoryEvent with _$HistoryEvent {
  const factory HistoryEvent.add(ShortenedUrl shortenedUrl) = _Add;
  const factory HistoryEvent.remove(ShortenedUrl shortenedUrl) = _Remove;
}
