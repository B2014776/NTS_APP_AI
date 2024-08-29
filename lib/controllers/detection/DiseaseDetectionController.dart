import 'package:dio/dio.dart';
import '../../models/DiseaseModel.dart';
import '../../models/MedicineModel.dart';

class DiseaseController {
  Benh? benh;

  DiseaseController() {}

  Future<Map<String, dynamic>> uploadImageAndFetchDetailsTemp(
      String imagePath) async {
    Map<String, dynamic> result = {};

    benh = Benh(
      tenBenh: 'Bệnh đạo ôn',
      thuongXuatHienTrenCay: 'Lá lúa',
      trieuChung:
          'Bệnh đạo ôn là bệnh phổ biến ở cây lúa, gây ra các đốm nâu và thối lá.',
      nguyenNhan:
          'Nguyên nhân của bệnh đạo ôn là do nấm Magnaporthe oryzae gây ra, phát triển mạnh trong điều kiện ẩm ướt.',
      dieuKien:
          'Bệnh phát triển nhanh trong điều kiện thời tiết ẩm ướt và mưa nhiều.',
      truBenh:
          'Sử dụng thuốc diệt nấm như Carbendazim và Propiconazole để điều trị bệnh đạo ôn.',
      phongNgua:
          'Các biện pháp phòng ngừa bao gồm sử dụng thuốc phòng bệnh và cải thiện điều kiện thoát nước.',
      img: 'nhandien1.png',
      thuocSinhHoc: [
        ThuocTriBenh(
          tenThuoc: 'Chitosan',
          thongTin:
              'Chitosan là một loại polymer cation tự nhiên được chiết xuất từ vỏ tôm, cua, hoặc nấm. Nó có khả năng kháng nấm và vi khuẩn, giúp tăng cường sức đề kháng của cây trồng.',
          cachSuDung:
              'Chitosan được sử dụng để phòng ngừa và điều trị các bệnh do nấm và vi khuẩn gây ra.',
          img: 'e1e1afe61c77b69bc5d67a8852100e94.png',
        )
      ],
      thuocHoaHoc: [
        ThuocTriBenh(
          tenThuoc: 'Carbendazim',
          thongTin:
              'Carbendazim là một loại thuốc diệt nấm hiệu quả được sử dụng để kiểm soát nhiều loại bệnh nấm khác nhau trên cây trồng.',
          cachSuDung:
              'Sử dụng Carbendazim khi bệnh nấm xuất hiện trên cây để kiểm soát và giảm thiểu thiệt hại.',
          img: 'e1e1afe61c77b69bc5d67a8852100e94.png',
        ),
      ],
    );

    return result;
  }

  Future<Map<String, dynamic>> uploadImageAndFetchDetails(
      String imagePath) async {
    Map<String, dynamic> result = {};

    try {
      Dio dio = Dio();
      FormData formData = FormData.fromMap({
        "file": await MultipartFile.fromFile(imagePath, filename: "image.jpg"),
      });

      final response = await dio.post(
        'https://api-ai-1-6b81.onrender.com/predict/',
        data: formData,
      );

      if (response.statusCode == 200) {
        result = response.data; // Assume the response data is a Map
      } else {
        result['error'] = 'Failed to fetch data';
      }
    } catch (error) {
      result['error'] = 'Error: $error';
    }

    return result;
  }

  String getBenhDetails(dynamic benh) {
    if (benh != null) {
      return "Tên bệnh: ${benh!.tenBenh}\nTriệu chứng: ${benh!.trieuChung}\nNguyên nhân: ${benh!.nguyenNhan}";
    } else {
      return "Chưa có dữ liệu bệnh.";
    }
  }

}


