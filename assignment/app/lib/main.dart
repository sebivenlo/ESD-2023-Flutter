import 'package:flutter/material.dart';
import 'screens/home_screen.dart';
import 'screens/details_screen.dart';
import 'screens/add_item_screen.dart';
import 'models/favorite_item.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Favorite Things',
      theme: ThemeData(primarySwatch: Colors.deepPurple),
      home: const HomeScreen(),
      // Static routes
      routes: {
        HomeScreen.routeName: (context) => const HomeScreen(),
        AddItemScreen.routeName: (context) => const AddItemScreen(),
      },
      // Routes with args
      onGenerateRoute: (settings) {
        if (settings.name == DetailsScreen.routeName) {
          final args = settings.arguments as FavoriteItem;
          return MaterialPageRoute(
            builder: (context) {
              return DetailsScreen(item: args);
            },
          );
        }
        assert(false, 'Need to implement ${settings.name}');
        return null;
      },
    );
  }
}
