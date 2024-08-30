class TinTuc {
  final String id;
  final String tieuDe;
  final String noiDung;
  final String img;
  final String danhMucID;

  TinTuc({
    required this.id,
    required this.tieuDe,
    required this.noiDung,
    required this.img,
    required this.danhMucID,
  });

  // Method to convert a TinTuc object to a JSON map
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'tieuDe': tieuDe,
      'noiDung': noiDung,
      'img': img,
      'danhMucID': danhMucID,
    };
  }

  // Method to create a TinTuc object from a JSON map
  factory TinTuc.fromJson(Map<String, dynamic> json) {
    return TinTuc(
      id: json['id'],
      tieuDe: json['tieuDe'],
      noiDung: json['noiDung'],
      img: json['img'],
      danhMucID: json['danhMucID'],
    );
  }

  // Override toString method for better debugging
  @override
  String toString() =>
      'TinTuc(id: $id, tieuDe: $tieuDe, noiDung: $noiDung, img: $img, danhMucID: $danhMucID)';

  // Override equality operator
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is TinTuc &&
        other.id == id &&
        other.tieuDe == tieuDe &&
        other.noiDung == noiDung &&
        other.img == img &&
        other.danhMucID == danhMucID;
  }

  // Override hashCode for better performance in collections
  @override
  int get hashCode =>
      id.hashCode ^ tieuDe.hashCode ^ noiDung.hashCode ^ img.hashCode ^ danhMucID.hashCode;

  // Method to copy TinTuc object with potential modifications
  TinTuc copyWith({
    String? id,
    String? tieuDe,
    String? noiDung,
    String? img,
    String? danhMucID,
  }) {
    return TinTuc(
      id: id ?? this.id,
      tieuDe: tieuDe ?? this.tieuDe,
      noiDung: noiDung ?? this.noiDung,
      img: img ?? this.img,
      danhMucID: danhMucID ?? this.danhMucID,
    );
  }
}
