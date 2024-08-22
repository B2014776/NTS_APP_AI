import 'package:flutter/material.dart';
import '../model/DiseaseModel.dart';
import '../model/MedicineModel.dart';
import 'MedicineDetails.dart';

class DiseaseDetection extends StatefulWidget {
  const DiseaseDetection({super.key});

  @override
  State<DiseaseDetection> createState() => _DiseaseDetectionState();
}

class _DiseaseDetectionState extends State<DiseaseDetection> {
  // Dummy data for Disease
  final List<Benh> diseases = [
    Benh(
      tenBenh: 'Bệnh đạo ôn',
      thuongXuatHienTrenCay: 'Lá lúa',
      trieuChung: 'Xuất hiện các vết đốm nhỏ màu nâu trên lá.',
      nguyenNhan: 'Do nấm gây ra trong điều kiện ẩm ướt.',
      dieuKien: 'Thời tiết ẩm ướt và mưa nhiều.',
      truBenh: 'Sử dụng thuốc diệt nấm để trị bệnh.',
      phongNgua: '- Dọn sạch tàn dư rơm rạ và cỏ dại mang mầm bệnh trên đồng ruộng. Gieo cấy các giống kháng hoặc chống chịu với bệnh đạo ôn. Kiểm tra hạt giống và xử lý giống ở nhiệt độ thích hợp. Mật độ gieo, cấy vừa phải. Bón phân với tỷ lệ cân đối giữa phân chuồng và N:P:K, bón tập trung nặng đầu, nhẹ cuối',
    )
  ];

  // Dummy data for medicines
  final List<Medicine> biologicalMedicines = [
    Medicine(name: 'Chitosan', information: 'Chitosan là một loại polymer cation tự nhiên, được lấy từ bộ xương cứng bên ngoài của động vật có vỏ, chẳng hạn như cua, tôm hùm và tôm. Đây là một chất có khả năng tái tạo và thúc đẩy hình thành mô mới khi bị thương hoặc bỏng', usage: 'Chitosan là một loại polymer cation tự nhiên, được lấy từ bộ xương cứng bên ngoài của động vật có vỏ, chẳng hạn như cua, tôm hùm và tôm. Đây là một chất có khả năng tái tạo và thúc đẩy hình thành mô mới khi bị thương hoặc bỏng'),
    Medicine(name: 'Chitosan', information: 'Thông tin về thuốc sinh học khác...', usage: 'Sử dụng để điều trị tình trạng B.'),
  ];

  final List<Medicine> chemicalMedicines = [
    Medicine(name: 'Chitosan', information: 'Thông tin về thuốc hóa học 1', usage: 'Sử dụng cho tình trạng X'),
    Medicine(name: 'Chitosan', information: 'Thông tin về thuốc hóa học 2', usage: 'Sử dụng cho tình trạng Y'),
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Thông tin bệnh'),
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () => Navigator.of(context).pop(),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CircleAvatar(
                backgroundImage: AssetImage('assets/benh_image.png'),
              ),
            ),
          ],
          bottom: TabBar(
            tabs: [
              Tab(text: 'Thông tin chung'),
              Tab(text: 'Cách điều trị'),
              Tab(text: 'Cách phòng ngừa'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            _buildGeneralInfo(),
            _buildTreatmentTab(),
            _buildPreventionTab(),
          ],
        ),
      ),
    );
  }

  Widget _buildGeneralInfo() {
    final Benh benh = diseases.first; // Use the first item in the list

    return Column(
      children: [
        Expanded(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Image.asset(
                      'assets/nhandien1.png',
                      width: MediaQuery.of(context).size.width,
                      height: 150,
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(height: 16),
                  Text(
                    '1. Triệu chứng:',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(benh.trieuChung),
                  SizedBox(height: 16),
                  Text(
                    '2. Nguyên nhân:',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(benh.nguyenNhan),
                ],
              ),
            ),
          ),
        ),
        Divider(thickness: 1, color: Colors.grey),
        _buildSupportFooter(),
      ],
    );
  }

  Widget _buildTreatmentTab() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              '1. Thuốc sinh học',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          _buildMedicineList(biologicalMedicines),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              '2. Thuốc hóa học',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          _buildMedicineList(chemicalMedicines),
        ],
      ),
    );
  }

  Widget _buildMedicineList(List<Medicine> medicines) {
    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: medicines.length,
      itemBuilder: (context, index) {
        final medicine = medicines[index];
        return ListTile(
          title: Text(medicine.name),
          trailing: Icon(Icons.arrow_forward),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => MedicineDetails(medicine: medicine),
              ),
            );
          },
        );
      },
    );
  }

  Widget _buildPreventionTab() {
    final Benh benh = diseases.first; // Use the first item in the list
    return Column(
      children: [
        Expanded(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Text(
                      'Cách Phòng ngừa',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  ),
                  SizedBox(height: 16),
                  Text(
                    benh.phongNgua,
                    style: TextStyle(
                      fontSize: 17,
                    ),
                  ),
                  SizedBox(height: 16),
                  Center(
                    child: Image.asset(
                      'assets/f25dabbda140c250232a6b1a711d952c.png',
                      width: MediaQuery.of(context).size.width,
                      height: 150,
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(height: 16),
                ],
              ),
            ),
          ),
        ),
        Divider(thickness: 1, color: Colors.grey),
        _buildSupportFooter(),
      ],
    );
  }

  Widget _buildSupportFooter() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 32.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Text(
              'Bạn cần hỗ trợ thêm',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.green[800],
              ),
            ),
          ),
          SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ElevatedButton.icon(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
                ),
                icon: Icon(Icons.chat, color: Colors.white),
                label: Text('Chatbot', style: TextStyle(color: Colors.white)),
              ),
              ElevatedButton.icon(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
                ),
                icon: Icon(Icons.phone, color: Colors.white),
                label: Text('Liên hệ chuyên gia', style: TextStyle(color: Colors.white)),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
