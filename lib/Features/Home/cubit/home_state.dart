part of 'home_cubit.dart';

@immutable
sealed class HomeState {}

final class HomeInitial extends HomeState {}

final class LayoutChangeState extends HomeState {}

/// change product count
final class ChangeProductCountState extends HomeState {}

/// get store products
final class GetProductsLoading extends HomeState {}

final class GetProductsSuccess extends HomeState {}

final class GetProductsError extends HomeState {}

/// get new arrivals products
final class GetNewArrivalsProductsLoading extends HomeState {}

final class GetNewArrivalsProductsSuccess extends HomeState {}

final class GetNewArrivalsProductsError extends HomeState {}
