import 'package:flutter/material.dart';

import 'package:apptestai/views/detection/widgets/DetectionAppBar.dart';
import 'package:apptestai/views/detection/widgets/GeneralInfo.dart';
import 'package:apptestai/views/detection/widgets/PreventionTab.dart';
import 'package:apptestai/views/detection/widgets/TreatmentTab.dart';
import '../../models/DiseaseModel.dart';
import '../../models/MedicineModel.dart';
import '../detection/widgets/SupportFooter.dart';

class DiseaseDetection extends StatefulWidget {
  final Map<String, dynamic> response;

  const DiseaseDetection({Key? key, required this.response}) : super(key: key);

  @override
  State<DiseaseDetection> createState() => _DiseaseDetectionState();
}

class _DiseaseDetectionState extends State<DiseaseDetection> {
  Benh? _benhData;
  List<ThuocTriBenh> _biologicalMedicines = [];
  List<ThuocTriBenh> _chemicalMedicines = [];

  @override
  void initState() {
    super.initState();
    // Lấy data từ response
    final benhDataMap = widget.response['data'] as Map<String, dynamic>?;

    if (benhDataMap != null) {
      _benhData = Benh.fromJson(benhDataMap);
      print('_benhData: $_benhData');

      if (benhDataMap['thuocSinhHoc'] != null) {
        _biologicalMedicines = (benhDataMap['thuocSinhHoc'] as List<dynamic>)
            .map((item) => ThuocTriBenh.fromJson(item as Map<String, dynamic>))
            .toList();
      }

      if (benhDataMap['thuocHoaHoc'] != null) {
        _chemicalMedicines = (benhDataMap['thuocHoaHoc'] as List<dynamic>)
            .map((item) => ThuocTriBenh.fromJson(item as Map<String, dynamic>))
            .toList();
      }
    } else {
      print("Data is null or not in the correct format");
    }
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: DetectionAppBar(
          diseaseName: _benhData?.tenBenh ?? 'Unknown Disease',
          appBarHeight: 65.0,
        ),
        body: Column(
          children: [
            TabBar(
              indicatorColor: Colors.green[700],
              labelColor: Colors.green,
              unselectedLabelColor: Colors.black,
              isScrollable: true,
              tabAlignment: TabAlignment.start,
              tabs: const [
                Tab(text: 'Thông tin chung'),
                Tab(text: 'Cách điều trị'),
                Tab(text: 'Cách phòng ngừa'),
              ],
            ),
            Expanded(
              child: TabBarView(
                children: [
                  if (_benhData != null)
                    GeneralInfo(benh: _benhData!)
                  else
                    Center(child: Text('No data')),
                  // TreatmentTab(
                  //   biologicalMedicines: _biologicalMedicines,
                  //   chemicalMedicines: _chemicalMedicines,
                  // ),
                  // if (_benhData != null)
                  //   PreventionTab(benh: _benhData!)
                  // else
                  //   Center(child: Text('No data')),
                ],
              ),
            ),
            Divider(),
            SupportFooter(),
          ],
        ),
      ),
    );
  }
}
