part of 'case_province_bloc.dart';

abstract class CaseProvinceState extends Equatable {
  const CaseProvinceState();
}

class CaseProvinceInitial extends CaseProvinceState {
  @override
  List<Object> get props => [];
}

class CaseProvinceLoaded extends CaseProvinceState {
  final CaseProvinceModel caseProvince;

  CaseProvinceLoaded({required this.caseProvince});

  @override
  List<Object> get props => [caseProvince];
}
