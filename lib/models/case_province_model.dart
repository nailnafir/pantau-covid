part of 'models.dart';

class CaseProvinceModel {
  String lastUpdate;
  List<DetailProvinceModel> listData;

  CaseProvinceModel({required this.lastUpdate, required this.listData});

  factory CaseProvinceModel.fromJson(Map<String, dynamic> json) {
    return CaseProvinceModel(
      lastUpdate: json['last_date'] ?? "",
      listData: List<DetailProvinceModel>.from(
          json['list_data'].map((e) => DetailProvinceModel.fromJson(e)) ?? []),
    );
  }
}

class DetailProvinceModel {
  String provinceName;
  int confirmedTotal;
  int recoveredTotal;
  int activeTotal;
  int deathsTotal;
  Lokasi location;
  Penambahan update;

  DetailProvinceModel({
    required this.provinceName,
    required this.confirmedTotal,
    required this.recoveredTotal,
    required this.activeTotal,
    required this.deathsTotal,
    required this.location,
    required this.update,
  });

  factory DetailProvinceModel.fromJson(Map<String, dynamic> json) {
    return DetailProvinceModel(
      provinceName: json['key'] ?? "",
      confirmedTotal: json['jumlah_kasus'] ?? 0,
      recoveredTotal: json['jumlah_sembuh'] ?? 0,
      activeTotal: json['jumlah_dirawat'] ?? 0,
      deathsTotal: json['jumlah_meninggal'] ?? 0,
      location: Lokasi.fromJson(json['lokasi'] ?? {}),
      update: Penambahan.fromJson(json['penambahan'] ?? {}),
    );
  }
}

class Penambahan {
  int confirmedUpdate;
  int recoveredUpdate;
  int deathsUpdate;

  Penambahan({
    required this.confirmedUpdate,
    required this.recoveredUpdate,
    required this.deathsUpdate,
  });

  factory Penambahan.fromJson(Map<String, dynamic> json) {
    return Penambahan(
      confirmedUpdate: json['positif'] ?? 0,
      recoveredUpdate: json['sembuh'] ?? 0,
      deathsUpdate: json['meninggal'] ?? 0,
    );
  }
}

class Lokasi {
  double lon;
  double lat;

  Lokasi({required this.lon, required this.lat});

  factory Lokasi.fromJson(Map<String, dynamic> json) {
    return Lokasi(
      lon: json['lon'] ?? 0,
      lat: json['lat'] ?? 0,
    );
  }
}
