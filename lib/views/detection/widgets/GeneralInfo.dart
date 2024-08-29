import 'package:flutter/material.dart';
import '../../../models/DiseaseModel.dart';

class GeneralInfo extends StatefulWidget {
  final Benh? benh;

  GeneralInfo({this.benh});

  @override
  _GeneralInfoState createState() => _GeneralInfoState();
}

class _GeneralInfoState extends State<GeneralInfo> {
  bool isTrieuChungExpanded = false;
  bool isNguyenNhanExpanded = false;
  final int textLimit = 100;

  @override
  Widget build(BuildContext context) {
    if (widget.benh == null) {
      return Center(child: Text("No data available."));
    }

    // Kiểm tra dữ liệu và thay thế bằng 'N/A' nếu không có
    String tenBenh = widget.benh?.tenBenh ?? 'N/A';
    String imgPath = widget.benh?.img ?? 'a196eb3c8f43db5f22c2de4c258e4953.png';
    String trieuChung = widget.benh?.trieuChung ?? 'N/A';
    String nguyenNhan = widget.benh?.nguyenNhan ?? 'N/A';

    return Column(
      children: [
        Expanded(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset(
                    'assets/$imgPath',
                    height: 200,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                  SizedBox(height: 16),

                  // Triệu chứng
                  Text(
                    '1. Triệu chứng:',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  SizedBox(height: 8),
                  Text(
                    isTrieuChungExpanded
                        ? trieuChung
                        : trieuChung.length > textLimit
                        ? trieuChung.substring(0, textLimit) + '...'
                        : trieuChung,
                  ),
                  if (trieuChung.length > textLimit)
                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        onPressed: () {
                          setState(() {
                            isTrieuChungExpanded = !isTrieuChungExpanded;
                          });
                        },
                        child: Text(
                          isTrieuChungExpanded ? 'Thu gọn' : 'Xem thêm',
                          style: TextStyle(
                            color: Colors.orangeAccent,
                          ),
                        ),
                      ),
                    ),
                  SizedBox(height: 16),

                  // Nguyên nhân
                  Text(
                    '2. Nguyên nhân:',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  SizedBox(height: 8),
                  Text(
                    isNguyenNhanExpanded
                        ? nguyenNhan
                        : nguyenNhan.length > textLimit
                        ? nguyenNhan.substring(0, textLimit) + '...'
                        : nguyenNhan,
                  ),
                  if (nguyenNhan.length > textLimit)
                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        onPressed: () {
                          setState(() {
                            isNguyenNhanExpanded = !isNguyenNhanExpanded;
                          });
                        },
                        child: Text(
                          isNguyenNhanExpanded ? 'Thu gọn' : 'Xem thêm',
                          style: TextStyle(
                            color: Colors.orangeAccent,
                          ),
                        ),
                      ),
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
