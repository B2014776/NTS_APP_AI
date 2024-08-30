
import 'MedicineModel.dart';

class Benh {
  final String tenBenh;
  final String thuongXuatHienTrenCay;
  final String trieuChung;
  final String nguyenNhan;
  final String dieuKien;
  final String truBenh;
  final String phongNgua;
  final String img;
  final List<ThuocTriBenh> thuocSinhHoc;
  final List<ThuocTriBenh> thuocHoaHoc;

  Benh({
    required this.tenBenh,
    required this.thuongXuatHienTrenCay,
    required this.trieuChung,
    required this.nguyenNhan,
    required this.dieuKien,
    required this.truBenh,
    required this.phongNgua,
    required this.img,
    required this.thuocSinhHoc,
    required this.thuocHoaHoc,
  });

  // Factory constructor to create an instance from JSON
  factory Benh.fromJson(Map<String, dynamic> json) {
    return Benh(
      tenBenh: json['tenBenh'] ?? 'N/A',
      thuongXuatHienTrenCay: json['thuongXuatHienTrenCay'] ?? 'N/A',
      trieuChung: json['trieuChung'] ?? 'N/A',
      nguyenNhan: json['nguyenNhan'] ?? 'N/A',
      dieuKien: json['dieuKien'] ?? 'N/A',
      truBenh: json['truBenh'] ?? 'N/A',
      phongNgua: json['phongNgua'] ?? 'N/A',
      img: json['img'] ?? 'leaf_blast0.jpg',
      thuocSinhHoc: (json['thuocSinhHoc'] as List<dynamic>?)
          ?.map((item) => ThuocTriBenh.fromJson(item as Map<String, dynamic>))
          .toList() ?? [],
      thuocHoaHoc: (json['thuocHoaHoc'] as List<dynamic>?)
          ?.map((item) => ThuocTriBenh.fromJson(item as Map<String, dynamic>))
          .toList() ?? [],
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
      'thuocSinhHoc': thuocSinhHoc.map((med) => med.toJson()).toList(),
      'thuocHoaHoc': thuocHoaHoc.map((med) => med.toJson()).toList(),
    };
  }

  // Override toString() to print object details
  @override
  String toString() {
    return 'Benh(tenBenh: $tenBenh, thuongXuatHienTrenCay: $thuongXuatHienTrenCay, trieuChung: $trieuChung, nguyenNhan: $nguyenNhan, dieuKien: $dieuKien, truBenh: $truBenh, phongNgua: $phongNgua, img: $img, thuocSinhHoc: $thuocSinhHoc, thuocHoaHoc: $thuocHoaHoc)';
  }
}
