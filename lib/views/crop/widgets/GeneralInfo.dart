import 'package:flutter/material.dart';
import '../../../models/CropModel.dart';
import '../widgets/InfoCard.dart';

class GeneralInfo extends StatefulWidget {
  final LoaiCayTrong? loaiCayTrong;

  GeneralInfo({this.loaiCayTrong});

  @override
  _GeneralInfoState createState() => _GeneralInfoState();
}

class _GeneralInfoState extends State<GeneralInfo> {
  bool isMoTaExpanded = false;
  final int textLimit = 100;

  @override
  Widget build(BuildContext context) {
    if (widget.loaiCayTrong == null) {
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
                    'assets/${widget.loaiCayTrong!.img}',
                    height: 200,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                  SizedBox(height: 32),
                  Text(
                    widget.loaiCayTrong!.tenLoai,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  SizedBox(height: 8),
                  Text(
                    isMoTaExpanded
                        ? widget.loaiCayTrong!.moTa
                        : widget.loaiCayTrong!.moTa.length > textLimit
                        ? widget.loaiCayTrong!.moTa.substring(0, textLimit) + '...'
                        : widget.loaiCayTrong!.moTa,
                  ),
                  if (widget.loaiCayTrong!.moTa.length > textLimit)
                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        onPressed: () {
                          setState(() {
                            isMoTaExpanded = !isMoTaExpanded;
                          });
                        },
                        child: Text(
                          isMoTaExpanded ? 'Thu gọn' : 'Xem thêm',
                          style: TextStyle(
                            color: Colors.orangeAccent,
                          ),
                        ),
                      ),
                    ),
                  SizedBox(height: 16),
                  CropInfoGrid(loaiCayTrong: widget.loaiCayTrong!),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
