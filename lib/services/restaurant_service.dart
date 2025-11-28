import 'dart:convert';
import 'package:flutter/services.dart';
import '../models/restaurant.dart';

class RestaurantService {
  Future<List<Restaurant>> getRestaurants() async {
    try {
      final String response = await rootBundle.loadString(
        '/Users/aldairjsx/Downloads/datos.pdf',
      );
      final List<dynamic> data = json.decode(response);
      return data.map((json) => Restaurant.fromJson(json)).toList();
    } catch (e) {
      throw Exception('Error al cargar los restaurantes: $e');
    }
  }
}
