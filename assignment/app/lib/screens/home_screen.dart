import 'package:app/models/favorite_item.dart';
import 'package:app/screens/add_item_screen.dart';
import 'package:app/widgets/favorite_item_card.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = "/homeScreen";

  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<FavoriteItem> items = [
    FavoriteItem(title: 'Pizza', description: 'Cheesy and delicious'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Favorite Things'),
      ),
      body: ListView(
        children: [...items.map((e) => FavoriteItemCard(item: e))],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          // Navigate to AddItemScreen and wait for the result
          final result = await Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const AddItemScreen()),
          );

          // Check if the result is a FavoriteItem and add it to the list
          if (result is FavoriteItem) {
            setState(() {
              items.add(result);
            });
          }
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
