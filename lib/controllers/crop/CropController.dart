import 'package:dio/dio.dart';
import '../../models/CropModel.dart';

class CropController {
  LoaiCayTrong? loaiCayTrong;
  List<LoaiCayTrong> cropsList = [];

  CropController() {
    cropsList = [
      LoaiCayTrong(
        id: 1,
        tenLoai: 'Cây cà chua',
        moTa: 'Cây cà chua là cây thảo, sống theo mùa. Thân tròn, phân cành nhiều. Lá có cuống dài, phiến lá xẻ lông chim, số lượng thùy không ổn định, thường có răng cưa.',
        dieuKienThoiTiet: 'Nhiệt độ từ 20°C đến 35°C, lượng mưa nhiều.',
        thoiGianTruongThanh: 120,
        sanLuongTrungBinh: 8.5,
        img: '554d3ac0c24467cbb3b39a0cb4a0c0eb.png',
      ),
      LoaiCayTrong(
        id: 2,
        tenLoai: 'Ngô',
        moTa: 'Ngô là loại cây trồng phổ biến, dễ trồng và có khả năng chịu hạn.',
        dieuKienThoiTiet: 'Nhiệt độ từ 18°C đến 32°C, độ ẩm trung bình.',
        thoiGianTruongThanh: 100,
        sanLuongTrungBinh: 5.0,
        img: '554d3ac0c24467cbb3b39a0cb4a0c0eb.png',
      ),
    ];
  }

  Future<void> fetchCropsFromAPI() async {
    loaiCayTrong = LoaiCayTrong(
      id: 1,
      tenLoai: 'Cây cà chua',
      moTa: 'Cây cà chua là cây thảo, sống theo mùa. Thân tròn, phân cành nhiều. Lá có cuống dài, phiến lá xẻ lông chim, số lượng thùy không ổn định, thường có răng cưa.',
      dieuKienThoiTiet: 'Nhiệt độ từ 20°C đến 35°C, lượng mưa nhiều.',
      thoiGianTruongThanh: 120,
      sanLuongTrungBinh: 8.5,
      img: '554d3ac0c24467cbb3b39a0cb4a0c0eb.png',
    );

    try {
      final response = await Dio().get('https://example-api/test');
      if (response.statusCode == 200) {
        List<dynamic> data = response.data;
        cropsList = data.map((json) => LoaiCayTrong.fromJson(json)).toList();
      }
    } catch (error) {
      print("Failed to load crops data: $error");
    }
  }

  String getCropDetails(int id) {
    try {
      LoaiCayTrong crop = cropsList.firstWhere((c) => c.id == id);
      return "Tên cây trồng: ${crop.tenLoai}\nMô tả: ${crop.moTa}\nĐiều kiện thời tiết: ${crop.dieuKienThoiTiet}\nThời gian trưởng thành: ${crop.thoiGianTruongThanh} ngày\nSản lượng trung bình: ${crop.sanLuongTrungBinh} tấn/ha";
    } catch (e) {
      // Trả về thông báo khi không tìm thấy cây trồng với ID
      return "Không tìm thấy cây trồng với ID: $id";
    }
  }

}
