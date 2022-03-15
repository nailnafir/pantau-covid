part of 'models.dart';

class CheckModel {
  int updateSpecimenPcr;
  int updateSpecimenAntigen;
  int updatePeoplePcr;
  int updatePeopleAntigen;
  int totalSpecimenPcr;
  int totalSpecimenAntigen;
  int totalPeoplePcr;
  int totalPeopleAntigen;
  String lastUpdate;

  CheckModel({
    required this.updateSpecimenPcr,
    required this.updateSpecimenAntigen,
    required this.updatePeoplePcr,
    required this.updatePeopleAntigen,
    required this.totalSpecimenPcr,
    required this.totalSpecimenAntigen,
    required this.totalPeoplePcr,
    required this.totalPeopleAntigen,
    required this.lastUpdate,
  });

  factory CheckModel.fromJson(Map<String, dynamic> json) {
    return CheckModel(
      updateSpecimenPcr:
          json['pemeriksaan']['penambahan']['jumlah_spesimen_pcr_tcm'] ?? 0,
      updateSpecimenAntigen:
          json['pemeriksaan']['penambahan']['jumlah_spesimen_antigen'] ?? 0,
      updatePeoplePcr:
          json['pemeriksaan']['penambahan']['jumlah_orang_pcr_tcm'] ?? 0,
      updatePeopleAntigen:
          json['pemeriksaan']['penambahan']['jumlah_orang_antigen'] ?? 0,
      totalSpecimenPcr:
          json['pemeriksaan']['total']['jumlah_spesimen_pcr_tcm'] ?? 0,
      totalSpecimenAntigen:
          json['pemeriksaan']['total']['jumlah_spesimen_antigen'] ?? 0,
      totalPeoplePcr: json['pemeriksaan']['total']['jumlah_orang_pcr_tcm'] ?? 0,
      totalPeopleAntigen:
          json['pemeriksaan']['total']['jumlah_orang_antigen'] ?? 0,
      lastUpdate: json['pemeriksaan']['penambahan']['created'] ?? "",
    );
  }
}

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
