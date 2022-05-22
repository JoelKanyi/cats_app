import 'package:cats_app/src/controller/cats_controller.dart';
import 'package:cats_app/src/widgets/cats_tile.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  final CatsController catsController = Get.put(CatsController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: const Text(
          'Cats App',
          style: TextStyle(color: Colors.black),
        ),
        elevation: 0,
        actions: const [Icon(Icons.person)],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8),
            child: Row(
              children: [
                const Expanded(
                  child: Text(
                    "Find a new friend",
                    style: TextStyle(
                        fontFamily: "avenir",
                        fontSize: 22,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              width: double.infinity,
              child: TextField(
                decoration: InputDecoration(
                    hintText: "Search...",
                    prefixIcon: Icon(Icons.search),
                    fillColor: Color.fromARGB(255, 189, 181, 181),
                    filled: true),
              ),
            ),
          ),
          Expanded(
            child: Obx(
              () {
                if (catsController.isLoading.value) {
                  return Center(child: CircularProgressIndicator());
                } else
                  return StaggeredGridView.countBuilder(
                    crossAxisCount: 2,
                    itemCount: catsController.catsList.length,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16,
                    itemBuilder: (context, index) {
                      return CatsTile(catsController.catsList[index]);
                    },
                    staggeredTileBuilder: (index) => StaggeredTile.fit(1),
                  );
              },
            ),
          ),
        ],
      ),
    );
  }
}
