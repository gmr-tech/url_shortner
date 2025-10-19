import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'shortener_event.dart';
part 'shortener_state.dart';

class ShortenerBloc extends Bloc<ShortenerEvent, ShortenerState> {
  ShortenerBloc() : super(ShortenerInitial()) {
    on<ShortenerEvent>((event, emit) {});
  }
}
