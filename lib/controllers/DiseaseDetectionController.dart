import 'package:dio/dio.dart';

import '../models/DiseaseModel.dart';
import '../models/MedicineModel.dart';

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
    benh = Benh(
      tenBenh: 'Bệnh đạo ôn',
      thuongXuatHienTrenCay: 'Lá lúa',
      trieuChung: 'Xuất hiện các vết đốm nhỏ màu nâu trên lá.',
      nguyenNhan: 'Do nấm gây ra trong điều kiện ẩm ướt.',
      dieuKien: 'Thời tiết ẩm ướt và mưa nhiều.',
      truBenh: 'Sử dụng thuốc diệt nấm để trị bệnh.',
      phongNgua: '- Dọn sạch tàn dư rơm rạ và cỏ dại mang mầm bệnh trên đồng ruộng. Gieo cấy các giống kháng hoặc chống chịu với bệnh đạo ôn.',
    );
    try {
      final response = await Dio().get('https://api-ai-l1r8.onrender.com/disease_iden_demo/Blast');
      if (response.statusCode == 200) {
        benh = Benh.fromJson(response.data);

      }
    } catch (error) {
      print("Failed to load disease details: $error");
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
