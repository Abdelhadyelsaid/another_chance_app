part of 'home_cubit.dart';

@immutable
sealed class HomeState {}

final class HomeInitial extends HomeState {}
final class LayoutChangeState extends HomeState {}

/// change esim count
final class ChangeEsimCountState extends HomeState {}