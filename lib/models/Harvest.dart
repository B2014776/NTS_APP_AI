class ThuHoach {
  final int id;
  final String phuongPhapThuHoach;
  final String thoiDiemThuHoach;
  final String kyThuatThuHoach;

  ThuHoach({
    required this.id,
    required this.phuongPhapThuHoach,
    required this.thoiDiemThuHoach,
    required this.kyThuatThuHoach,
  });

  factory ThuHoach.fromJson(Map<String, dynamic> json) {
    return ThuHoach(
      id: json['id'],
      phuongPhapThuHoach: json['phuongPhapThuHoach'],
      thoiDiemThuHoach: json['thoiDiemThuHoach'],
      kyThuatThuHoach: json['kyThuatThuHoach'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'phuongPhapThuHoach': phuongPhapThuHoach,
      'thoiDiemThuHoach': thoiDiemThuHoach,
      'kyThuatThuHoach': kyThuatThuHoach,
    };
  }

  ThuHoach copyWith({
    int? id,
    String? phuongPhapThuHoach,
    String? thoiDiemThuHoach,
    String? kyThuatThuHoach,
  }) {
    return ThuHoach(
      id: id ?? this.id,
      phuongPhapThuHoach: phuongPhapThuHoach ?? this.phuongPhapThuHoach,
      thoiDiemThuHoach: thoiDiemThuHoach ?? this.thoiDiemThuHoach,
      kyThuatThuHoach: kyThuatThuHoach ?? this.kyThuatThuHoach,
    );
  }
}
