// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:tugas_akhir_frontend/models/shoes_model.dart';

import '../../services/halper.dart';
import '../shared/appstyle.dart';
import '../shared/category_btn.dart';
import '../shared/custom_spacer.dart';
import '../shared/latest_shoes.dart';

class ProductByCat extends StatefulWidget {
  const ProductByCat({
    super.key,
    required this.tabIndex,
    // required this.image,
  });
  // final String image;

  final int tabIndex;

  @override
  State<ProductByCat> createState() => _ProductByCatState();
}

class _ProductByCatState extends State<ProductByCat>
    with TickerProviderStateMixin {
  late final TabController _tabController = TabController(
    length: 7,
    vsync: this,
  );

  late Future<List<Shoes>> _nike;
  late Future<List<Shoes>> _adidas;
  late Future<List<Shoes>> _puma;
  late Future<List<Shoes>> _converse;
  late Future<List<Shoes>> _ortuseight;
  late Future<List<Shoes>> _newBalance;
  late Future<List<Shoes>> _reebok;

  void getNike() {
    _nike = Helper().getNikeShoes();
  }

  void getAdidas() {
    _adidas = Helper().getAdidasShoes();
  }

  void getPuma() {
    _puma = Helper().getPumaShoes();
  }

  void getConverse() {
    _converse = Helper().getConverseShoes();
  }

  void getOrtuseight() {
    _ortuseight = Helper().getOrtuseightShoes();
  }

  void getNewBalance() {
    _newBalance = Helper().getNewBalanceShoes();
  }

  void getReebok() {
    _reebok = Helper().getReebokShoes();
  }

  @override
  void initState() {
    super.initState();
    _tabController.animateTo(widget.tabIndex, curve: Curves.easeIn);
    getNike();
    getAdidas();
    getPuma();
    getConverse();
    getOrtuseight();
    getNewBalance();
    getReebok();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: Stack(
          children: [
            Container(
              padding: const EdgeInsets.fromLTRB(16, 45, 0, 0),
              height: MediaQuery.of(context).size.height * 0.4,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(""),
                  fit: BoxFit.fill,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(6, 12, 16, 18),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: const Icon(
                            AntDesign.close,
                            color: Colors.black,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            filter();
                          },
                          child: const Icon(
                            FontAwesome.sliders,
                            color: Colors.black,
                          ),
                        )
                      ],
                    ),
                  ),
                  TabBar(
                    padding: EdgeInsets.zero,
                    indicatorSize: TabBarIndicatorSize.label,
                    indicatorColor: Colors.black,
                    controller: _tabController,
                    isScrollable: true,
                    labelColor: Colors.black,
                    // labelStyle: appstyle(24, Colors.white, FontWeight.bold),
                    labelStyle: TextStyle(
                      fontSize: 24,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                    unselectedLabelColor: Colors.grey.withOpacity(0.3),
                    tabs: const [
                      Tab(
                        text: "Nike",
                      ),
                      Tab(
                        text: "Adidas",
                      ),
                      Tab(
                        text: "Puma",
                      ),
                      Tab(
                        text: "Converse",
                      ),
                      Tab(
                        text: "Ortuseight",
                      ),
                      Tab(
                        text: "New Balance",
                      ),
                      Tab(
                        text: "Reebok",
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.175,
                  left: 16,
                  right: 12),
              child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(16)),
                child: TabBarView(
                  controller: _tabController,
                  children: [
                    LatestShoes(
                      // nike: _nike,
                      shoesFuture: _nike,
                    ),
                    LatestShoes(
                      // nike: _adidas,
                      shoesFuture: _adidas,
                    ),
                    LatestShoes(
                      // nike: _puma,
                      shoesFuture: _puma,
                    ),
                    LatestShoes(
                      // nike: _converse,
                      shoesFuture: _converse,
                    ),
                    LatestShoes(
                      // nike: _ortuseight,
                      shoesFuture: _ortuseight,
                    ),
                    LatestShoes(
                      // nike: _newBalance,
                      shoesFuture: _newBalance,
                    ),
                    LatestShoes(
                      // nike: _reebok,
                      shoesFuture: _reebok,
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Future<dynamic> filter() {
    double _value = 100;
    return showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      barrierColor: Colors.white54,
      builder: (context) => Container(
        height: MediaQuery.of(context).size.height * 0.84,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(25),
            topRight: Radius.circular(25),
          ),
        ),
        child: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            Container(
              height: 5,
              width: 40,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                color: Colors.black38,
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.7,
              child: Column(
                children: [
                  const CustomSpacer(),
                  Text(
                    "Filter",
                    // style: appstyle(40, Colors.black, FontWeight.bold),
                    style: TextStyle(
                      fontSize: 40,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const CustomSpacer(),
                  Text(
                    "Brand",
                    // style: appstyle(20, Colors.black, FontWeight.bold),
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: const [
                        CategoryBtn(
                          label: "Nike",
                          buttonClr: Colors.black,
                        ),
                        CategoryBtn(
                          label: "Adidas",
                          buttonClr: Colors.grey,
                        ),
                        CategoryBtn(
                          label: "Puma",
                          buttonClr: Colors.grey,
                        ),
                        CategoryBtn(
                          label: "Converese",
                          buttonClr: Colors.grey,
                        ),
                        CategoryBtn(
                          label: "Ortuseight",
                          buttonClr: Colors.grey,
                        ),
                        CategoryBtn(
                          label: "New Balance",
                          buttonClr: Colors.grey,
                        ),
                        CategoryBtn(
                          label: "Reebok",
                          buttonClr: Colors.grey,
                        ),
                      ],
                    ),
                  ),
                  const CustomSpacer(),
                  Text(
                    "Price",
                    // style: appstyle(20, Colors.black, FontWeight.bold),
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const CustomSpacer(),
                  Slider(
                      value: _value,
                      activeColor: Colors.black,
                      inactiveColor: Colors.grey,
                      thumbColor: Colors.black,
                      max: 500,
                      divisions: 50,
                      label: _value.toString(),
                      secondaryTrackValue: 200,
                      onChanged: (double value) {}),
                  CustomSpacer(),
                  // Text(
                  //   "Brand",
                  //   style: appstyle(20, Colors.black, FontWeight.bold),
                  // ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    padding: EdgeInsets.all(8),
                    height: 80,
                    child: ListView.builder(
                      // itemCount: brand.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: EdgeInsets.all(8),
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.grey.shade200,
                              borderRadius: BorderRadius.all(
                                Radius.circular(12),
                              ),
                            ),
                            // child: Image.asset(
                            //   // brand[index],
                            //   height: 60,
                            //   width: 80,
                            //   color: Colors.black,
                            // ),
                          ),
                        );
                      },
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
