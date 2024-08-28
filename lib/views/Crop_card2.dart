import 'package:flutter/material.dart';

class GreenCropCard extends StatefulWidget {
  @override
  _GreenCropCardState createState() => _GreenCropCardState();
}

class _GreenCropCardState extends State<GreenCropCard> {
  String description = 'Cách trồng: Gieo hạt, tưới nước,...'; // Biến trạng thái

  void updateDescription() {
    setState(() {
      description = 'Mô tả mới về cách trồng cây...'; // Cập nhật trạng thái
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(20, 5, 20, 5),
      child: Container(
        padding: EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          color: Color(0xffE1FFC9),
          borderRadius: BorderRadius.circular(5),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 5,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          children: [
            Text('Phương pháp trồng cây lúa', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),),
            SizedBox(height: 5,),
            Row(
              children: [
                Image.asset('assets/Caylua3.png', width: 104, height: 125,),
                SizedBox(width: 10),
                Expanded( // Sử dụng Expanded để tránh tràn
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      Text(
                        'Loại cây: cây lương thực',
                        style: TextStyle(color: Colors.black, fontSize: 18),
                      ),
                      Text(
                        description,
                        style: TextStyle(color: Colors.black, fontSize: 18),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
