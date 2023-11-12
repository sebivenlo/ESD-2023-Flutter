import 'package:app/models/favorite_item.dart';
import 'package:app/screens/details_screen.dart';
import 'package:flutter/material.dart';

class FavoriteItemCard extends StatelessWidget {
  final FavoriteItem item;

  const FavoriteItemCard({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(
          context,
          DetailsScreen.routeName,
          arguments: item,
        );
      },
      child: Container(
        height: 50,
        decoration: BoxDecoration(
            color: Theme.of(context).cardColor,
            border: Border.all(color: Colors.black12)),
        child: Row(
          children: [
            Expanded(
                child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 10),
                    child: Text(item.title,
                        style: const TextStyle(fontSize: 25)))),
            const Icon(Icons.arrow_right)
          ],
        ),
      ),
    );
  }
}
