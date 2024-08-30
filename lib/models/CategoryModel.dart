class DanhMuc {
  final String id;
  final String tenDanhMuc;

  DanhMuc({
    required this.id,
    required this.tenDanhMuc,
  });

  // Method to convert a DanhMuc object to a JSON map
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'tenDanhMuc': tenDanhMuc,
    };
  }

  // Method to create a DanhMuc object from a JSON map
  factory DanhMuc.fromJson(Map<String, dynamic> json) {
    return DanhMuc(
      id: json['id'],
      tenDanhMuc: json['tenDanhMuc'],
    );
  }

  // Override toString method for better debugging
  @override
  String toString() => 'DanhMuc(id: $id, tenDanhMuc: $tenDanhMuc)';

  // Override equality operator
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is DanhMuc && other.id == id && other.tenDanhMuc == tenDanhMuc;
  }

  // Override hashCode for better performance in collections
  @override
  int get hashCode => id.hashCode ^ tenDanhMuc.hashCode;

  // Method to copy DanhMuc object with potential modifications
  DanhMuc copyWith({
    String? id,
    String? tenDanhMuc,
  }) {
    return DanhMuc(
      id: id ?? this.id,
      tenDanhMuc: tenDanhMuc ?? this.tenDanhMuc,
    );
  }
}
