part of 'check_bloc.dart';

abstract class CheckEvent extends Equatable {
  const CheckEvent();
}

class FetchCheck extends CheckEvent {
  @override
  List<Object> get props => [];
}

class LoadingCheck extends CheckEvent {
  @override
  List<Object> get props => [];
}
