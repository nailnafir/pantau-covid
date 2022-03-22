part of 'vaccine_bloc.dart';

abstract class VaccineState extends Equatable {
  const VaccineState();
}

class VaccineInitial extends VaccineState {
  @override
  List<Object> get props => [];
}

class VaccineLoaded extends VaccineState {
  final VaccineModel vaccine;

  VaccineLoaded({required this.vaccine});

  @override
  List<Object> get props => [vaccine];
}
