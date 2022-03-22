part of 'services.dart';

class CaseProvinceService {
  static Future<CaseProvinceModel> getProvinceCase() async {
    final host = ApiUrl.apiCovidURL;
    final client = http.Client();

    var url = Uri.https(host, '/public/api/prov.json');

    var response = await client.get(url);

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      return CaseProvinceModel.fromJson(data);
    } else {
      throw Exception('Gagal menyambungkan ke server');
    }
  }
}
