part of 'vaccine_bloc.dart';

abstract class VaccineEvent extends Equatable {
  const VaccineEvent();
}

class FetchVaccine extends VaccineEvent {
  @override
  List<Object> get props => [];
}

class LoadingVaccine extends VaccineEvent {
  @override
  List<Object> get props => [];
}
