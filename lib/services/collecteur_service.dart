import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:smart_waste_manager_mobile_app/models/collecteur.dart';

class CollecteurService {
  final String baseUrl = "http://10.0.2.2:5000";



  Future<Collecteur> addCollecteur(Map<String, dynamic> data) async {
    final response = await http.post(
      Uri.parse('$baseUrl/collecteurs'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(data),
    );

    return _handleResponseAdd(response);
  }

  Future<List<Collecteur>> getAllCollecteurs()  async {
    final response = await http.get(Uri.parse('http://10.0.2.2:5000/collecteurs'));
    return _handleResponse(response);
  }

  Future<List<Collecteur>> getCollecteurById(String collecteurId) async {
    final response = await http.get(Uri.parse('$baseUrl/collecteurs/$collecteurId'));
    return _handleResponse(response);
  }

  Future<List<Collecteur>> updateCollecteur(String collecteurId, Map<String, dynamic> data) async {
    final response = await http.put(
      Uri.parse('$baseUrl/collecteurs/$collecteurId'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(data),
    );

    return _handleResponse(response);
  }

  Future<void> deleteCollecteur(String collecteurId) async {
    final response = await http.delete(Uri.parse('$baseUrl/collecteurs/$collecteurId'));
    if (response.statusCode != 200) {
      throw Exception('Failed to delete collecteur');
    }
  }

  List<Collecteur> _handleResponse(http.Response response) {
    final List<dynamic> responseData = jsonDecode(response.body);

    if (response.statusCode == 200) {
      List<Collecteur> collecteurs = responseData.map((json) => Collecteur.fromJson(json)).toList();
      return collecteurs;
    } else {
      throw Exception('Failed to load data');
    }
  }

  Collecteur _handleResponseAdd(http.Response response) {
    final dynamic responseData = jsonDecode(response.body);

    if (response.statusCode == 200) {
      Collecteur collecteur = Collecteur.fromJson(responseData);
      return collecteur;
    } else {
      throw Exception('Failed to load data');
    }
  }



}
