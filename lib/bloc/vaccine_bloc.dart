import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_pantau_covid/models/models.dart';
import 'package:flutter_pantau_covid/services/services.dart';

part 'vaccine_event.dart';
part 'vaccine_state.dart';

class VaccineBloc extends Bloc<VaccineEvent, VaccineState> {
  VaccineBloc() : super(VaccineInitial()) {
    on<FetchVaccine>((event, emit) async {
      VaccineModel vaccine = await VaccineService.getVaccine();
      emit(VaccineLoaded(vaccine: vaccine));
    });

    on<LoadingVaccine>((event, emit) {
      emit(VaccineInitial());
    });
  }
}
