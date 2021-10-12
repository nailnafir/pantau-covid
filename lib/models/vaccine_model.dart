part of 'models.dart';

class LocalVaccineModel {
  String lastUpdate;
  List<MonitoringVaccineModel> monitoring;

  LocalVaccineModel({
    required this.lastUpdate,
    required this.monitoring,
  });

  factory LocalVaccineModel.fromJson(Map<String, dynamic> json) {
    return LocalVaccineModel(
      lastUpdate: json['last_updated'],
      monitoring: List<MonitoringVaccineModel>.from(
          json['monitoring'].map((x) => MonitoringVaccineModel.fromJson(x))),
    );
  }
}

class MonitoringVaccineModel {
  int totalTarget;
  int targetMedical;
  int targetAged;
  int targetOfficer;
  int targetGeneralPublic;
  int targetTeenAge;
  int firstVaccine;
  int secondVaccine;
  int doneVaccine1Medical;
  int doneVaccine2Medical;
  int doneVaccine1Officer;
  int doneVaccine2Officer;
  int doneVaccine1Aged;
  int doneVaccine2Aged;
  int doneVaccine1GeneralPublic;
  int doneVaccine2GeneralPublic;
  int doneVaccine1TeenAge;
  int doneVaccine2TeenAge;

  MonitoringVaccineModel({
    required this.totalTarget,
    required this.targetMedical,
    required this.targetAged,
    required this.targetOfficer,
    required this.targetGeneralPublic,
    required this.targetTeenAge,
    required this.firstVaccine,
    required this.secondVaccine,
    required this.doneVaccine1Medical,
    required this.doneVaccine2Medical,
    required this.doneVaccine1Officer,
    required this.doneVaccine2Officer,
    required this.doneVaccine1Aged,
    required this.doneVaccine2Aged,
    required this.doneVaccine1GeneralPublic,
    required this.doneVaccine2GeneralPublic,
    required this.doneVaccine1TeenAge,
    required this.doneVaccine2TeenAge,
  });

  factory MonitoringVaccineModel.fromJson(Map<String, dynamic> json) {
    return MonitoringVaccineModel(
      totalTarget: json['total_sasaran_vaksinasi'],
      targetMedical: json['sasaran_vaksinasi_sdmk'],
      targetOfficer: json['sasaran_vaksinasi_petugas_publik'],
      targetAged: json['sasaran_vaksinasi_lansia'],
      targetGeneralPublic: json['sasaran_vaksinasi_masyarakat_umum'],
      targetTeenAge: json['sasaran_vaksinasi_kelompok_1217'],
      firstVaccine: json['vaksinasi1'],
      secondVaccine: json['vaksinasi2'],
      doneVaccine1Medical: json['tahapan_vaksinasi']['sdm_kesehatan']
          ['sudah_vaksin1'],
      doneVaccine2Medical: json['tahapan_vaksinasi']['sdm_kesehatan']
          ['sudah_vaksin2'],
      doneVaccine1Officer: json['tahapan_vaksinasi']['petugas_publik']
          ['sudah_vaksin1'],
      doneVaccine2Officer: json['tahapan_vaksinasi']['petugas_publik']
          ['sudah_vaksin2'],
      doneVaccine1Aged: json['tahapan_vaksinasi']['lansia']['sudah_vaksin1'],
      doneVaccine2Aged: json['tahapan_vaksinasi']['lansia']['sudah_vaksin2'],
      doneVaccine1GeneralPublic: json['tahapan_vaksinasi']['masyarakat_umum']
          ['sudah_vaksin1'],
      doneVaccine2GeneralPublic: json['tahapan_vaksinasi']['masyarakat_umum']
          ['sudah_vaksin2'],
      doneVaccine1TeenAge: json['tahapan_vaksinasi']['kelompok_usia_12_17']
          ['sudah_vaksin1'],
      doneVaccine2TeenAge: json['tahapan_vaksinasi']['kelompok_usia_12_17']
          ['sudah_vaksin2'],
    );
  }
}
