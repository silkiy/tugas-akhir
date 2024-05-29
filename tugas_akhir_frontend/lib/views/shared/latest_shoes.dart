import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:provider/provider.dart';
import 'package:tugas_akhir_frontend/models/shoes_model.dart';

import '../../controllers/product_provider.dart';
import '../pages/product_page.dart';
import 'stagger_tile.dart';

class LatestShoes extends StatelessWidget {
  const LatestShoes({
    Key? key,
    required this.shoesFuture,
  }) : super(key: key);

  final Future<List<Shoes>> shoesFuture;

  @override
  Widget build(BuildContext context) {
    var productNotifier = Provider.of<ProductNotifier>(context);

    return FutureBuilder<List<Shoes>>(
      future: shoesFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator.adaptive();
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else if (snapshot.hasData) {
          final List<Shoes>? shoesList = snapshot.data;
          if (shoesList == null || shoesList.isEmpty) {
            return const Text('No shoes found');
          }
          return StaggeredGridView.countBuilder(
            padding: EdgeInsets.zero,
            crossAxisCount: 2,
            crossAxisSpacing: 20,
            mainAxisSpacing: 16,
            itemCount: shoesList.length,
            scrollDirection: Axis.vertical,
            staggeredTileBuilder: (index) => StaggeredTile.extent(
              (index % 2 == 0) ? 1 : 1,
              (index % 4 == 1 || index % 4 == 3)
                  ? MediaQuery.of(context).size.height * 0.35
                  : MediaQuery.of(context).size.height * 0.3,
            ),
            itemBuilder: (context, index) {
              final Shoes shoes = shoesList[index];
              return GestureDetector(
                onTap: (){
                  productNotifier.shoesSizes = shoes.sizes;
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ProductPage(
                        shoes: shoes,
                      ),
                    ),
                  );
                },
                child: StaggerTile(
                  imageUrl: shoes.imageUrl[0],
                  name: shoes.name,
                  price: "\$${shoes.price}",
                ),
              );
            },
          );
        } else {
          return const Text('No data available');
        }
      },
    );
  }
}
