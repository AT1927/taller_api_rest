import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:app_flutter_rest/config/constants.dart';
import 'package:app_flutter_rest/models/phone.dart';

class ApiService {
  Future<List<Phone>> getPhones() async {
    try {
      final response = await http.get(
        Uri.parse('${AppConstants.baseUrl}${AppConstants.phonesEndpoint}'),
      );

      if (response.statusCode == 200) {
        List<dynamic> data = json.decode(response.body);
        return data.map((json) => Phone.fromJson(json)).toList();
      } else {
        throw Exception('Failed to load phones: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error fetching phones: $e');
    }
  }

  Future<Phone> getPhoneById(int id) async {
    try {
      final response = await http.get(
        Uri.parse('${AppConstants.baseUrl}${AppConstants.phonesEndpoint}/$id'),
      );

      if (response.statusCode == 200) {
        return Phone.fromJson(json.decode(response.body));
      } else {
        throw Exception('Failed to load phone: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error fetching phone: $e');
    }
  }
}
