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
  final int textLimit = 100; // Giới hạn ký tự hiển thị ban đầu

  @override
  Widget build(BuildContext context) {
    if (widget.benh == null) {
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
                  Image.asset(
                    'assets/${widget.benh!.img}',
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
                        ? widget.benh!.trieuChung
                        : widget.benh!.trieuChung.length > textLimit
                        ? widget.benh!.trieuChung.substring(0, textLimit) + '...'
                        : widget.benh!.trieuChung,
                  ),
                  if (widget.benh!.trieuChung.length > textLimit)
                    Align(
                      alignment: Alignment.centerRight, // Căn chỉnh nút sang bên phải
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
                        ? widget.benh!.nguyenNhan
                        : widget.benh!.nguyenNhan.length > textLimit
                        ? widget.benh!.nguyenNhan.substring(0, textLimit) + '...'
                        : widget.benh!.nguyenNhan,
                  ),
                  if (widget.benh!.nguyenNhan.length > textLimit)
                    Align(
                      alignment: Alignment.centerRight, // Căn chỉnh nút sang bên phải
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
