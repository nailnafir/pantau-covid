part of 'case_province_bloc.dart';

abstract class CaseProvinceEvent extends Equatable {
  const CaseProvinceEvent();
}

class FetchCaseProvince extends CaseProvinceEvent {
  @override
  List<Object> get props => [];
}

class LoadingCaseProvince extends CaseProvinceEvent {
  @override
  List<Object> get props => [];
}
