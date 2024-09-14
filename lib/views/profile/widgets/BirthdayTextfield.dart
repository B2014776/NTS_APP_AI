import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DateOfBirthPicker extends StatefulWidget {
  final RxString birthday;

  DateOfBirthPicker({required this.birthday});

  @override
  _DateOfBirthPickerState createState() => _DateOfBirthPickerState();
}

class _DateOfBirthPickerState extends State<DateOfBirthPicker> {
  late TextEditingController _dateController;

  @override
  void initState() {
    super.initState();
    // Khởi tạo TextEditingController với giá trị ngày sinh từ controller
    _dateController = TextEditingController(
      text: widget.birthday.value.isEmpty
          ? ''
          : widget.birthday.value.split('T')[0], // Chỉ lấy phần ngày từ chuỗi ngày giờ
    );
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime currentDate = DateTime.now();
    final DateTime initialDate = widget.birthday.value.isEmpty
        ? currentDate
        : DateTime.parse(widget.birthday.value);

    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: initialDate,
      firstDate: DateTime(1900), // Ngày sớm nhất có thể chọn
      lastDate: currentDate,     // Ngày muộn nhất có thể chọn
    );

    if (pickedDate != null) {
      setState(() {
        _dateController.text = '${pickedDate.toLocal()}'.split(' ')[0]; // Cập nhật TextEditingController
        widget.birthday.value = '${pickedDate.toLocal()}'; // Cập nhật giá trị RxString trong controller
      });
    }
  }

  @override
  void dispose() {
    _dateController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(5),
      ),
      child: Row(
        children: [
          Icon(Icons.calendar_today, color: Colors.green, size: 20),
          SizedBox(width: 8,),
          Expanded(
            child: GestureDetector(
              onTap: () => _selectDate(context),
              child: AbsorbPointer(
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: TextField(
                    controller: _dateController,
                    style: TextStyle(color: Colors.grey[600], fontSize: 14),
                    decoration: InputDecoration(
                      hintText: 'Ngày sinh',
                      hintStyle: TextStyle(color: Colors.grey[600], fontSize: 14),
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.symmetric(horizontal: 9, vertical: 14),
                    ),
                    readOnly: true,
                  ),
                ),
              ),
            ),
          ),
          Icon(Icons.calendar_month, color: Colors.green, size: 20),
        ],
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
      ),
    );
  }
}
