import 'package:equatable/equatable.dart';

class InputUrl extends Equatable {
  const InputUrl(this.url);

  final String url;

  @override
  List<Object?> get props => [url];
}
