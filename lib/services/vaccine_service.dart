part of 'services.dart';

class VaccineService {
  static Future<VaccineModel> getVaccine() async {
    final host = ApiUrl.apiCovidURL;
    final client = http.Client();

    var url = Uri.https(host, '/public/api/pemeriksaan-vaksinasi.json');

    var response = await client.get(url);

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      return VaccineModel.fromJson(data);
    } else {
      throw Exception('Gagal menyambungkan ke server');
    }
  }
}
