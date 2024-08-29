import 'package:dio/dio.dart';
import '../../models/CropModel.dart';
import '../../models/CropTypeModel.dart';
import '../../models/CultivateModel.dart';
import '../../models/DiseaseModel.dart';
import '../../models/MedicineModel.dart';

class CropController {
  LoaiCayTrong? loaiCayTrong;

  CropController() {}

  Future<void> fetchCropsFromAPI() async {
    loaiCayTrong = LoaiCayTrong(
      id: 1,
      tenLoai: 'Cây cà chua',
      moTa:
          'Cây cà chua là cây thảo, sống theo mùa. Thân tròn, phân cành nhiều. Lá có cuống dài, phiến lá xẻ lông chim, số lượng thùy không ổn định, thường có răng cưa.',
      dieuKienThoiTiet: 'Nhiệt độ từ 20°C đến 35°C, lượng mưa nhiều.',
      thoiGianTruongThanh: 120,
      sanLuongTrungBinh: 8.5,
      img: '554d3ac0c24467cbb3b39a0cb4a0c0eb.png',
      giongCayTrongList: [
        GiongCayTrong(
          id: 1,
          tenGiong: 'Cà chua Bi',
          dacDiemNoiBat: 'Chịu nhiệt tốt, thích hợp trồng ngoài trời.',
          xuatXu: 'Italia',
          nangSuat: '7 tấn/ha',
          img: '087e9716ffd60b02c5928039ca4d5bbb.png',
        ),
        GiongCayTrong(
          id: 2,
          tenGiong: 'Cà chua Roman',
          dacDiemNoiBat: 'Ngọt, dễ trồng, cho trái nhỏ.',
          xuatXu: 'Mỹ',
          nangSuat: '6 tấn/ha',
          img: 'dab56e733268a1dfb0d0a9e95a2971de.png',
        ),
        GiongCayTrong(
          id: 3,
          tenGiong: 'Cà chua Beafteak',
          dacDiemNoiBat: 'Ngọt, dễ trồng, cho trái nhỏ.',
          xuatXu: 'Mỹ',
          nangSuat: '7 tấn/ha',
          img: 'ead89b6c783ed9a280ebfe96d72b1d77.png',
        ),
      ],
      sauBenhList: [
        Benh(
          tenBenh: 'Sâu cuốn lá',
          thuongXuatHienTrenCay: 'Lá, quả',
          trieuChung:
              ' Sâu cuốn lá ăn biểu bì mặt trên và diệp lục của lá dọc theo gân lá tạo thành những vệt trắng dài, các vệt này có thể nối liền với nhau thành từng mảng làm giảm diện tích quang hợp, đặc biệt là trên lá đòng hoặc lá công năng sẽ làm giảm năng suất rõ rệt.',
          nguyenNhan: 'Nấm Beauveria bassianae, Nomurea rileyi',
          dieuKien: 'Nhiều mưa, độ ẩm cao.',
          truBenh:
              'Xác định sự xuất hiện của bướm sâu cuốn lá trên ruộng để lựa chọn thời điểm xử lý thuốc là một việc làm vô cùng cần thiết, vì vậy bà con nên thăm đồng thường xuyên.',
          phongNgua:
              'Trồng cây với khoảng cách rộng, tránh tưới nước quá nhiều.',
          img: 'c41187629afebe90269e0e954e69f1eb.png',
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
        ),
        Benh(
          tenBenh: 'Bệnh héo xanh',
          thuongXuatHienTrenCay: 'Thân cây',
          trieuChung:
              ' Sâu cuốn lá ăn biểu bì mặt trên và diệp lục của lá dọc theo gân lá tạo thành những vệt trắng dài, các vệt này có thể nối liền với nhau thành từng mảng làm giảm diện tích quang hợp, đặc biệt là trên lá đòng hoặc lá công năng sẽ làm giảm năng suất rõ rệt.',
          nguyenNhan: 'Nấm Beauveria bassianae, Nomurea rileyi',
          dieuKien: 'Nhiệt độ cao, độ ẩm thấp.',
          truBenh: 'Sử dụng thuốc kháng sinh.',
          phongNgua: 'Trồng giống kháng bệnh, giữ độ ẩm đất ổn định.',
          img: 'c41187629afebe90269e0e954e69f1eb.png',
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
        ),
      ],
      kyThuatTrongList: [
        KyThuatTrong(
          id: '1',
          tenKyThuatTrong: 'Kỹ thuật trồng cà chua Bi',
          buocThucHien:
              '1. Chọn giống chất lượng cao. 2. Gieo hạt vào bầu đất. 3. Tưới nước thường xuyên và giữ độ ẩm. 4. Đặt cây ở nơi có ánh sáng mặt trời đầy đủ.',
          phanBonSuDung: 'Sử dụng phân NPK 16-16-8 và phân hữu cơ.',
          tuoiNuoc: 'Tưới nước đều đặn mỗi ngày, không để đất khô quá lâu.',
          chamSoc:
              'Tỉa cành và lá già, giữ khoảng cách giữa các cây để thoáng khí.',
          thoiGianThucHien: 'Khoảng 90-100 ngày',
        ),
      ],
    );

    try {
      final response = await Dio().get('https://example-api/crops');
      if (response.statusCode == 200) {
        List<dynamic> data = response.data;
        if (data.isNotEmpty) {
          loaiCayTrong = LoaiCayTrong.fromJson(data.first);
        }
      }
    } catch (error) {
      print("Failed to load crops data: $error");
    }
  }

  String getCropDetails(int id) {
    if (loaiCayTrong != null && loaiCayTrong!.id == id) {
      return "Tên loại cây trồng: ${loaiCayTrong!.tenLoai}\nMô tả: ${loaiCayTrong!.moTa}\nĐiều kiện thời tiết: ${loaiCayTrong!.dieuKienThoiTiet}\nThời gian trưởng thành: ${loaiCayTrong!.thoiGianTruongThanh} ngày\nSản lượng trung bình: ${loaiCayTrong!.sanLuongTrungBinh} tấn/ha\nGiống cây trồng: ${loaiCayTrong!.giongCayTrongList.map((g) => g.tenGiong).join(', ')}";
    } else {
      return "Không tìm thấy loại cây trồng với ID: $id";
    }
  }
}
