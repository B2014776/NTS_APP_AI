import 'package:flutter/material.dart';
import '../../../models/MedicineModel.dart';
import '../MedicineDetails.dart';

class MedicineList extends StatelessWidget {
  final List<ThuocTriBenh> medicines;

  MedicineList({required this.medicines});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: medicines.length,
      itemBuilder: (context, index) {
        final medicine = medicines[index];
        return ListTile(
          title: Text(medicine.tenThuoc),
          trailing: Icon(Icons.arrow_forward),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => MedicineDetails(thuocTriBenh: medicine),
              ),
            );
          },
        );
      },
    );
  }
}
