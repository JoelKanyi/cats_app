import 'package:cached_network_image/cached_network_image.dart';
import 'package:cats_app/src/model/cat_model.dart';
import 'package:flutter/material.dart';

class CatsTile extends StatelessWidget {
  final Cat cat;

  CatsTile(this.cat);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(0),
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  height: 180,
                  width: double.infinity,
                  clipBehavior: Clip.antiAlias,
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(4)),
                  child: CachedNetworkImage(
                    imageUrl: cat.image!.url!,
                    fit: BoxFit.cover,
                  ),
                )
              ],
            ),

            const SizedBox(height: 8),
            Text(
              cat.name!,
              maxLines: 2,
              style: const TextStyle(overflow: TextOverflow.ellipsis),
            ),
            const SizedBox(height: 8),

            // Todo: Add more later
          ],
        ),
      ),
    );
  }
}
