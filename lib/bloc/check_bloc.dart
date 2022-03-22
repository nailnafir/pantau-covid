import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_pantau_covid/models/models.dart';
import 'package:flutter_pantau_covid/services/services.dart';

part 'check_event.dart';
part 'check_state.dart';

class CheckBloc extends Bloc<CheckEvent, CheckState> {
  CheckBloc() : super(CheckInitial()) {
    on<FetchCheck>((event, emit) async {
      CheckModel check = await CheckService.getCheck();
      emit(CheckLoaded(check: check));
    });

    on<LoadingCheck>((event, emit) {
      emit(CheckInitial());
    });
  }
}
