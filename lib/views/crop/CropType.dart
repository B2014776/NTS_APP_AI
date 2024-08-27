import 'package:apptestai/views/crop/widgets/CropTypeAppBar.dart';
import 'package:flutter/material.dart';
import '../../../models/CropModel.dart'; // Import the model

class CropType extends StatefulWidget {
  final LoaiCayTrong loaiCayTrong; // Add this field

  CropType({required this.loaiCayTrong}); // Update the constructor to require this

  @override
  _CropTypeState createState() => _CropTypeState();
}

class _CropTypeState extends State<CropType> {
  @override
  void initState() {
    super.initState();
    // No need to fetch data from API as it's passed from the previous screen
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CropTypeAppBar(
        appBarHeight: 65,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Add any static widgets you need here

            // The ListView.builder should be replaced by a Column here
            Column(
              children: widget.loaiCayTrong.giongCayTrongList.map((giong) {
                return Card(
                  elevation: 2.0,
                  margin: EdgeInsets.all(8.0),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          giong.tenGiong, // Display crop variety name
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          giong.dacDiemNoiBat, // Display crop features
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.grey[600],
                          ),
                        ),
                        SizedBox(height: 12),
                        Image.asset(
                          'assets/${giong.img}', // Display crop variety image
                          height: 150,
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                      ],
                    ),
                  ),
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}
