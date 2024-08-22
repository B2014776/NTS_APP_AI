class Medicine {
  final String name;
  final String information;
  final String usage;

  Medicine({
    required this.name,
    required this.information,
    required this.usage,
  });

  factory Medicine.fromJson(Map<String, dynamic> json) {
    return Medicine(
      name: json['name'],
      information: json['information'],
      usage: json['usage'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'information': information,
      'usage': usage,
    };
  }

  @override
  String toString() {
    return 'Medicine(name: $name, information: $information, usage: $usage)';
  }
}
