class NhanGiong {
  final int id;
  final String phuongPhapNhanGiong;
  final String thoiDiemNhanGiong;
  final String kyThuatNhanGiong;

  NhanGiong({
    required this.id,
    required this.phuongPhapNhanGiong,
    required this.thoiDiemNhanGiong,
    required this.kyThuatNhanGiong,
  });

  factory NhanGiong.fromJson(Map<String, dynamic> json) {
    return NhanGiong(
      id: json['id'],
      phuongPhapNhanGiong: json['phuongPhapNhanGiong'],
      thoiDiemNhanGiong: json['thoiDiemNhanGiong'],
      kyThuatNhanGiong: json['kyThuatNhanGiong'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'phuongPhapNhanGiong': phuongPhapNhanGiong,
      'thoiDiemNhanGiong': thoiDiemNhanGiong,
      'kyThuatNhanGiong': kyThuatNhanGiong,
    };
  }

  NhanGiong copyWith({
    int? id,
    String? phuongPhapNhanGiong,
    String? thoiDiemNhanGiong,
    String? kyThuatNhanGiong,
  }) {
    return NhanGiong(
      id: id ?? this.id,
      phuongPhapNhanGiong: phuongPhapNhanGiong ?? this.phuongPhapNhanGiong,
      thoiDiemNhanGiong: thoiDiemNhanGiong ?? this.thoiDiemNhanGiong,
      kyThuatNhanGiong: kyThuatNhanGiong ?? this.kyThuatNhanGiong,
    );
  }
}
