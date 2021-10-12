part of 'services.dart';

class LocalVaccineService {
  static Future<LocalVaccineModel> fetchVaccine(String type) async {
    String apiURL = URLShared.apiVaccineURL + type;
    var url = Uri.parse(apiURL);

    var apiResult = await http.get(url);
    var jsonObject = json.decode(apiResult.body);

    if (apiResult.statusCode == 200) {
      return LocalVaccineModel.fromJson(jsonObject);
    } else {
      throw Exception('Gagal menyambungkan ke server');
    }
  }
}

class MonitoringVaccineService {
  static Future<List<MonitoringVaccineModel>> fetchVaccine(String name) async {
    String apiURL = URLShared.apiVaccineURL + name;
    var url = Uri.parse(apiURL);

    var response = await http.get(url);
    var data = json.decode(response.body);

    List<MonitoringVaccineModel> vaccines = (data['monitoring'] as List)
        .map((e) => MonitoringVaccineModel.fromJson(e))
        .toList();

    if (response.statusCode == 200) {
      return vaccines;
    } else {
      throw Exception('Gagal menyambungkan ke server');
    }
  }
}
