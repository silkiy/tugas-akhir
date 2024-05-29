// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:provider/provider.dart';
import 'package:tugas_akhir_frontend/views/shared/new_shoes.dart';
import 'package:tugas_akhir_frontend/views/shared/product_card.dart';

import '../../controllers/product_provider.dart';
import '../../models/shoes_model.dart';
import '../pages/product_by_cat.dart';
import '../pages/product_page.dart';

class HomeWidget extends StatelessWidget {
  const HomeWidget({
    super.key,
    required Future<List<Shoes>> nike,
    required this.tabIndex,
  }) : _nike = nike;

  final Future<List<Shoes>> _nike;
  final int tabIndex;

  @override
  Widget build(BuildContext context) {
    var productNotifier = Provider.of<ProductNotifier>(context);
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.400,
            child: FutureBuilder<List<Shoes>>(
              future: _nike,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(
                    child: CircularProgressIndicator.adaptive(),
                  );
                } else if (snapshot.hasError) {
                  return Text("Error ${snapshot.error}");
                } else {
                  final nike = snapshot.data;
                  return ListView.builder(
                    itemCount: nike!.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      final shoes = snapshot.data![index];
                      return GestureDetector(
                        onTap: () {
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
                        child: ProductCard(
                          price: "\$${shoes.price}",
                          category: shoes.category,
                          id: shoes.id,
                          name: shoes.name,
                          image: shoes.imageUrl[0],
                        ),
                      );
                    },
                  );
                }
              },
            ),
          ),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(12, 10, 12, 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Latest Shoes",
                      style: TextStyle(
                        fontSize: 24,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ProductByCat(
                              // image: shoes.imageUrl[0],
                              tabIndex: tabIndex,
                            ),
                          ),
                        );
                      },
                      child: Row(
                        children: [
                          Text(
                            "Show All",
                            style: TextStyle(
                              fontSize: 22,
                              color: Colors.black,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const Icon(
                            AntDesign.caretright,
                            size: 20,
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.13,
            child: FutureBuilder<List<Shoes>>(
              future: _nike,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(
                    child: CircularProgressIndicator.adaptive(),
                  );
                } else if (snapshot.hasError) {
                  return Text("Error ${snapshot.error}");
                } else {
                  final nike = snapshot.data;
                  return ListView.builder(
                    itemCount: nike!.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      final shoes = snapshot.data![index];
                      return GestureDetector(
                        onTap: () {
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
                        child: NewShoes(
                          image: shoes.imageUrl[0],
                        ),
                      );
                    },
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
