part of 'services.dart';

class AllProvinceService {
  static Future<AllProvinceModel> fetchAll(String name) async {
    String apiURL = URLShared.apiLocalURL + name;
    var url = Uri.parse(apiURL);

    var apiResult = await http.get(url);
    var jsonObject = json.decode(apiResult.body);

    if (apiResult.statusCode == 200) {
      return AllProvinceModel.fromJson(jsonObject);
    } else {
      throw Exception('Gagal menyambungkan ke server');
    }
  }
}

class DetailProvinceService {
  static Future<List<DetailProvinceModel>> fetchDetail(String name) async {
    String apiURL = URLShared.apiLocalURL + name;
    var url = Uri.parse(apiURL);

    var response = await http.get(url);
    var data = json.decode(response.body);

    List<DetailProvinceModel> provinces = (data['list_data'] as Iterable)
        .map((e) => DetailProvinceModel.fromJson(e))
        .toList();
    if (response.statusCode == 200) {
      return provinces;
    } else {
      throw Exception('Gagal menyambungkan ke server');
    }
  }
}
