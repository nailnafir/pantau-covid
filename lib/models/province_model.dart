part of 'models.dart';

class AllProvinceModel {
  String lastUpdate;
  List<DetailProvinceModel> listData;

  AllProvinceModel({required this.lastUpdate, required this.listData});

  factory AllProvinceModel.fromJson(Map<String, dynamic> json) {
    return AllProvinceModel(
      lastUpdate: json['last_date'] ?? "",
      listData: List<DetailProvinceModel>.from(
          json['list_data'].map((e) => DetailProvinceModel.fromJson(e)) ?? ""),
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
      confirmedTotal: json['jumlah_kasus'] ?? "",
      recoveredTotal: json['jumlah_sembuh'] ?? "",
      activeTotal: json['jumlah_dirawat'] ?? "",
      deathsTotal: json['jumlah_meninggal'] ?? "",
      location: Lokasi.fromJson(json['lokasi'] ?? ""),
      update: Penambahan.fromJson(json['penambahan'] ?? ""),
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
      confirmedUpdate: json['positif'] ?? "",
      recoveredUpdate: json['sembuh'] ?? "",
      deathsUpdate: json['meninggal'] ?? "",
    );
  }
}

class Lokasi {
  double lon;
  double lat;

  Lokasi({required this.lon, required this.lat});

  factory Lokasi.fromJson(Map<String, dynamic> json) {
    return Lokasi(
      lon: json['lon'].toDouble() ?? "",
      lat: json['lat'].toDouble() ?? "",
    );
  }
}
