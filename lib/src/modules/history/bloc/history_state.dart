part of 'history_bloc.dart';

@freezed
sealed class HistoryState with _$HistoryState {
  const factory HistoryState.initial() = HistoryInitial;
  const factory HistoryState.updated({
    required List<ShortenedUrl> shortenedUrls,
    required DateTime lastUpdated,
  }) = HistoryUpdated;
}
