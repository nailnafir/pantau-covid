part of 'models.dart';

class VaccineModel {
  int updateVaccineFirst;
  int updateVaccineSecond;
  int totalVaccineFirst;
  int totalVaccineSecond;
  String lastUpdate;

  VaccineModel({
    required this.updateVaccineFirst,
    required this.updateVaccineSecond,
    required this.totalVaccineFirst,
    required this.totalVaccineSecond,
    required this.lastUpdate,
  });

  factory VaccineModel.fromJson(Map<String, dynamic> json) {
    return VaccineModel(
      updateVaccineFirst:
          json['vaksinasi']['penambahan']['jumlah_vaksinasi_1'] ?? 0,
      updateVaccineSecond:
          json['vaksinasi']['penambahan']['jumlah_vaksinasi_2'] ?? 0,
      totalVaccineFirst: json['vaksinasi']['total']['jumlah_vaksinasi_1'] ?? 0,
      totalVaccineSecond: json['vaksinasi']['total']['jumlah_vaksinasi_2'] ?? 0,
      lastUpdate: json['vaksinasi']['penambahan']['created'] ?? "",
    );
  }
}
