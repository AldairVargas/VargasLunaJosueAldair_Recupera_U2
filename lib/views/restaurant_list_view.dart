import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../viewmodels/restaurant_viewmodel.dart';
import 'restaurant_detail_view.dart';

class RestaurantListView extends StatefulWidget {
  const RestaurantListView({super.key});

  @override
  State<RestaurantListView> createState() => _RestaurantListViewState();
}

class _RestaurantListViewState extends State<RestaurantListView> {
  @override
  void initState() {
    super.initState();
    // Fetch data when the widget is initialized
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<RestaurantViewModel>(
        context,
        listen: false,
      ).fetchRestaurants();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Guía de Restaurantes')),
      body: Consumer<RestaurantViewModel>(
        builder: (context, viewModel, child) {
          if (viewModel.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (viewModel.errorMessage.isNotEmpty) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.error, color: Colors.red, size: 60),
                  const SizedBox(height: 16),
                  Text(
                    'Error: ${viewModel.errorMessage}',
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: viewModel.fetchRestaurants,
                    child: const Text('Reintentar'),
                  ),
                ],
              ),
            );
          }

          if (viewModel.restaurants.isEmpty) {
            return const Center(
              child: Text('No hay restaurantes disponibles.'),
            );
          }

          return ListView.builder(
            itemCount: viewModel.restaurants.length,
            itemBuilder: (context, index) {
              final restaurant = viewModel.restaurants[index];
              return Card(
                margin: const EdgeInsets.all(8.0),
                child: ListTile(
                  leading: ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: Image.network(
                      restaurant.imageUrl,
                      width: 60,
                      height: 60,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) =>
                          const Icon(Icons.restaurant, size: 60),
                    ),
                  ),
                  title: Text(restaurant.name),
                  subtitle: Text(restaurant.cuisine),
                  trailing: const Icon(Icons.arrow_forward_ios),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            RestaurantDetailView(restaurant: restaurant),
                      ),
                    );
                  },
                ),
              );
            },
          );
        },
      ),
    );
  }
}
