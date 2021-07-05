part of 'models.dart';

class LocalVaccineModel {
  int totalTarget;
  int targetMedical;
  int targetAged;
  int targetOfficer;
  int firstVaccine;
  int secondVaccine;
  String lastUpdate;

  LocalVaccineModel({
    required this.totalTarget,
    required this.targetMedical,
    required this.targetAged,
    required this.targetOfficer,
    required this.firstVaccine,
    required this.secondVaccine,
    required this.lastUpdate,
  });

  factory LocalVaccineModel.fromJson(Map<String, dynamic> object) {
    return LocalVaccineModel(
      totalTarget: object['totalsasaran'],
      targetMedical: object['sasaranvaksinsdmk'],
      targetAged: object['sasaranvaksinlansia'],
      targetOfficer: object['sasaranvaksinpetugaspublik'],
      firstVaccine: object['vaksinasi1'],
      secondVaccine: object['vaksinasi2'],
      lastUpdate: object['lastUpdate'],
    );
  }

  static Future<LocalVaccineModel> fetchVaccine(String type) async {
    String apiURL = URLShared.apiVaccineURL + type;
    var url = Uri.parse(apiURL);

    var apiResult = await http.get(url);
    var jsonObject = json.decode(apiResult.body);

    if (apiResult.statusCode == 200) {
      return LocalVaccineModel.fromJson(jsonObject);
    } else {
      throw Exception('Gagal menyambungkan ke server');
    }
  }
}
