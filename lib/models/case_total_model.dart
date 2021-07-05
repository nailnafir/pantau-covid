part of 'models.dart';

class CaseTotalModel {
  int confirmedTotal;
  int recoveredTotal;
  int activeTotal;
  int deathsTotal;
  int confirmed;
  int recovered;
  int active;
  int deaths;
  String lastUpdate;

  CaseTotalModel({
    required this.confirmedTotal,
    required this.recoveredTotal,
    required this.activeTotal,
    required this.deathsTotal,
    required this.confirmed,
    required this.recovered,
    required this.active,
    required this.deaths,
    required this.lastUpdate,
  });

  factory CaseTotalModel.fromJson(Map<String, dynamic> object) {
    return CaseTotalModel(
      confirmedTotal: object['update']['total']['jumlah_positif'],
      recoveredTotal: object['update']['total']['jumlah_sembuh'],
      activeTotal: object['update']['total']['jumlah_dirawat'],
      deathsTotal: object['update']['total']['jumlah_meninggal'],
      confirmed: object['update']['penambahan']['jumlah_positif'],
      recovered: object['update']['penambahan']['jumlah_sembuh'],
      active: object['update']['penambahan']['jumlah_dirawat'],
      deaths: object['update']['penambahan']['jumlah_meninggal'],
      lastUpdate: object['update']['penambahan']['created'],
    );
  }

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
