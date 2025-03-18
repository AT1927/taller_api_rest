import 'dart:convert';

class Phone {
  final String id;
  final String name;
  final PhoneData? data;

  Phone({required this.id, required this.name, this.data});

  factory Phone.fromJson(Map<String, dynamic> json) {
    return Phone(
      id: json['id'] ?? '',
      name: json['name'] ?? '',
      data: json['data'] != null ? PhoneData.fromJson(json['data']) : null,
    );
  }
}

class PhoneData {
  final String color;
  final String capacity;

  PhoneData({required this.color, required this.capacity});

  factory PhoneData.fromJson(Map<String, dynamic> json) {
    return PhoneData(
      color: json['color'] ?? '',
      capacity: json['capacity'] ?? '',
    );
  }
}
