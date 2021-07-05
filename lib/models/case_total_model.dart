part of 'models.dart';

// data from mathdroid
// class CaseTotalModel {
//   String countryRegion;
//   int confirmed;
//   int recovered;
//   int active;
//   int deaths;
//   DateTime lastUpdate;

//   CaseTotalModel({
//     required this.countryRegion,
//     required this.confirmed,
//     required this.recovered,
//     required this.active,
//     required this.deaths,
//     required this.lastUpdate,
//   });

//   factory CaseTotalModel.fromJson(Map<String, dynamic> object) {
//     return CaseTotalModel(
//       countryRegion: object['countryRegion'],
//       confirmed: object['confirmed'],
//       recovered: object['recovered'],
//       active: object['active'],
//       deaths: object['deaths'],
//       lastUpdate: DateTime.fromMillisecondsSinceEpoch(object['lastUpdate']),
//     );
//   }

//   static Future<CaseTotalModel> fetchTotal(String name) async {
//     String apiURL = URLShared.apiGlobalURL + name;
//     var url = Uri.parse(apiURL);

//     var apiResult = await http.get(url);
//     var jsonObject = json.decode(apiResult.body);
//     // var caseData = (jsonObject as Map<String, dynamic>)[0];

//     if (apiResult.statusCode == 200) {
//       return CaseTotalModel.fromJson(jsonObject[0]);
//     } else {
//       throw Exception('Gagal menyambungkan ke server');
//     }
//   }
// }

class CaseTotalModel {
  int confirmed;
  int recovered;
  int active;
  int deaths;
  String lastUpdate;

  CaseTotalModel({
    required this.confirmed,
    required this.recovered,
    required this.active,
    required this.deaths,
    required this.lastUpdate,
  });

  factory CaseTotalModel.fromJson(Map<String, dynamic> object) {
    return CaseTotalModel(
      confirmed: object['update']['total']['jumlah_positif'],
      recovered: object['update']['total']['jumlah_sembuh'],
      active: object['update']['total']['jumlah_dirawat'],
      deaths: object['update']['total']['jumlah_meninggal'],
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
