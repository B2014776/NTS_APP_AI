class ThuocTriBenh {
  final String tenThuoc;
  final String thongTin;
  final String cachSuDung;
  final String img;

  ThuocTriBenh({
    required this.tenThuoc,
    required this.thongTin,
    required this.cachSuDung,
    required this.img
  });

  factory ThuocTriBenh.fromJson(Map<String, dynamic> json) {
    return ThuocTriBenh(
      tenThuoc: json['tenThuoc'],
      thongTin: json['thongTin'],
      cachSuDung: json['cachSuDung'],
      img: json['img'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'tenThuoc': tenThuoc,
      'thongTin': thongTin,
      'cachSuDung': cachSuDung,
      'img': img,
    };
  }

  @override
  String toString() {
    return 'ThuocTriBenh(tenThuoc: $tenThuoc, thongTin: $thongTin, cachSuDung: $cachSuDung, img: $img)';
  }
}
