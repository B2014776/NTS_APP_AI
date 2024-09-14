class DanhMuc {
  final String maDanhMuc;
  final DateTime? ngayTao;
  final DateTime? ngayCapNhat;
  final bool? trangThai;
  final String tenDanhMuc;
  final String moTa;

  DanhMuc({
    required this.maDanhMuc,
    this.ngayTao,
    this.ngayCapNhat,
    this.trangThai,
    required this.tenDanhMuc,
    required this.moTa,
  });

  // Hàm chuyển từ JSON sang model DanhMuc
  factory DanhMuc.fromJson(Map<String, dynamic> json) {
    return DanhMuc(
      maDanhMuc: json['MaDanhMuc'],
      ngayTao: json['NgayTao'] != null ? DateTime.parse(json['NgayTao']) : null,
      ngayCapNhat: json['NgayCapNhat'] != null
          ? DateTime.parse(json['NgayCapNhat'])
          : null,
      trangThai: json['TrangThai'] != null ? json['TrangThai'] as bool : null,
      tenDanhMuc: json['TenDanhMuc'],
      moTa: json['MoTa'],
    );
  }

  // Hàm chuyển từ model DanhMuc sang JSON
  Map<String, dynamic> toJson() {
    return {
      'MaDanhMuc': maDanhMuc,
      'NgayTao': ngayTao?.toIso8601String(),
      'NgayCapNhat': ngayCapNhat?.toIso8601String(),
      'TrangThai': trangThai,
      'TenDanhMuc': tenDanhMuc,
      'MoTa': moTa,
    };
  }
}
