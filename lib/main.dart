import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'viewmodels/restaurant_viewmodel.dart';
import 'views/restaurant_list_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => RestaurantViewModel())],
      child: MaterialApp(
        title: 'Restaurant App',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepOrange),
          useMaterial3: true,
        ),
        home: const RestaurantListView(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
