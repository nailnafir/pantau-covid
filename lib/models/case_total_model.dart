part of 'models.dart';

class CaseTotalModel {
  String countryRegion;
  String confirmed;
  String recovered;
  String active;
  String deaths;
  String lastUpdate;

  CaseTotalModel({
    required this.countryRegion,
    required this.confirmed,
    required this.recovered,
    required this.active,
    required this.deaths,
    required this.lastUpdate,
  });

  factory CaseTotalModel.fromJson(Map<String, dynamic> object) {
    return CaseTotalModel(
      countryRegion: object['countryRegion'],
      confirmed: object['confirmed'].toString(),
      recovered: object['recovered'].toString(),
      active: object['active'].toString(),
      deaths: object['deaths'].toString(),
      lastUpdate: object['lastUpdate'].toString(),
    );
  }

  static Future<CaseTotalModel> fetchTotal(String name) async {
    String apiURL = URLShared.apiGlobalURL + name;
    var url = Uri.parse(apiURL);

    var apiResult = await http.get(url);
    var jsonObject = json.decode(apiResult.body);
    // var caseData = (jsonObject as Map<String, dynamic>)[0];

    if (apiResult.statusCode == 200) {
      return CaseTotalModel.fromJson(jsonObject[0]);
    } else {
      throw Exception('Gagal menyambungkan ke server');
    }
  }
}
