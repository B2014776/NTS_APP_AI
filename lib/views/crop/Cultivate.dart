import 'package:flutter/material.dart';
import '../../../models/CropModel.dart';
import '../../models/CultivateModel.dart'; // Import the model

class Cultivate extends StatefulWidget {
  final List<KyThuatTrong> kyThuatTrongList;

  Cultivate(
      {required this.kyThuatTrongList}); // Update the constructor to require this

  @override
  _CultivateState createState() => _CultivateState();
}

class _CultivateState extends State<Cultivate> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Kỹ thuật trồng",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.green,
        iconTheme: IconThemeData(
          color: Colors.white, // Set the color of the back arrow
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: widget.kyThuatTrongList.map((kyThuat) {
            return Container(
              margin: EdgeInsets.all(8.0),
              padding: EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey.shade300),
                borderRadius: BorderRadius.circular(8.0),
                color: Colors.white,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset(
                    'assets/554d3ac0c24467cbb3b39a0cb4a0c0eb.png',
                    // Replace with the appropriate image path
                    height: 150,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                  SizedBox(height: 16),
                  Text(
                    kyThuat.tenKyThuatTrong, // Display technique name
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold, // Make the title bold
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    "Bước Thực Hiện: ", // Display steps
                    style: TextStyle(fontSize: 16),
                  ),
                  Text('${kyThuat.buocThucHien}'),
                  SizedBox(height: 8),
                  Text(
                    "Phân Bón Sử Dụng: ${kyThuat.phanBonSuDung}",
                    // Display fertilizers used
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(height: 8),
                  Text(
                    "Tưới Nước: ${kyThuat.tuoiNuoc}", // Display watering
                    style: TextStyle(fontSize: 16),
                  ),

                  SizedBox(height: 8),
                  Text(
                    "Chăm Sóc: ${kyThuat.chamSoc}", // Display care instructions
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(height: 8),
                  Text(
                    "Thời Gian Thực Hiện: ${kyThuat.thoiGianThucHien}",
                    // Display execution time
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
