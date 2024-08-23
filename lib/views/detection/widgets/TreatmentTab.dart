import 'package:flutter/material.dart';
import '../../../models/MedicineModel.dart';
import 'MedicineList.dart';

class TreatmentTab extends StatelessWidget {
  final List<Medicine> biologicalMedicines;
  final List<Medicine> chemicalMedicines;

  TreatmentTab({required this.biologicalMedicines, required this.chemicalMedicines});

  @override
  Widget build(BuildContext context) {
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
                MedicineList(medicines: biologicalMedicines),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    '2. Thuốc hóa học',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
                MedicineList(medicines: chemicalMedicines),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
