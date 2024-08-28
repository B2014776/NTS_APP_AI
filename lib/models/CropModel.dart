import 'package:apptestai/models/CultivateModel.dart';

import 'CropTypeModel.dart';
import 'DiseaseModel.dart';

class LoaiCayTrong {
  final int id;
  final String tenLoai;
  final String moTa;
  final String dieuKienThoiTiet;
  final int thoiGianTruongThanh;
  final double sanLuongTrungBinh;
  final String img;
  final List<GiongCayTrong> giongCayTrongList;
  final List<Benh> sauBenhList;
  final List<KyThuatTrong> kyThuatTrongList;

  LoaiCayTrong({
    required this.id,
    required this.tenLoai,
    required this.moTa,
    required this.dieuKienThoiTiet,
    required this.thoiGianTruongThanh,
    required this.sanLuongTrungBinh,
    required this.img,
    required this.giongCayTrongList,
    required this.sauBenhList,
    required this.kyThuatTrongList
  });

  factory LoaiCayTrong.fromJson(Map<String, dynamic> json) {
    return LoaiCayTrong(
      id: json['id'],
      tenLoai: json['tenLoai'],
      moTa: json['moTa'],
      dieuKienThoiTiet: json['dieuKienThoiTiet'],
      thoiGianTruongThanh: json['thoiGianTruongThanh'],
      sanLuongTrungBinh: json['sanLuongTrungBinh'],
      img: json['img'],
      giongCayTrongList: (json['giongCayTrongList'] as List<dynamic>)
          .map((item) => GiongCayTrong.fromJson(item as Map<String, dynamic>))
          .toList(),
      sauBenhList: (json['sauBenhList'] as List<dynamic>)
          .map((item) => Benh.fromJson(item as Map<String, dynamic>))
          .toList(),
      kyThuatTrongList: (json['kyThuatTrongList'] as List<dynamic>)
          .map((item) => KyThuatTrong.fromJson(item as Map<String, dynamic>))
          .toList(),
    );
  }
}
