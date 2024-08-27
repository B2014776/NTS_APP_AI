class DieuKienThoiTiet {
  final int id;
  final String nhietDoToiThieu;
  final String nhietDoToiDa;
  final String doAmToiThieu;
  final String doAmToiDa;
  final String anhSang;

  DieuKienThoiTiet({
    required this.id,
    required this.nhietDoToiThieu,
    required this.nhietDoToiDa,
    required this.doAmToiThieu,
    required this.doAmToiDa,
    required this.anhSang,
  });

  factory DieuKienThoiTiet.fromJson(Map<String, dynamic> json) {
    return DieuKienThoiTiet(
      id: json['id'],
      nhietDoToiThieu: json['nhietDoToiThieu'],
      nhietDoToiDa: json['nhietDoToiDa'],
      doAmToiThieu: json['doAmToiThieu'],
      doAmToiDa: json['doAmToiDa'],
      anhSang: json['anhSang'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'nhietDoToiThieu': nhietDoToiThieu,
      'nhietDoToiDa': nhietDoToiDa,
      'doAmToiThieu': doAmToiThieu,
      'doAmToiDa': doAmToiDa,
      'anhSang': anhSang,
    };
  }

  DieuKienThoiTiet copyWith({
    int? id,
    String? nhietDoToiThieu,
    String? nhietDoToiDa,
    String? doAmToiThieu,
    String? doAmToiDa,
    String? anhSang,
  }) {
    return DieuKienThoiTiet(
      id: id ?? this.id,
      nhietDoToiThieu: nhietDoToiThieu ?? this.nhietDoToiThieu,
      nhietDoToiDa: nhietDoToiDa ?? this.nhietDoToiDa,
      doAmToiThieu: doAmToiThieu ?? this.doAmToiThieu,
      doAmToiDa: doAmToiDa ?? this.doAmToiDa,
      anhSang: anhSang ?? this.anhSang,
    );
  }
}
