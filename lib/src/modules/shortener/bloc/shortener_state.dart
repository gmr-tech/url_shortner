part of 'shortener_bloc.dart';

sealed class ShortenerState extends Equatable {
  const ShortenerState();
  
  @override
  List<Object> get props => [];
}

final class ShortenerInitial extends ShortenerState {}
