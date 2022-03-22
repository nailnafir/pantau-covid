import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_pantau_covid/models/models.dart';
import 'package:flutter_pantau_covid/services/services.dart';

part 'case_total_event.dart';
part 'case_total_state.dart';

class CaseTotalBloc extends Bloc<CaseTotalEvent, CaseTotalState> {
  CaseTotalBloc() : super(CaseTotalInitial()) {
    on<FetchCaseTotal>((event, emit) async {
      CaseTotalModel caseTotal = await CaseTotalService.getTotalCase();
      emit(CaseTotalLoaded(caseTotal: caseTotal));
    });

    on<LoadingCaseTotal>((event, emit) {
      emit(CaseTotalInitial());
    });
  }
}
