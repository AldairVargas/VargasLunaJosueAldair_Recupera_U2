import 'package:flutter/material.dart';
import '../models/restaurant.dart';
import '../widgets/schedule_toggle_widget.dart';
import '../widgets/favorite_button.dart';

class RestaurantDetailView extends StatelessWidget {
  final Restaurant restaurant;

  const RestaurantDetailView({super.key, required this.restaurant});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(restaurant.name),
        actions: const [FavoriteButton()],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              restaurant.imageUrl,
              width: double.infinity,
              height: 250,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) => Container(
                height: 250,
                color: Colors.grey[300],
                child: const Center(
                  child: Icon(Icons.restaurant, size: 100, color: Colors.grey),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        restaurant.cuisine,
                        style: Theme.of(context).textTheme.titleMedium
                            ?.copyWith(
                              color: Colors.grey[600],
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                      Row(
                        children: [
                          const Icon(Icons.star, color: Colors.amber),
                          Text(
                            restaurant.rating.toString(),
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Dirección:',
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                  Text(restaurant.address),
                  const SizedBox(height: 16),
                  Text(
                    'Descripción:',
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                  Text(restaurant.description),
                  const SizedBox(height: 24),
                  ScheduleToggleWidget(schedule: restaurant.schedule),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
