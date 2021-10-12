part of 'services.dart';

class CaseTotalService {
  static Future<CaseTotalModel> fetchTotal(String name) async {
    String apiURL = URLShared.apiLocalURL + name;
    var url = Uri.parse(apiURL);

    var apiResult = await http.get(url);
    var jsonObject = json.decode(apiResult.body);

    if (apiResult.statusCode == 200) {
      return CaseTotalModel.fromJson(jsonObject);
    } else {
      throw Exception('Gagal menyambungkan ke server');
    }
  }
}
