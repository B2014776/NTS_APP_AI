import 'package:dio/dio.dart';

class ImageUploadController {
  final Dio _dio = Dio();

  Future<void> sendImageToAPI(String imagePath) async {
    try {
      // Đọc file ảnh và tạo FormData
      FormData formData = FormData.fromMap({
        'image': await MultipartFile.fromFile(imagePath, filename: 'uploaded_image.jpg'),
      });

      // Gửi request POST đến API
      Response response = await _dio.post(
        'https://api-ai-1-6b81.onrender.com/predict/',
        data: formData,
        options: Options(
          headers: {'Content-Type': 'multipart/form-data'},
        ),
      );

      if (response.statusCode == 200) {
        print('Upload successful: ${response.data}');
        // Xử lý logic khi upload thành công, ví dụ điều hướng trang
      } else {
        print('Failed to upload image: ${response.statusMessage}');
      }
    } catch (e) {
      print('Error uploading image: $e');
    }
  }
}
