part of 'services.dart';

class CaseTotalService {
  static Future<CaseTotalModel> getTotalCase() async {
    final host = ApiUrl.apiLocalURL;
    final client = http.Client();

    var url = Uri.https(host, '/public/api/update.json');

    var response = await client.get(url);

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      return CaseTotalModel.fromJson(data);
    } else {
      throw Exception('Gagal menyambungkan ke server');
    }
  }
}
