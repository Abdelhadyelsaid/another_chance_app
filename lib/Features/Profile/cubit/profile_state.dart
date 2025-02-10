part of 'profile_cubit.dart';

@immutable
sealed class ProfileState {}

final class ProfileInitial extends ProfileState {}
/// get account data
class GetAccountDataLoading extends ProfileState {}

class GetAccountDataSuccess extends ProfileState {}

class GetAccountDataError extends ProfileState {}

/// update account data
class UpdateAccountDataLoading extends ProfileState {}

class UpdateAccountDataSuccess extends ProfileState {}

class UpdateAccountDataError extends ProfileState {}