import 'package:equatable/equatable.dart';

class InputUrl extends Equatable {
  const InputUrl(this.url);

  final String url;

  bool get isValid => true;

  @override
  List<Object?> get props => [url];
}
