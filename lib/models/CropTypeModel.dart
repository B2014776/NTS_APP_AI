class GiongCayTrong {
  final int id;
  final String tenGiong;
  final String dacDiemNoiBat;
  final String xuatXu;
  final String nangSuat;
  final String img;

  GiongCayTrong({
    required this.id,
    required this.tenGiong,
    required this.dacDiemNoiBat,
    required this.xuatXu,
    required this.nangSuat,
    required this.img,
  });

  factory GiongCayTrong.fromJson(Map<String, dynamic> json) {
    return GiongCayTrong(
      id: json['id'],
      tenGiong: json['tenGiong'],
      dacDiemNoiBat: json['dacDiemNoiBat'],
      xuatXu: json['xuatXu'],
      nangSuat: json['nangSuat'],
      img: json['img'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'tenGiong': tenGiong,
      'dacDiemNoiBat': dacDiemNoiBat,
      'xuatXu': xuatXu,
      'nangSuat': nangSuat,
      'img': img,
    };
  }

  GiongCayTrong copyWith({
    int? id,
    String? tenGiong,
    String? dacDiemNoiBat,
    String? xuatXu,
    String? nangSuat,
    String? img,
  }) {
    return GiongCayTrong(
      id: id ?? this.id,
      tenGiong: tenGiong ?? this.tenGiong,
      dacDiemNoiBat: dacDiemNoiBat ?? this.dacDiemNoiBat,
      xuatXu: xuatXu ?? this.xuatXu,
      nangSuat: nangSuat ?? this.nangSuat,
      img: img ?? this.img,
    );
  }
}
