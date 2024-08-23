import 'package:flutter/material.dart';
import '../../../models/DiseaseModel.dart';

class GeneralInfo extends StatelessWidget {
  final Benh? benh;

  GeneralInfo({this.benh});

  @override
  Widget build(BuildContext context) {
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
                  Text(benh!.trieuChung),
                  SizedBox(height: 16),
                  Text(
                    '2. Nguyên nhân:',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  SizedBox(height: 8),
                  Text(benh!.nguyenNhan),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
