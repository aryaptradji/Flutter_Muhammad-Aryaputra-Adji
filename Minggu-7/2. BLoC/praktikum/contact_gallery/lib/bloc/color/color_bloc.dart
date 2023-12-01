import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'color_event.dart';
part 'color_state.dart';

class ColorBloc extends Bloc<ColorEvent, ColorState> {
  ColorBloc() : super(const ColorValueState(myColor: Colors.blue)) {
    on<ChooseColorEvent>((event, emit) {
      emit(ColorValueState(myColor: event.colorValue));
    });
  }
}
