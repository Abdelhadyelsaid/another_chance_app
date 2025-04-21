part of 'product_cubit.dart';

@immutable
sealed class ProductState {}

final class ProductInitial extends ProductState {}

final class GetProductByIdLoading extends ProductState {}

final class GetProductByIdSuccess extends ProductState {}

final class GetProductByIdError extends ProductState {}

/// get cart products
class GetCartProductsLoading extends ProductState {}

class GetCartProductsSuccess extends ProductState {}

class GetCartProductsError extends ProductState {}


/// add product to cart
class AddProductToCartLoading extends ProductState {}

class AddProductToCartSuccess extends ProductState {}

class AddProductToCartError extends ProductState {}


/// delete product from cart
class DeleteProductFromCartLoading extends ProductState {}

class DeleteProductFromCartSuccess extends ProductState {}

class DeleteProductFromCartError extends ProductState {}

/// change product count
final class ChangeProductCountState extends ProductState {}

/// make order
class MakeOrderLoading extends ProductState {}

class MakeOrderSuccess extends ProductState {}

class MakeOrderError extends ProductState {}


/// delete cart
class DeleteCartLoading extends ProductState {}

class DeleteCartSuccess extends ProductState {}

class DeleteCartError extends ProductState {}