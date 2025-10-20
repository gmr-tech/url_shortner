import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../common/domain/shortened_url.dart';

part 'history_event.dart';
part 'history_state.dart';
part 'history_bloc.freezed.dart';

@lazySingleton
class HistoryBloc extends Bloc<HistoryEvent, HistoryState> {
  HistoryBloc() : super(const HistoryState.initial()) {
    on<HistoryEvent>((event, emit) {
      if (event is _Add) {
        _onAdd(event, emit);
      }
    });
  }

  void _onAdd(
    HistoryEvent event,
    Emitter<HistoryState> emit,
  ) {
    final currentState = state;
    List<ShortenedUrl> newList = [];

    if (currentState is HistoryUpdated) {
      newList = List<ShortenedUrl>.from(currentState.shortenedUrls)
        ..insert(0, event.shortenedUrl);
    } else {
      newList.add(event.shortenedUrl);
    }

    emit(
      HistoryState.updated(
        shortenedUrls: newList,
        lastUpdated: DateTime.now(),
      ),
    );
  }
}
