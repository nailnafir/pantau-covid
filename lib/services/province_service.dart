part of 'services.dart';

class AllProvinceService {
  static Future<AllProvinceModel> getAllProvince() async {
    final host = ApiUrl.apiLocalURL;
    final client = http.Client();

    var url = Uri.https(host, '/public/api/prov.json');

    var response = await client.get(url);

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      return AllProvinceModel.fromJson(data);
    } else {
      throw Exception('Gagal menyambungkan ke server');
    }
  }
}

class DetailProvinceService {
  static Future<List<DetailProvinceModel>> getDetailProvince() async {
    final host = ApiUrl.apiLocalURL;
    final client = http.Client();

    var url = Uri.https(host, '/public/api/prov.json');

    var response = await client.get(url);

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);

      List result = data['list_data'];

      List<DetailProvinceModel> provinces =
          result.map((e) => DetailProvinceModel.fromJson(e)).toList();
      return provinces;
    } else {
      throw Exception('Gagal menyambungkan ke server');
    }
  }
}
