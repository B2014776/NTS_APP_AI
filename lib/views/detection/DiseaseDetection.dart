import 'package:flutter/material.dart';
import 'package:apptestai/views/detection/widgets/DetectionAppBar.dart';
import 'package:apptestai/views/detection/widgets/GeneralInfo.dart';
import 'package:apptestai/views/detection/widgets/PreventionTab.dart';
import 'package:apptestai/views/detection/widgets/TreatmentTab.dart';
import '../../controllers/DiseaseDetectionController.dart';
import '../detection/widgets/SupportFooter.dart';

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
        appBar: DetectionAppBar(controller: _controller),
        body: FutureBuilder<void>(
          future: _controller.fetchBenhFromAPI(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text('Failed to load disease details'));
            } else {
              return Column(
                children: [
                  Expanded(
                    child: TabBarView(
                      children: [
                        GeneralInfo(benh: _controller.benh),
                        TreatmentTab(
                          biologicalMedicines: _controller.biologicalMedicines,
                          chemicalMedicines: _controller.chemicalMedicines,
                        ),
                        PreventionTab(benh: _controller.benh),
                      ],
                    ),
                  ),
                  Divider(),
                  SupportFooter(),
                ],
              );
            }
          },
        ),
      ),
    );
  }
}
