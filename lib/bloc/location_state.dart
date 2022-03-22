part of 'location_bloc.dart';

abstract class LocationState extends Equatable {
  const LocationState();
}

class LocationInitial extends LocationState {
  @override
  List<Object> get props => [];
}

class LocationLoaded extends LocationState {
  final LocationModel location;

  LocationLoaded({required this.location});

  @override
  List<Object> get props => [location];
}
