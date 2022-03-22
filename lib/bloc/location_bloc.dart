import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_pantau_covid/models/models.dart';
import 'package:flutter_pantau_covid/services/services.dart';

part 'location_event.dart';
part 'location_state.dart';

class LocationBloc extends Bloc<LocationEvent, LocationState> {
  LocationBloc() : super(LocationInitial()) {
    on<FetchLocation>((event, emit) async {
      LocationModel location = await LocationService.getLocation();
      emit(LocationLoaded(location: location));
    });

    on<LoadingLocation>((event, emit) {
      emit(LocationInitial());
    });
  }
}
