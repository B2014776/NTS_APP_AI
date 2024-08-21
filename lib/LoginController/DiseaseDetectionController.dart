import 'package:flutter/cupertino.dart';

import '../model/DiseaseDetectionModel.dart';

class DiseasedetectionController {
  late TextEditingController username = TextEditingController();
  late TextEditingController password = TextEditingController();
}

class DiseaseController {
  final Benh benh;

  DiseaseController({required this.benh});

  // Đây là nơi bạn có thể thêm các phương thức logic khác nếu cần.
  String getBenhDetails() {
    return "Tên bệnh: ${benh.tenBenh}\nTriệu chứng: ${benh.trieuChung}\nNguyên nhân: ${benh.nguyenNhan}";
  }
}