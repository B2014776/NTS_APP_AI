class LoaiCayTrong {
  final int id;
  final String tenLoai;
  final String moTa;
  final String dieuKienThoiTiet;
  final int thoiGianTruongThanh;
  final double sanLuongTrungBinh;
  final String img;

  LoaiCayTrong({
    required this.id,
    required this.tenLoai,
    required this.moTa,
    required this.dieuKienThoiTiet,
    required this.thoiGianTruongThanh,
    required this.sanLuongTrungBinh,
    required this.img,
  });

  factory LoaiCayTrong.fromJson(Map<String, dynamic> json) {
    return LoaiCayTrong(
      id: json['id'],
      tenLoai: json['tenLoai'],
      moTa: json['moTa'],
      dieuKienThoiTiet: json['dieuKienThoiTiet'],
      thoiGianTruongThanh: json['thoiGianTruongThanh'],
      sanLuongTrungBinh: json['sanLuongTrungBinh'].toDouble(),
      img: json['img'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'tenLoai': tenLoai,
      'moTa': moTa,
      'dieuKienThoiTiet': dieuKienThoiTiet,
      'thoiGianTruongThanh': thoiGianTruongThanh,
      'sanLuongTrungBinh': sanLuongTrungBinh,
      'img': img,
    };
  }
}
