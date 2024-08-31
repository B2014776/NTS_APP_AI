import 'package:flutter/material.dart';
import '../../../models/DiseaseModel.dart';

class PreventionTab extends StatelessWidget {
  final Benh? benh;

  PreventionTab({this.benh});

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
                    benh!.phongNgua,
                    style: TextStyle(fontSize: 17),
                  ),
                  SizedBox(height: 16),
                  Image.asset(
                    'assets/Dong_ruong.png',
                    height: 200,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
