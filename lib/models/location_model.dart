part of 'models.dart';

class UserLocation {
  String address;

  UserLocation({required this.address});

  static Future<UserLocation> getUserLocation() async {
    var position = await Geolocator.getCurrentPosition(
            desiredAccuracy: LocationAccuracy.best)
        .timeout(Duration(seconds: 5));

    try {
      List<Placemark> placemarks =
          await placemarkFromCoordinates(position.latitude, position.longitude);
      print(placemarks[0]);
      return UserLocation(address: placemarks[0].locality.toString());
    } catch (e) {
      throw Exception("Gagal menemukan lokasi");
    }
  }
}
