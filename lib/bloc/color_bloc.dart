import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'color_event.dart';
part 'color_state.dart';

class ColorBloc extends Bloc<ChangeColorEvent, ColorState> {
  ColorBloc() : super(ColorState(colorvalue: Colors.blueAccent)) {
    on<ChangeColorEvent>((event, emit) {
      if (state.colorvalue == Colors.blueAccent) {
        emit(ColorState(colorvalue: Colors.greenAccent));
      } else {
        emit(ColorState(colorvalue: Colors.blueAccent));
      }
    });
  }
}
