import 'package:dio/dio.dart';

import '../../models/DiseaseModel.dart';
import '../../models/MedicineModel.dart';

class DiseaseController {
  Benh? benh;
  List<Medicine> biologicalMedicines = [];
  List<Medicine> chemicalMedicines = [];

  DiseaseController() {
    //
    biologicalMedicines = [
      Medicine(
        name: 'Chitosan',
        information: 'Chitosan là một loại polymer cation tự nhiên, được lấy từ bộ xương cứng bên ngoài của động vật có vỏ, chẳng hạn như cua, tôm hùm và tôm. Đây là một chất có khả năng tái tạo và thúc đẩy hình thành mô mới khi bị thương hoặc bỏng',
        usage: 'Chitosan là một loại polymer cation tự nhiên, được lấy từ bộ xương cứng bên ngoài của động vật có vỏ, chẳng hạn như cua, tôm hùm và tôm. Đây là một chất có khả năng tái tạo và thúc đẩy hình thành mô mới khi bị thương hoặc bỏng',
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
        information: 'Chitosan là một loại polymer cation tự nhiên, được lấy từ bộ xương cứng bên ngoài của động vật có vỏ, chẳng hạn như cua, tôm hùm và tôm. Đây là một chất có khả năng tái tạo và thúc đẩy hình thành mô mới khi bị thương hoặc bỏng',
        usage: 'Chitosan là một loại polymer cation tự nhiên, được lấy từ bộ xương cứng bên ngoài của động vật có vỏ, chẳng hạn như cua, tôm hùm và tôm. Đây là một chất có khả năng tái tạo và thúc đẩy hình thành mô mới khi bị thương hoặc bỏng',
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
      trieuChung: 'Bệnh đạo ôn là bệnh phổ biến ở cây lúa, gây ra các vết đốm hình thoi màu nâu hoặc xám trên lá, làm cây suy yếu và giảm năng suất. Triệu chứng bao gồm lá khô, cháy đầu lá, hạt lép,',
      nguyenNhan: 'Nguyên nhân của bệnh đạo ôn là do nấm Magnaporthe oryzae gây ra. Nấm phát triển mạnh trong điều kiện thời tiết ẩm ướt, nhiệt độ cao, độ ẩm trên 90%, và mật độ lúa dày.',
      dieuKien: 'Thời tiết ẩm ướt và mưa nhiều.',
      truBenh: 'Sử dụng thuốc diệt nấm để trị bệnh.',
      phongNgua: 'Bệnh đạo ôn là bệnh phổ biến ở cây lúa, gây ra các vết đốm hình thoi màu nâu hoặc xám trên lá, làm cây suy yếu và giảm năng suất. Triệu chứng bao gồm lá khô, cháy đầu lá, hạt lép, Bệnh đạo ôn là bệnh phổ biến ở cây lúa, gây ra các vết đốm hình thoi màu nâu hoặc xám trên lá, làm cây suy yếu và giảm năng suất. Triệu chứng bao gồm lá khô, cháy đầu lá, hạt lép, Bệnh đạo ôn là bệnh phổ biến ở cây lúa, gây ra các vết đốm hình thoi màu nâu hoặc xám trên lá, làm cây suy yếu và giảm năng suất. Triệu chứng bao gồm lá khô, cháy đầu lá, hạt lép,',
      img: 'nhandien1.png',
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
