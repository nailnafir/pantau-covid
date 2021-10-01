part of 'models.dart';

class LocalVaccineModel {
  String lastUpdate;
  List<MonitoringVaccine> monitoring;

  LocalVaccineModel({
    required this.lastUpdate,
    required this.monitoring,
  });

  factory LocalVaccineModel.fromJson(Map<String, dynamic> json) {
    return LocalVaccineModel(
      lastUpdate: json['last_updated'],
      monitoring: List<MonitoringVaccine>.from(
          json['monitoring'].map((x) => MonitoringVaccine.fromJson(x))),
    );
  }

  static Future<LocalVaccineModel> fetchVaccine(String type) async {
    String apiURL = URLShared.apiVaccineURL + type;
    var url = Uri.parse(apiURL);

    var apiResult = await http.get(url);
    var jsonObject = json.decode(apiResult.body);

    if (apiResult.statusCode == 200) {
      print(jsonObject);
      return LocalVaccineModel.fromJson(jsonObject);
    } else {
      throw Exception('Gagal menyambungkan ke server');
    }
  }
}

class MonitoringVaccine {
  int totalTarget;
  int targetMedical;
  int targetAged;
  int targetOfficer;
  int targetGeneralPublic;
  int targetTeenAge;
  int firstVaccine;
  int secondVaccine;

  MonitoringVaccine({
    required this.totalTarget,
    required this.targetMedical,
    required this.targetAged,
    required this.targetOfficer,
    required this.targetGeneralPublic,
    required this.targetTeenAge,
    required this.firstVaccine,
    required this.secondVaccine,
  });

  factory MonitoringVaccine.fromJson(Map<String, dynamic> json) {
    return MonitoringVaccine(
      totalTarget: json['total_sasaran_vaksinasi'],
      targetMedical: json['sasaran_vaksinasi_sdmk'],
      targetOfficer: json['sasaran_vaksinasi_petugas_publik'],
      targetAged: json['sasaran_vaksinasi_lansia'],
      targetGeneralPublic: json['sasaran_vaksinasi_masyarakat_umum'],
      targetTeenAge: json['sasaran_vaksinasi_kelompok_1217'],
      firstVaccine: json['vaksinasi1'],
      secondVaccine: json['vaksinasi2'],
    );
  }

  static Future<List<MonitoringVaccine>> fetchVaccine(String name) async {
    String apiURL = URLShared.apiVaccineURL + name;
    var url = Uri.parse(apiURL);

    var response = await http.get(url);
    var data = json.decode(response.body);

    List<MonitoringVaccine> vaccines = (data['monitoring'] as List)
        .map((e) => MonitoringVaccine.fromJson(e))
        .toList();

    if (response.statusCode == 200) {
      return vaccines;
    } else {
      throw Exception('Gagal menyambungkan ke server');
    }
  }
}
