part of 'services.dart';

class LocalVaccineService {
  static Future<LocalVaccineModel> getVaccine() async {
    final host = ApiUrl.apiVaccineURL;
    final client = http.Client();

    var url = Uri.https(host, '/vaksinasi');

    var response = await client.get(url);

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      return LocalVaccineModel.fromJson(data);
    } else {
      throw Exception('Gagal menyambungkan ke server');
    }
  }
}

class MonitoringVaccineService {
  static Future<List<MonitoringVaccineModel>> getVaccine() async {
    final host = ApiUrl.apiVaccineURL;
    final client = http.Client();

    var url = Uri.https(host, '/vaksinasi');

    var response = await client.get(url);

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);

      List result = data['monitoring'];

      List<MonitoringVaccineModel> vaccines =
          result.map((e) => MonitoringVaccineModel.fromJson(e)).toList();
      return vaccines;
    } else {
      throw Exception('Gagal menyambungkan ke server');
    }
  }
}
