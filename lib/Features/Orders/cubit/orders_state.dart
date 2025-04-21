part of 'orders_cubit.dart';

@immutable
sealed class OrdersState {}

final class OrdersInitial extends OrdersState {}

/// get orders

class GetOrdersLoadingState extends OrdersState {}

class GetOrdersSuccessState extends OrdersState {}

class GetOrdersErrorState extends OrdersState {}
