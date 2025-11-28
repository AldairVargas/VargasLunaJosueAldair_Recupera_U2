import 'package:flutter/foundation.dart';
import '../models/restaurant.dart';
import '../services/restaurant_service.dart';

class RestaurantViewModel extends ChangeNotifier {
  final RestaurantService _restaurantService = RestaurantService();

  List<Restaurant> _restaurants = [];
  bool _isLoading = false;
  String _errorMessage = '';

  List<Restaurant> get restaurants => _restaurants;
  bool get isLoading => _isLoading;
  String get errorMessage => _errorMessage;

  Future<void> fetchRestaurants() async {
    _isLoading = true;
    _errorMessage = '';
    notifyListeners();

    try {
      _restaurants = await _restaurantService.getRestaurants();
    } catch (e) {
      _errorMessage = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
