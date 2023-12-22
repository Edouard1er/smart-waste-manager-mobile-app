import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  final String baseUrl;

  ApiService(this.baseUrl);

  Future<Map<String, dynamic>> addHistorique(Map<String, dynamic> data) async {
    final response = await http.post(
      Uri.parse('$baseUrl/historique'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(data),
    );

    return _handleResponse(response);
  }

  // Ajoutez d'autres méthodes pour les autres endpoints de votre API

  Map<String, dynamic> _handleResponse(http.Response response) {
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to load data');
    }
  }
}
