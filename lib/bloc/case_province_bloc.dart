import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_pantau_covid/models/models.dart';
import 'package:flutter_pantau_covid/services/services.dart';

part 'case_province_event.dart';
part 'case_province_state.dart';

class CaseProvinceBloc extends Bloc<CaseProvinceEvent, CaseProvinceState> {
  CaseProvinceBloc() : super(CaseProvinceInitial()) {
    on<FetchCaseProvince>((event, emit) async {
      CaseProvinceModel caseProvince =
          await CaseProvinceService.getProvinceCase();
      emit(CaseProvinceLoaded(caseProvince: caseProvince));
    });

    on<LoadingCaseProvince>((event, emit) {
      emit(CaseProvinceInitial());
    });
  }
}
