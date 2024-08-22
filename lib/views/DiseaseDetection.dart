import 'package:flutter/material.dart';
import '../LoginController/DiseaseDetectionController.dart';
import '../model/DiseaseModel.dart';
import '../model/MedicineModel.dart';
import 'MedicineDetails.dart';

class DiseaseDetection extends StatefulWidget {
  const DiseaseDetection({super.key});

  @override
  State<DiseaseDetection> createState() => _DiseaseDetectionState();
}

class _DiseaseDetectionState extends State<DiseaseDetection> {
  final DiseaseController _controller = DiseaseController();

  @override
  void initState() {
    super.initState();
    _controller.fetchBenhFromAPI();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text(_controller.benh!.tenBenh),
          leading: Center(
            child: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () => Navigator.of(context).pop(),
            ),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CircleAvatar(
                backgroundImage: AssetImage('assets/f25dabbda140c250232a6b1a711d952c.png'),
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
        body: FutureBuilder<void>(
          future: _controller.fetchBenhFromAPI(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text('Failed to load disease details'));
            } else {
              return TabBarView(
                children: [
                  _buildGeneralInfo(),
                  _buildTreatmentTab(),
                  _buildPreventionTab(),
                ],
              );
            }
          },
        ),
      ),
    );
  }

  Widget _buildGeneralInfo() {
    final Benh? benh = _controller.benh;

    if (benh == null) {
      return Center(child: Text("No data available."));
    }

    return Column(
      children: [
        Expanded(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '1. Triệu chứng:',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  SizedBox(height: 8),
                  Text(benh.trieuChung),
                  SizedBox(height: 16),
                  Text(
                    '2. Nguyên nhân:',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  SizedBox(height: 8),
                  Text(benh.nguyenNhan),
                ],
              ),
            ),
          ),
        ),
        Divider(thickness: 1, color: Colors.grey),
        _buildSupportFooter(), // Phần footer của bạn
      ],
    );
  }

  Widget _buildTreatmentTab() {
    return Column(
      children: [
        Expanded(
          child: SingleChildScrollView(
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
                _buildMedicineList(_controller.biologicalMedicines),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    '2. Thuốc hóa học',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
                _buildMedicineList(_controller.chemicalMedicines),
              ],
            ),
          ),
        ),
        Divider(thickness: 1, color: Colors.grey),
        _buildSupportFooter(), // Phần footer của bạn
      ],
    );
  }

  Widget _buildPreventionTab() {
    final Benh? benh = _controller.benh;

    if (benh == null) {
      return Center(child: Text("No data available."));
    }

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
                    style: TextStyle(fontSize: 17),
                  ),
                ],
              ),
            ),
          ),
        ),
        Divider(thickness: 1, color: Colors.grey),
        _buildSupportFooter(), // Phần footer của bạn
      ],
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
