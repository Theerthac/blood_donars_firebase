class DonorsModel {
  String? id;
  String? name;
  String? phone;
  String? group;

  DonorsModel({
    required this.id,
    required this.name,
    required this.phone,
    required this.group,
  });

  factory DonorsModel.fromMap(Map<String, dynamic> map, String id) {
    return DonorsModel(
      id: id,
      name: map['name'] ?? '',
      phone: map['phone'] ?? '',
      group: map['group'] ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'phone': phone,
      'group': group,
    };
  }
}
