part of 'services.dart';

class LocationService {
  static Future<LocationModel> getUserLocation() async {
    var position = await Geolocator.getCurrentPosition(
            desiredAccuracy: LocationAccuracy.best)
        .timeout(Duration(seconds: 5));

    try {
      List<Placemark> placemarks =
          await placemarkFromCoordinates(position.latitude, position.longitude);
      print(placemarks[0]);
      List<String> subAdministrativeList =
          placemarks[0].subAdministrativeArea!.split(" ");
      List<String> localityList = placemarks[0].locality!.split(" ");
      return LocationModel(
          address: "${localityList[1]}, ${subAdministrativeList[1]}.");
    } catch (e) {
      throw Exception("Gagal menemukan lokasi");
    }
  }
}
