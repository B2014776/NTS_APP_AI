import 'package:dio/dio.dart';
import '../../models/CropTypeModel.dart'; // Import GiongCayTrong model

class CropTypeController {
  GiongCayTrong? giongCayTrong;
  List<GiongCayTrong> cropTypeList = [];

  CropTypeController() {
    cropTypeList = [
      GiongCayTrong(
        id: 1,
        tenGiong: 'Giong lúa Nàng Hoa',
        dacDiemNoiBat: 'Khả năng kháng sâu bệnh tốt, thích hợp cho vùng đất khô cằn.',
        xuatXu: 'Việt Nam',
        nangSuat: '7.5 tấn/ha',
        img: 'nang_hoa.jpg',
      ),
      GiongCayTrong(
        id: 2,
        tenGiong: 'Giong lúa OM5451',
        dacDiemNoiBat: 'Chống chịu tốt với thời tiết khắc nghiệt, năng suất cao.',
        xuatXu: 'Việt Nam',
        nangSuat: '6.5 tấn/ha',
        img: 'om5451.jpg',
      ),
    ];
  }

  Future<void> fetchCropTypesFromAPI() async {
    giongCayTrong = GiongCayTrong(
      id: 1,
      tenGiong: 'Giong lúa Nàng Hoa',
      dacDiemNoiBat: 'Khả năng kháng sâu bệnh tốt, thích hợp cho vùng đất khô cằn.',
      xuatXu: 'Việt Nam',
      nangSuat: '7.5 tấn/ha',
      img: 'nang_hoa.jpg',
    );

    try {
      final response = await Dio().get('https://example-api/crop-types');
      if (response.statusCode == 200) {
        List<dynamic> data = response.data;
        cropTypeList = data.map((json) => GiongCayTrong.fromJson(json)).toList();
      }
    } catch (error) {
      print("Failed to load crop types data: $error");
    }
  }

  String getCropTypeDetails(int id) {
    try {
      GiongCayTrong cropType = cropTypeList.firstWhere((c) => c.id == id);
      return "Tên giống: ${cropType.tenGiong}\nĐặc điểm nổi bật: ${cropType.dacDiemNoiBat}\nXuất xứ: ${cropType.xuatXu}\nNăng suất: ${cropType.nangSuat} tấn/ha";
    } catch (e) {
      return "Không tìm thấy giống cây trồng với ID: $id";
    }
  }
}
