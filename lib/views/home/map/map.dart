// import 'package:flutter/material.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';

// class DiseaseMapPage extends StatefulWidget {
//   @override
//   _DiseaseMapPageState createState() => _DiseaseMapPageState();
// }

// class _DiseaseMapPageState extends State<DiseaseMapPage> {
//   late GoogleMapController mapController;

//   // Dữ liệu ví dụ cho các vùng bệnh
//   final Map<LatLng, String> diseaseRegions = {
//     LatLng(10.762622, 106.660172): 'Heavy',
//     LatLng(10.782622, 106.680172): 'Light',
//     LatLng(10.752622, 106.690172): 'Moderate',
//   };

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Disease Map'),
//       ),
//       body: GoogleMap(
//         onMapCreated: (GoogleMapController controller) {
//           mapController = controller;
//           _setInitialPosition();
//         },
//         initialCameraPosition: CameraPosition(
//           target: LatLng(10.762622, 106.660172), // Vị trí trung tâm của bản đồ
//           zoom: 12.0,
//         ),
//         markers: _createMarkers(),
//       ),
//     );
//   }

//   // Đặt vị trí ban đầu cho bản đồ
//   void _setInitialPosition() {
//     mapController.animateCamera(
//       CameraUpdate.newCameraPosition(
//         CameraPosition(
//           target: LatLng(10.762622, 106.660172),
//           zoom: 12.0,
//         ),
//       ),
//     );
//   }

//   // Tạo các marker trên bản đồ
//   Set<Marker> _createMarkers() {
//     return diseaseRegions.entries.map((entry) {
//       final LatLng position = entry.key;
//       final String severity = entry.value;
//       return Marker(
//         markerId: MarkerId(position.toString()),
//         position: position,
//         infoWindow: InfoWindow(
//           title: 'Disease Severity',
//           snippet: severity,
//         ),
//         icon: _getMarkerIcon(severity),
//       );
//     }).toSet();
//   }

//   // Chọn biểu tượng marker dựa trên mức độ bệnh
//   BitmapDescriptor _getMarkerIcon(String severity) {
//     switch (severity) {
//       case 'Heavy':
//         return BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed);
//       case 'Moderate':
//         return BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueOrange);
//       case 'Light':
//         return BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueYellow);
//       default:
//         return BitmapDescriptor.defaultMarker;
//     }
//   }
// }