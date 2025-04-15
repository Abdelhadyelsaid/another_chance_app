part of 'product_cubit.dart';

@immutable
sealed class ProductState {}

final class ProductInitial extends ProductState {}

final class GetProductByIdLoading extends ProductState {}

final class GetProductByIdSuccess extends ProductState {}

final class GetProductByIdError extends ProductState {}

/// change product count
final class ChangeProductCountState extends ProductState {}
