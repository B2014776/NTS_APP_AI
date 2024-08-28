import 'package:flutter/material.dart';

class CustomTextFieldV3 extends StatelessWidget {
  final String labelText;
  final String hintText;
  final IconData prefixIcon;
  final String validatorValue;
  final TextEditingController controller;
  final void Function(String)? onChanged;

  const CustomTextFieldV3(
      {super.key,
        required this.labelText,
        required this.hintText,
        required this.prefixIcon,
        required this.validatorValue,
        required this.controller,
        required this.onChanged});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Align(
      alignment: Alignment.centerLeft,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
            child: SizedBox(
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: TextField(
                      controller: controller,
                      onChanged: onChanged,
                      onTapOutside: (even) {
                        FocusScope.of(context).unfocus();
                      },
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: Color(0xFFB7B7B7),
                            width: 0.7,
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: Color(0xFFB7B7B7),
                            width: 0.7,
                          ),
                          borderRadius: BorderRadius.circular(4),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(4.0),
                        ),
                        // labelText: labelText,
                        // labelStyle: const TextStyle(
                        //   color: Colors.grey,
                        //   fontSize: 14,
                        // ),
                        hintText: hintText,
                        hintStyle: const TextStyle(
                          color: Colors.grey,
                          fontSize: 14,
                        ),
                        prefixIcon: Icon(
                          prefixIcon,
                          color: Colors.blueAccent,
                          size: 20,
                        ),
                      ),
                    ),
                  ),
                  if (validatorValue
                      .isNotEmpty) // Kiểm tra xem validatorValue có rỗng không
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10, 5, 10, 0),
                      child: Text(
                        validatorValue,
                        textAlign: TextAlign.start,
                        style: const TextStyle(
                            decoration: TextDecoration.none,
                            fontSize: 11,
                            color: Colors.red,
                            fontWeight: FontWeight.normal),
                      ),
                    )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class CustomTextFieldV5 extends StatefulWidget {
  final TextEditingController controller;
  final String title;
  final IconData icon;
  final bool isRequired;
  final FocusNode? focusNode;

  CustomTextFieldV5({
    Key? key,
    required this.controller,
    required this.title,
    required this.isRequired,
    this.focusNode,
    required this.icon,
  }) : super(key: key);

  @override
  _CustomTextFieldV5State createState() => _CustomTextFieldV5State();
}
class CustomTextFieldV6 extends StatelessWidget {
  final TextEditingController controller;
  final String title;
  final bool isRequired;
  final Icon icon;
  final TextStyle textStyle;
  final String hintText;
  final Widget customIcon;

  CustomTextFieldV6({
    required this.controller,
    required this.title,
    required this.isRequired,
    required this.icon,
    this.textStyle = const TextStyle(fontSize: 16),
    this.hintText = '',
    this.customIcon = const Icon(Icons.text_fields),
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Tiêu đề sẽ luôn hiển thị trên ô nhập liệu
        Text(
          title,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w400,
            color: Colors.black,  // Màu chữ đen
          ),
        ),
        SizedBox(height: 5),  // Khoảng cách nhỏ giữa tiêu đề và ô nhập liệu
        SizedBox(
          width: 300,  // Chiều rộng mong muốn của ô nhập liệu
          height: 40,
          child: TextField(
            controller: controller,
            style: textStyle,  // Áp dụng cỡ chữ cho nội dung nhập
            decoration: InputDecoration(
              hintText: hintText,
              contentPadding: EdgeInsets.only(top: 12),  // Điều chỉnh vị trí văn bản// Văn bản gợi ý
              prefixIcon: icon,  // Icon từ bên ngoài
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(4),  // Bo tròn viền
                borderSide: BorderSide(
                  color: Colors.grey,  // Màu viền khi chưa focus
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(4),  // Bo tròn viền khi focus
                borderSide: BorderSide(
                  color: Colors.black,  // Màu viền khi focus vào ô
                  width: 1.0,  // Độ dày viền khi focus
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}




class _CustomTextFieldV5State extends State<CustomTextFieldV5> {
  bool isFocused = false;

  @override
  void initState() {
    super.initState();
    widget.focusNode?.addListener(() {
      setState(() {
        isFocused = widget.focusNode?.hasFocus ?? false;
      });
    });
  }

  @override
  void dispose() {
    widget.focusNode?.removeListener(() {});
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(widget.title,
                style:
                const TextStyle(fontWeight: FontWeight.bold, fontSize: 13)),
            widget.isRequired
                ? const Text(' (*)',
                style: TextStyle(
                    color: Colors.red,
                    fontWeight: FontWeight.bold,
                    fontSize: 13))
                : const SizedBox(),
          ],
        ),
        SizedBox(height: 5),
        Container(
          height: 45,
          decoration: BoxDecoration(
            color: Colors.grey.withOpacity(0.2),
            borderRadius: BorderRadius.circular(5),
            border: Border.all(
                color: isFocused ? Color(0xff16A085) : Colors.transparent,
                width: 1),
          ),
          child: TextField(
            onChanged: (value) {
              setState(() {});
            },
            onTap: () {
              setState(() {
                isFocused = true;
              });
            },
            onTapOutside: (event) {
              FocusScope.of(context).unfocus();
              setState(() {
                isFocused = false;
              });
            },
            decoration: InputDecoration(
                border: InputBorder.none,
                prefixIcon: Icon(widget.icon,
                    color: Colors.black.withOpacity(0.8), size: 20),
                suffixIcon: widget.controller.text != ""
                    ? IconButton(
                    onPressed: () {
                      setState(() {
                        widget.controller.text = "";
                      });
                    },
                    icon: Icon(Icons.close,
                        color: Colors.black.withOpacity(0.8), size: 20))
                    : null),
            focusNode: widget.focusNode,
            textAlignVertical: TextAlignVertical.center,
            style: const TextStyle(fontSize: 14),
            controller: widget.controller,
          ),
        ),
      ],
    );
  }
}