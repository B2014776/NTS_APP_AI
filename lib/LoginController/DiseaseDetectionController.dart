import 'package:dio/dio.dart';

import '../model/DiseaseModel.dart';
import '../model/MedicineModel.dart';

class DiseaseController {
  Benh? benh;
  List<Medicine> biologicalMedicines = [];
  List<Medicine> chemicalMedicines = [];

  DiseaseController() {
    //
    biologicalMedicines = [
      Medicine(
        name: 'Chitosan',
        information: 'Chitosan là một loại polymer cation tự nhiên...',
        usage: 'Sử dụng để điều trị tình trạng X.',
      ),
      Medicine(
        name: 'Bacillus subtilis',
        information: 'Một loại vi khuẩn Gram dương giúp kiểm soát nấm bệnh...',
        usage: 'Sử dụng trong phòng ngừa bệnh.',
      ),
    ];

    chemicalMedicines = [
      Medicine(
        name: 'Carbendazim',
        information: 'Thuốc hóa học có tác dụng trị nấm mạnh.',
        usage: 'Sử dụng cho tình trạng bệnh Y.',
      ),
      Medicine(
        name: 'Propiconazole',
        information: 'Thuốc hóa học giúp kiểm soát bệnh nấm trên lá.',
        usage: 'Sử dụng khi triệu chứng bắt đầu xuất hiện.',
      ),
    ];
  }

  Future<void> fetchBenhFromAPI() async {
    //
    final response = await Dio().get('https://api-ai-l1r8.onrender.com/disease_iden_demo/Tungro');
    if (response.statusCode == 200) {
      benh = Benh.fromJson(response.data);
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
