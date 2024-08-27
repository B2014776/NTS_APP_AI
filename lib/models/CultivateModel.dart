class KyThuatTrong {
  final String id;
  final String tenKyThuatTrong;
  final String buocThucHien;
  final String phanBonSuDung;
  final String tuoiNuoc;
  final String chamSoc;
  final String thoiGianThucHien;

  KyThuatTrong({
    required this.id,
    required this.tenKyThuatTrong,
    required this.buocThucHien,
    required this.phanBonSuDung,
    required this.tuoiNuoc,
    required this.chamSoc,
    required this.thoiGianThucHien,
  });

  factory KyThuatTrong.fromJson(Map<String, dynamic> json) {
    return KyThuatTrong(
      id: json['id'],
      tenKyThuatTrong: json['tenKyThuatTrong'],
      buocThucHien: json['buocThucHien'],
      phanBonSuDung: json['phanBonSuDung'],
      tuoiNuoc: json['tuoiNuoc'],
      chamSoc: json['chamSoc'],
      thoiGianThucHien: json['thoiGianThucHien'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'tenKyThuatTrong': tenKyThuatTrong,
      'buocThucHien': buocThucHien,
      'phanBonSuDung': phanBonSuDung,
      'tuoiNuoc': tuoiNuoc,
      'chamSoc': chamSoc,
      'thoiGianThucHien': thoiGianThucHien,
    };
  }

  KyThuatTrong copyWith({
    String? id,
    String? tenKyThuatTrong,
    String? buocThucHien,
    String? phanBonSuDung,
    String? tuoiNuoc,
    String? chamSoc,
    String? thoiGianThucHien,
  }) {
    return KyThuatTrong(
      id: id ?? this.id,
      tenKyThuatTrong: tenKyThuatTrong ?? this.tenKyThuatTrong,
      buocThucHien: buocThucHien ?? this.buocThucHien,
      phanBonSuDung: phanBonSuDung ?? this.phanBonSuDung,
      tuoiNuoc: tuoiNuoc ?? this.tuoiNuoc,
      chamSoc: chamSoc ?? this.chamSoc,
      thoiGianThucHien: thoiGianThucHien ?? this.thoiGianThucHien,
    );
  }
}
