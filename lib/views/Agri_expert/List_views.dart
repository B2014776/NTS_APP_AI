import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../ultils/CustomTextField.dart';
import '../../ultils/ExpertCard.dart';
// import 'second_page.dart'; // Import trang SecondPage

class AgriExpert extends StatelessWidget {
  late TextEditingController search_expert = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text("Chuyên gia nông nghiệp", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500, color: Colors.white),),
        centerTitle: true, // Căn giữa tiêu đề
      ),
      body: Center(
        child:
          SingleChildScrollView(
            child:
              Column(
                children: [
                  Padding(
                    padding:
                    EdgeInsets.fromLTRB(30, 10, 30, 0),
                    child:
                    Container(

                      height: 50,
                      decoration: BoxDecoration(color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: CustomTextFieldV3(
                        labelText: 'Tìm kiếm',
                        hintText: 'Tìm kiếm',
                        prefixIcon: CupertinoIcons.search,
                        validatorValue: '',
                        controller: search_expert,
                        onChanged: (value){},),
                    ),
                  ),
                  SizedBox(height: 20,),
                  ExpertCard(),
                  SizedBox(height: 20,),
                  ExpertCard(),
                  SizedBox(height: 20,),
                  ExpertCard(),
                  SizedBox(height: 20,),
                  ExpertCard(),
                  SizedBox(height: 20,),
                  ExpertCard(),
                ],
              ),
          ),
      ),
    );
  }
}
