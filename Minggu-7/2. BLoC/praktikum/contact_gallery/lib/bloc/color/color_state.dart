part of 'color_bloc.dart';

abstract class ColorState extends Equatable {
  const ColorState();

  @override
  List<Object> get props => [];
}

class ColorValueState extends ColorState {
  final Color myColor;

  const ColorValueState({required this.myColor});

  @override
  List<Object> get props => [myColor];
}
