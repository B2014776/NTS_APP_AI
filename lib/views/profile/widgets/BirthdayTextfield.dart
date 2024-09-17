import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DateOfBirthPicker extends StatelessWidget {
  final RxString birthday;

  DateOfBirthPicker({required this.birthday});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      // Create a TextEditingController with the formatted date
      final dateController = TextEditingController(
        text: birthday.value.isEmpty
            ? ''
            : birthday.value.split('T')[0], // Extract date part from ISO8601 string
      );

      // Function to open date picker
      Future<void> _selectDate() async {
        final DateTime currentDate = DateTime.now();
        final DateTime initialDate = birthday.value.isEmpty
            ? currentDate
            : DateTime.parse(birthday.value);

        final DateTime? pickedDate = await showDatePicker(
          context: context,
          initialDate: initialDate,
          firstDate: DateTime(1900), // Earliest selectable date
          lastDate: currentDate,     // Latest selectable date
        );

        if (pickedDate != null) {
          final formattedDate = '${pickedDate.toLocal()}'.split(' ')[0]; // Format to YYYY-MM-DD
          // Update the controller text and the observable value
          dateController.text = formattedDate;
          birthday.value = formattedDate; // Update RxString
        }
      }

      return Container(
        height: 45,
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(5),
        ),
        child: Padding(
          padding: EdgeInsets.fromLTRB(13, 0, 13, 0),
          child: Row(
            children: [
              Icon(Icons.calendar_today, color: Colors.green, size: 20),
              SizedBox(width: 8),
              Expanded(
                child: GestureDetector(
                  onTap: _selectDate,
                  child: AbsorbPointer(
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: TextField(
                        controller: dateController,
                        style: TextStyle(color: Colors.grey[800], fontSize: 15),
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
        ),
      );
    });
  }
}
