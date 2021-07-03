part of 'models.dart';

class CaseTotalModel {
  String countryRegion;
  int confirmed;
  int recovered;
  int active;
  int deaths;
  DateTime lastUpdate;

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
      confirmed: object['confirmed'],
      recovered: object['recovered'],
      active: object['active'],
      deaths: object['deaths'],
      lastUpdate: DateTime.fromMillisecondsSinceEpoch(object['lastUpdate']),
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
