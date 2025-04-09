part of 'home_cubit.dart';

@immutable
sealed class HomeState {}

final class HomeInitial extends HomeState {}
final class LayoutChangeState extends HomeState {}

/// change esim count
final class ChangeEsimCountState extends HomeState {}

/// get store products
final class GetProductsLoading extends HomeState {}

final class GetProductsSuccess extends HomeState {}

final class GetProductsError extends HomeState {}