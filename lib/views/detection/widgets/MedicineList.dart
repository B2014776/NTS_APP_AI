import 'package:flutter/material.dart';
import '../../../models/MedicineModel.dart';
import '../MedicineDetails.dart';

class MedicineList extends StatelessWidget {
  final List<Medicine> medicines;

  MedicineList({required this.medicines});

  @override
  Widget build(BuildContext context) {
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
}
