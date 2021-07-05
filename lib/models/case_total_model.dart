part of 'models.dart';

class CaseTotalModel {
  int confirmedTotal;
  int recoveredTotal;
  int activeTotal;
  int deathsTotal;
  int confirmedUpdate;
  int recoveredUpdate;
  int activeUpdate;
  int deathsUpdate;
  String lastUpdate;

  CaseTotalModel({
    required this.confirmedTotal,
    required this.recoveredTotal,
    required this.activeTotal,
    required this.deathsTotal,
    required this.confirmedUpdate,
    required this.recoveredUpdate,
    required this.activeUpdate,
    required this.deathsUpdate,
    required this.lastUpdate,
  });

  factory CaseTotalModel.fromJson(Map<String, dynamic> object) {
    return CaseTotalModel(
      confirmedTotal: object['update']['total']['jumlah_positif'],
      recoveredTotal: object['update']['total']['jumlah_sembuh'],
      activeTotal: object['update']['total']['jumlah_dirawat'],
      deathsTotal: object['update']['total']['jumlah_meninggal'],
      confirmedUpdate: object['update']['penambahan']['jumlah_positif'],
      recoveredUpdate: object['update']['penambahan']['jumlah_sembuh'],
      activeUpdate: object['update']['penambahan']['jumlah_dirawat'],
      deathsUpdate: object['update']['penambahan']['jumlah_meninggal'],
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
