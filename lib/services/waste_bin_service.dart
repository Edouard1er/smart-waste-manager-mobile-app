import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:smart_waste_manager_mobile_app/models/waste_bin.dart';

class WasteBinService {
  final String baseUrl = "http://10.0.2.2:5000";

  Future<WasteBin> addWasteBin(Map<String, dynamic> data) async {
    final response = await http.post(
      Uri.parse('$baseUrl/waste-bins'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(data),
    );

    return _handleResponseAdd(response);
  }

  Future<List<WasteBin>> getAllWasteBins() async {
    final response = await http.get(Uri.parse('$baseUrl/waste-bins'));
    return _handleResponse(response);
  }

  Future<List<WasteBin>> getAllWasteBinsYZoneHisto() async {
    final response = await http.get(Uri.parse('$baseUrl/poubelles/historique/6584ad110086777823b884cc/2023-01-01'));
    return _handleResponse(response);
  }

  Future<WasteBin> getWasteBinById(int wasteBinId) async {
    final response = await http.get(Uri.parse('$baseUrl/waste-bins/$wasteBinId'));
    return _handleResponseAdd(response);
  }

  Future<WasteBin> updateWasteBin(int wasteBinId, Map<String, dynamic> data) async {
    final response = await http.put(
      Uri.parse('$baseUrl/waste-bins/$wasteBinId'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(data),
    );

    return _handleResponseAdd(response);
  }

  Future<void> deleteWasteBin(int wasteBinId) async {
    final response = await http.delete(Uri.parse('$baseUrl/waste-bins/$wasteBinId'));
    if (response.statusCode != 200) {
      throw Exception('Failed to delete waste bin');
    }
  }

  List<WasteBin> _handleResponse(http.Response response) {
    final List<dynamic> responseData = jsonDecode(response.body);

    if (response.statusCode == 200) {
      List<WasteBin> wasteBins = responseData.map((json) => WasteBin.fromJson(json)).toList();
      print("======================================");
      print(wasteBins);
      return wasteBins;
    } else {
      throw Exception('Failed to load data');
    }
  }

  WasteBin _handleResponseAdd(http.Response response) {
    final dynamic responseData = jsonDecode(response.body);

    if (response.statusCode == 200) {
      WasteBin wasteBin = WasteBin.fromJson(responseData);
      return wasteBin;
    } else {
      throw Exception('Failed to load data');
    }
  }
}
