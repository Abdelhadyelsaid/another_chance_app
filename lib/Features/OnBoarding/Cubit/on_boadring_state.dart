part of 'on_boadring_cubit.dart';

@immutable
sealed class OnBoardingState {}

final class OnBoardingInitial extends OnBoardingState {}

class MapPickerLoading extends OnBoardingState {}

class MapPickerLoaded extends OnBoardingState {
  final String address;
  final String city;
  final String area;

  MapPickerLoaded(this.address, this.city, this.area);
}

class MapPickerError extends OnBoardingState {
  final String message;

  MapPickerError(this.message);
}

class LocationDisabledState extends OnBoardingState {
  final String message;

  LocationDisabledState(this.message);
}

class LocationGrantedState extends OnBoardingState {}

class LocationDeniedState extends OnBoardingState {
  final String message;

  LocationDeniedState(this.message);
}

final class ImageSelectedSuccessState extends OnBoardingState {}

final class ImageSelectedErrorState extends OnBoardingState {}

final class ImageRemovedSuccessState extends OnBoardingState {}
///Request a collection
final class RequestLoadingState extends OnBoardingState {}

final class RequestSuccessState extends OnBoardingState {}

final class RequestErrorState extends OnBoardingState {}
