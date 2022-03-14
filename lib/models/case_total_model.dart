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
      confirmedTotal: json['update']['total']['jumlah_positif'] ?? 0,
      recoveredTotal: json['update']['total']['jumlah_sembuh'] ?? 0,
      activeTotal: json['update']['total']['jumlah_dirawat'] ?? 0,
      deathsTotal: json['update']['total']['jumlah_meninggal'] ?? 0,
      confirmedUpdate: json['update']['penambahan']['jumlah_positif'] ?? 0,
      recoveredUpdate: json['update']['penambahan']['jumlah_sembuh'] ?? 0,
      activeUpdate: json['update']['penambahan']['jumlah_dirawat'] ?? 0,
      deathsUpdate: json['update']['penambahan']['jumlah_meninggal'] ?? 0,
      lastUpdate: json['update']['penambahan']['created'] ?? "",
    );
  }
}
