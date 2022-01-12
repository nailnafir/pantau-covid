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

  factory CaseTotalModel.fromJson(Map<String, dynamic> json) {
    return CaseTotalModel(
      confirmedTotal: json['update']['total']['jumlah_positif'] ?? "",
      recoveredTotal: json['update']['total']['jumlah_sembuh'] ?? "",
      activeTotal: json['update']['total']['jumlah_dirawat'] ?? "",
      deathsTotal: json['update']['total']['jumlah_meninggal'] ?? "",
      confirmedUpdate: json['update']['penambahan']['jumlah_positif'] ?? "",
      recoveredUpdate: json['update']['penambahan']['jumlah_sembuh'] ?? "",
      activeUpdate: json['update']['penambahan']['jumlah_dirawat'] ?? "",
      deathsUpdate: json['update']['penambahan']['jumlah_meninggal'] ?? "",
      lastUpdate: json['update']['penambahan']['created'] ?? "",
    );
  }
}
