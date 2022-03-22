part of 'models.dart';

class LocationModel extends Equatable {
  final String address;

  LocationModel({required this.address});

  @override
  List<Object?> get props => [address];
}
