import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../common/domain/failure.dart';
import '../../../common/domain/input_url.dart';
import '../../../common/domain/shortened_url.dart';
import '../domain/shorten_url_usecase.dart';

part 'shortener_event.dart';
part 'shortener_state.dart';
part 'shortener_bloc.freezed.dart';

@lazySingleton
class ShortenerBloc extends Bloc<ShortenerEvent, ShortenerState> {
  ShortenerBloc(this._useCase) : super(const ShortenerState.initial()) {
    on<ShortenerEvent>(
      (event, emit) async => switch (event) {
        _Reset() => _onReset(emit),
        _AddInput() => _onAddInput(event, emit),
        _Shorten() => _onShorten(event, emit),
      },
    );
  }

  final ShortenUrlUseCase _useCase;

  Future<void> _onShorten(
    _Shorten event,
    Emitter<ShortenerState> emit,
  ) async {
    final currentState = state;

    if (currentState is! ShortenerHasInput) {
      return emit(const ShortenerState.failure(failure: Failure.unexpected()));
    }

    emit(const ShortenerState.loading());

    final result = await _useCase.call(currentState.inputUrl);

    result.fold(
      (failure) => emit(
        ShortenerState.failure(failure: failure),
      ),
      (shortenedUrl) => emit(
        ShortenerState.success(shortenedUrl: shortenedUrl),
      ),
    );
  }

  void _onAddInput(
    _AddInput event,
    Emitter<ShortenerState> emit,
  ) async => emit(ShortenerState.hasInput(inputUrl: event.inputUrl));

  void _onReset(
    Emitter<ShortenerState> emit,
  ) => emit(const ShortenerState.initial());
}
