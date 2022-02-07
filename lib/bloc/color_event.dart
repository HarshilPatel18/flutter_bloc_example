part of 'color_bloc.dart';

@immutable
abstract class ColorEvent {}

// ignore: must_be_immutable
class NameChangeEvent extends ColorEvent {
  int index;
  User user;
  NameChangeEvent({required this.index, required this.user});
}
