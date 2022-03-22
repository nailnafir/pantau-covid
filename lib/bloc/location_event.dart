part of 'location_bloc.dart';

abstract class LocationEvent extends Equatable {
  const LocationEvent();
}

class FetchLocation extends LocationEvent {
  @override
  List<Object> get props => [];
}

class LoadingLocation extends LocationEvent {
  @override
  List<Object> get props => [];
}
