part of 'case_total_bloc.dart';

abstract class CaseTotalEvent extends Equatable {
  const CaseTotalEvent();
}

class FetchCaseTotal extends CaseTotalEvent {
  @override
  List<Object> get props => [];
}

class LoadingCaseTotal extends CaseTotalEvent {
  @override
  List<Object> get props => [];
}
