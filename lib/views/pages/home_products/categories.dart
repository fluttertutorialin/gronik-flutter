import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import '../../widgets/gronik_layout.dart';
import '../../../controller/categories/categories_controller.dart';
import 'entrypoint.dart';

class AllCategories extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GronikLayoutTwo(
        appBarTitle: 'Categories',
        /* <---- Content ----> */
        content: Expanded(
          child: Column(
            children: [
              Expanded(
                child: Container(
                  margin: EdgeInsets.all(16),
                  padding: EdgeInsets.only(top: 16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: GridView.count(
                    crossAxisCount: 3,
                    children: CategoriesController.categories,
                    // crossAxisSpacing: 20,
                    mainAxisSpacing: 20,
                  ),
                ),
              ),
            ],
          ),
        ),
        /* <---- Bottom AppBar ----> */
        bottomAppBar: GronikBottomBar(),
      ),
    );
  }
}
