import 'package:flutter/material.dart';

import 'package:apptestai/views/crop/widgets/CropAppBar.dart';

import '../../controllers/crop/CropController.dart';
import '../crop/widgets/GeneralInfo.dart';

class Crop extends StatefulWidget {
  const Crop({super.key});

  @override
  State<Crop> createState() => _CropState();
}

class _CropState extends State<Crop> {
  final CropController _controller = CropController();

  @override
  void initState() {
    super.initState();
    _controller.fetchCropsFromAPI();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: CropAppBar(controller: _controller, appBarHeight: 65.0),
        body: FutureBuilder<void>(
          future: _controller.fetchCropsFromAPI(),
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
                        GeneralInfo(loaiCayTrong: _controller.loaiCayTrong),

                      ],
                    ),
                  ),
                ],
              );
            }
          },
        ),
      ),
    );
  }
}
