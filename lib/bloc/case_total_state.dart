part of 'case_total_bloc.dart';

abstract class CaseTotalState extends Equatable {
  const CaseTotalState();
}

class CaseTotalInitial extends CaseTotalState {
  @override
  List<Object> get props => [];
}

class CaseTotalLoaded extends CaseTotalState {
  final CaseTotalModel caseTotal;

  CaseTotalLoaded({required this.caseTotal});

  @override
  List<Object> get props => [caseTotal];
}
