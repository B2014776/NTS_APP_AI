// import 'package:flutter/material.dart';
// import 'package:fluttertoast/fluttertoast.dart';
//
// class ToastHelper {
//   static final FToast fToast = FToast();
//
//   // Khởi tạo FToast với context toàn cục
//   static void init(BuildContext context) {
//     fToast.init(context);
//   }
//
//   static void showSuccessToast(String message, {Icon? icon}) {
//     _showToast(
//       message: message,
//       backgroundColor: Colors.greenAccent,
//       textColor: Colors.white,
//       icon: icon ?? const Icon(Icons.check_circle, color: Colors.white),
//     );
//   }
//
//   // Hiển thị thông báo cảnh báo
//   static void showWarningToast(String message, {Icon? icon}) {
//     _showToast(
//       message: message,
//       backgroundColor: Colors.orangeAccent,
//       textColor: Colors.black,
//       icon: icon ?? const Icon(Icons.warning, color: Colors.black),
//     );
//   }
//
//   // Hiển thị thông báo lỗi
//   static void showErrorToast(String message, {Icon? icon}) {
//     _showToast(
//       message: message,
//       backgroundColor: Colors.redAccent,
//       textColor: Colors.white,
//       icon: icon ?? const Icon(Icons.error, color: Colors.white),
//     );
//   }
//
//   // Hiển thị thông báo tùy chỉnh
//   static void showCustomToast(
//     String message, {
//     Color backgroundColor = Colors.blueAccent,
//     Color textColor = Colors.white,
//     Icon? icon,
//     ToastGravity gravity = ToastGravity.BOTTOM,
//     Duration duration = const Duration(seconds: 2),
//     double? left,
//     double? top,
//     double? right,
//     double? bottom,
//   }) {
//     Widget toast = Container(
//       padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(25.0),
//         color: backgroundColor,
//       ),
//       child: Row(
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           icon ?? Icon(Icons.info, color: textColor),
//           const SizedBox(width: 12.0),
//           Text(message, style: TextStyle(color: textColor)),
//         ],
//       ),
//     );
//
//     fToast.showToast(
//       child: toast,
//       toastDuration: duration,
//       gravity: gravity,
//       positionedToastBuilder: (context, child) {
//         return Positioned(
//           left: left,
//           top: top,
//           right: right,
//           bottom: bottom,
//           child: child,
//         );
//       },
//     );
//   }
//
//   // Hàm chung để hiển thị toast
//   static void _showToast({
//     required String message,
//     required Color backgroundColor,
//     required Color textColor,
//     required Icon icon,
//     Duration duration = const Duration(seconds: 2),
//   }) {
//     Widget toast = Container(
//       padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(25.0),
//         color: backgroundColor,
//       ),
//       child: Row(
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           icon,
//           const SizedBox(width: 12.0),
//           Text(message, style: TextStyle(color: textColor)),
//         ],
//       ),
//     );
//
//     fToast.showToast(
//       child: toast,
//       toastDuration: duration,
//       gravity: ToastGravity.BOTTOM,
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class ToastHelper {
  static final FToast fToast = FToast();

  // Khởi tạo FToast với context toàn cục
  static void init(BuildContext context) {
    fToast.init(context);
  }

  // Hiển thị thông báo thành công
  static void showSuccessToast(String message, {Icon? icon}) {
    _showToast(
      message: message,
      backgroundColor: Colors.greenAccent,
      textColor: Colors.white,
      icon: icon ?? Icon(Icons.check_circle, color: Colors.white),
    );
  }

  // Hiển thị thông báo cảnh báo
  static void showWarningToast(String message, {Icon? icon}) {
    _showToast(
      message: message,
      backgroundColor: Colors.orangeAccent,
      textColor: Colors.black,
      icon: icon ?? Icon(Icons.warning, color: Colors.black),
    );
  }

  // Hiển thị thông báo lỗi
  static void showErrorToast(String message, {Icon? icon}) {
    _showToast(
      message: message,
      backgroundColor: Colors.redAccent,
      textColor: Colors.white,
      icon: icon ?? Icon(Icons.error, color: Colors.white),
    );
  }

  // Hiển thị thông báo tùy chỉnh
  static void showCustomToast(
      String message, {
        Color backgroundColor = Colors.blueAccent,
        Color textColor = Colors.white,
        Icon? icon,
        ToastGravity gravity = ToastGravity.BOTTOM,
        Duration duration = const Duration(seconds: 2),
        double? left,
        double? top,
        double? right,
        double? bottom,
      }) {
    Widget toast = Container(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25.0),
        color: backgroundColor,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          icon ?? Icon(Icons.info, color: textColor),
          const SizedBox(width: 12.0),
          Text(message, style: TextStyle(color: textColor)),
        ],
      ),
    );

    fToast.showToast(
      child: toast,
      toastDuration: duration,
      gravity: gravity,
      positionedToastBuilder: (context, child) {
        return Positioned(
          child: child,
          left: left,
          top: top,
          right: right,
          bottom: bottom,
        );
      },
    );
  }

  // Hiển thị thông báo loading
  static void showLoadingToast({
    String message = 'Loading...',
    Duration duration = const Duration(seconds: 2),
    Color backgroundColor = Colors.black54,
    Color textColor = Colors.white,
  }) {
    Widget toast = Container(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25.0),
        color: backgroundColor,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          LoadingAnimationWidget.fourRotatingDots(
            color: textColor,
            size: 24,
          ),
          const SizedBox(width: 12.0),
          Text(message, style: TextStyle(color: textColor)),
        ],
      ),
    );

    fToast.showToast(
      child: toast,
      toastDuration: duration,
      gravity: ToastGravity.BOTTOM,
    );
  }

  // Hàm chung để hiển thị toast
  static void _showToast({
    required String message,
    required Color backgroundColor,
    required Color textColor,
    required Icon icon,
    Duration duration = const Duration(seconds: 2),
  }) {
    Widget toast = Container(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25.0),
        color: backgroundColor,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          icon,
          const SizedBox(width: 12.0),
          Text(message, style: TextStyle(color: textColor)),
        ],
      ),
    );
    fToast.showToast(
      child: toast,
      toastDuration: duration,
      gravity: ToastGravity.BOTTOM,
    );
  }
}
