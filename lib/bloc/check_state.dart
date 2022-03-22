part of 'check_bloc.dart';

abstract class CheckState extends Equatable {
  const CheckState();
}

class CheckInitial extends CheckState {
  @override
  List<Object> get props => [];
}

class CheckLoaded extends CheckState {
  final CheckModel check;

  CheckLoaded({required this.check});

  @override
  List<Object> get props => [check];
}
