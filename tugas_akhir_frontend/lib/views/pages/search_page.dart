// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, sized_box_for_whitespace, prefer_const_literals_to_create_immutables

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:tugas_akhir_frontend/controllers/product_provider.dart';
import 'package:tugas_akhir_frontend/models/shoes_model.dart';
import 'package:tugas_akhir_frontend/views/pages/product_page.dart';
import 'package:tugas_akhir_frontend/views/shared/custom_field.dart';
import 'package:tugas_akhir_frontend/views/shared/reuseable_text.dart';

import '../../services/halper.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  TextEditingController search = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var productProvider = Provider.of<ProductNotifier>(context);
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        toolbarHeight: 100,
        backgroundColor: Colors.white,
        elevation: 0,
        title: CustomField(
          hintText: "Search for product",
          controller: search,
          onEditingComplete: () {
            setState(() {});
          },
          prefixIcon: GestureDetector(
            onTap: () {},
            child: Icon(
              Icons.camera_alt,
              color: Colors.grey,
            ),
          ),
          suffixIcon: GestureDetector(
            onTap: () {},
            child: Icon(
              Icons.search,
              color: Colors.grey,
            ),
          ),
        ),
      ),
      body: search.text.isEmpty
          ? Container(
              height: 600,
              padding: EdgeInsets.all(20),
              margin: EdgeInsets.only(right: 50.w),
              child: Image.asset("assets/images/Pose23.png"))
          : FutureBuilder<List<Shoes>>(
              future: Helper().search(search.text),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(
                    child: CircularProgressIndicator.adaptive(),
                  );
                } else if (snapshot.hasError) {
                  return Center(
                    child: reusableText(
                      text: "Error Retriving the data",
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  );
                } else if (snapshot.data!.isEmpty) {
                  return Center(
                    child: reusableText(
                      text: "Product not found",
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  );
                } else {
                  final shoes = snapshot.data;
                  return ListView.builder(
                    itemCount: shoes!.length,
                    itemBuilder: ((context, index) {
                      final shoe = shoes[index];
                      return GestureDetector(
                        onTap: () {
                          productProvider.shoesSizes = shoe.sizes;
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ProductPage(shoes: shoe),
                            ),
                          );
                        },
                        child: Padding(
                          padding: EdgeInsets.all(8),
                          child: ClipRRect(
                            borderRadius: BorderRadius.all(
                              Radius.circular(12),
                            ),
                            child: Container(
                              height: 90.h,
                              width: 325,
                              decoration: BoxDecoration(
                                color: Colors.grey.shade100,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.shade500,
                                    spreadRadius: 5,
                                    blurRadius: 0.3,
                                    offset: Offset(0, 1),
                                  ),
                                ],
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.all(12.h),
                                        child: CachedNetworkImage(
                                          imageUrl: shoe.imageUrl[0],
                                          height: 70.h,
                                          width: 70.h,
                                          fit: BoxFit.fill,
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(
                                          top: 12.h,
                                          left: 20.w,
                                        ),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            reusableText(
                                              text: shoe.name,
                                              style: TextStyle(
                                                fontSize: 16,
                                                color: Colors.black,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                            SizedBox(height: 5),
                                            reusableText(
                                              text: shoe.category,
                                              style: TextStyle(
                                                fontSize: 13,
                                                color: Colors.grey.shade600,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                            SizedBox(height: 5),
                                            reusableText(
                                              text: '\$${shoe.price}',
                                              style: TextStyle(
                                                fontSize: 13,
                                                color: Colors.grey.shade600,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    }),
                  );
                }
              },
            ),
    );
  }
}
