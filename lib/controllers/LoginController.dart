import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../models/DiseaseModel.dart';

class LoginController extends GetxController {
  var username = ''.obs;
  var password = ''.obs;
  var isCheckLogin = false.obs;

  void toggleCheckLogin(bool? value) {
    isCheckLogin.value = value ?? false;
  }
}


class DiseaseController {
  final Benh benh;

  DiseaseController({required this.benh});

  // Đây là nơi bạn có thể thêm các phương thức logic khác nếu cần.
  String getBenhDetails() {
    return "Tên bệnh: ${benh.tenBenh}\nTriệu chứng: ${benh.trieuChung}\nNguyên nhân: ${benh.nguyenNhan}";
  }
}
