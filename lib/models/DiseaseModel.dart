
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
      tenBenh: json['tenBenh'] ?? 'Chưa có tên bệnh',
      thuongXuatHienTrenCay: json['thuongXuatHienTrenCay'] ?? 'Chưa có thông tin',
      trieuChung: json['trieuChung'] ?? 'Chưa có triệu chứng',
      nguyenNhan: json['nguyenNhan'] ?? 'Chưa có nguyên nhân',
      dieuKien: json['dieuKien'] ?? 'Chưa có điều kiện',
      truBenh: json['truBenh'] ?? 'Chưa có trị bệnh',
      phongNgua: json['phongNgua'] ?? 'Chưa có phòng ngừa',
      img: json['img'] ?? '01f5e88f2a3c9aa14282135a21d5f0a1.png',
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
