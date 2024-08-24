class Benh {
  final String tenBenh;
  final String thuongXuatHienTrenCay;
  final String trieuChung;
  final String nguyenNhan;
  final String dieuKien;
  final String truBenh;
  final String phongNgua;
  final String img;

  Benh({
    required this.tenBenh,
    required this.thuongXuatHienTrenCay,
    required this.trieuChung,
    required this.nguyenNhan,
    required this.dieuKien,
    required this.truBenh,
    required this.phongNgua,
    required this.img,
  });

  // Factory constructor to create an instance from JSON
  factory Benh.fromJson(Map<String, dynamic> json) {
    return Benh(
      tenBenh: json['tenBenh'],
      thuongXuatHienTrenCay: json['thuongXuatHienTrenCay'],
      trieuChung: json['trieuChung'],
      nguyenNhan: json['nguyenNhan'],
      dieuKien: json['dieuKien'],
      truBenh: json['truBenh'],
      phongNgua: json['phongNgua'],
      img: json['img'], // Bổ sung trong fromJson
    );
  }

  // Method to convert an instance to JSON
  Map<String, dynamic> toJson() {
    return {
      'tenBenh': tenBenh,
      'thuongXuatHienTrenCay': thuongXuatHienTrenCay,
      'trieuChung': trieuChung,
      'nguyenNhan': nguyenNhan,
      'dieuKien': dieuKien,
      'truBenh': truBenh,
      'phongNgua': phongNgua,
      'img': img,
    };
  }

  // Override toString() to print object details
  @override
  String toString() {
    return 'Benh(tenBenh: $tenBenh, thuongXuatHienTrenCay: $thuongXuatHienTrenCay, trieuChung: $trieuChung, nguyenNhan: $nguyenNhan, dieuKien: $dieuKien, truBenh: $truBenh, phongNgua: $phongNgua, img: $img)';
  }
}
