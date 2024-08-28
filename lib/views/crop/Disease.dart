import 'package:flutter/material.dart';
import '../../../models/CropModel.dart'; // Import the model
import '../../models/DiseaseModel.dart';
import 'DiseaseDetail.dart';
import 'DiseaseDetail.dart'; // Import the DiseaseDetails screen

class Disease extends StatefulWidget {
  final LoaiCayTrong loaiCayTrong; // Add this field

  Disease({required this.loaiCayTrong}); // Update the constructor to require this

  @override
  _DiseaseState createState() => _DiseaseState();
}

class _DiseaseState extends State<Disease> {
  @override
  void initState() {
    super.initState();
    // No need to fetch data from API as it's passed from the previous screen
  }

  void _navigateToDiseaseDetails(Benh benh) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DiseaseDetail(benh: benh), // Pass the disease object to DiseaseDetails
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Thông Tin Bệnh",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.green,
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
      ),

      body: SingleChildScrollView(
        child: Column(
          children: [
            // Add any static widgets you need here

            // The Column should be populated with disease cards
            Column(
              children: widget.loaiCayTrong.sauBenhList.map((benh) {
                return GestureDetector(
                  onTap: () => _navigateToDiseaseDetails(benh),
                  child: Card(
                    elevation: 2.0,
                    margin: EdgeInsets.all(8.0),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            benh.tenBenh, // Display disease name
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 8),
                          Text(
                            benh.trieuChung, // Display symptoms
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                          SizedBox(height: 8),
                          Image.asset(
                            'assets/${benh.img}', // Display disease image
                            height: 150,
                            width: double.infinity,
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) {
                              return Center(child: Text('Image not found'));
                            },
                          ),
                        ],
                      ),
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
