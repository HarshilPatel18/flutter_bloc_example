import 'package:bloc/bloc.dart';
import 'package:chang_background/user.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'color_event.dart';
part 'color_state.dart';

class ColorBloc extends Bloc<NameChangeEvent, ColorState> {
  ColorBloc() : super(ColorState(userList: users)) {
    on<NameChangeEvent>((event, emit) {
      state.userList[event.index].name = event.user.name;
      emit(ColorState(index: event.index, userList: users));
    });
  }
}

List<User> users = [
  User(name: "Harshil", age: 24, email: "harshilpatel415@gmail.com"),
  User(name: "Jash", age: 23, email: "shahjash@gmail.com"),
  User(name: "Shubham", age: 21, email: "shubham@gmail.com")
];
