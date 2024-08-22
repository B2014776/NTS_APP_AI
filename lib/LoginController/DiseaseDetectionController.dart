import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

import '../model/DiseaseModel.dart';

class DiseasedetectionController {
  late TextEditingController username = TextEditingController();
  late TextEditingController password = TextEditingController();
}

class DiseaseController {
  Benh? benh;

  Future<void> fetchBenhFromAPI() async {
    final response = await http.get(Uri.parse('https://api-ai-l1r8.onrender.com/disease_iden_demo/Tungro'));

    if (response.statusCode == 200) {
      Map<String, dynamic> data = json.decode(response.body);

      benh = Benh.fromJson(data);
    } else {
      throw Exception('Failed to load disease details');
    }
  }

  String getBenhDetails() {
    if (benh != null) {
      return "Tên bệnh: ${benh!.tenBenh}\nTriệu chứng: ${benh!.trieuChung}\nNguyên nhân: ${benh!.nguyenNhan}";
    } else {
      return "Chưa có dữ liệu bệnh.";
    }
  }
}
