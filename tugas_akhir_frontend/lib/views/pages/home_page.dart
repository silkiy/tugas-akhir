// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:tugas_akhir_frontend/models/shoes_model.dart';
import 'package:tugas_akhir_frontend/views/shared/my_textfield.dart';

import '../../services/halper.dart';
import '../shared/appstyle.dart';
import '../shared/home_widget.dart';
import '../shared/my_banner.dart';
import '../shared/my_top_icon.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  late final TabController _tabController =
      TabController(length: 7, vsync: this);

  final TextEditingController searchController = TextEditingController();

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
    getNike();
    getAdidas();
    getPuma();
    getConverse();
    getOrtuseight();
    getNewBalance();
    getReebok();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Icon(
          Icons.menu,
          size: 30,
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.shopping_bag,
              size: 30,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Stack(
            children: [
              // Container(
              //   margin: EdgeInsets.all(18),
              //   child: MyTopIcon(),
              // ),
              Container(
                padding: EdgeInsets.fromLTRB(18, 15, 18, 0),
                child: MyTextfield(
                  controller: searchController,
                  hintText: "Search",
                  obscureText: false,
                  startIcon: Icons.search,
                ),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(25, 95, 25, 0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: MyBanner(),
              ),
              Container(
                padding: const EdgeInsets.fromLTRB(0, 265, 0, 0),
                height: MediaQuery.of(context).size.height,
                child: Container(
                  padding: const EdgeInsets.only(left: 0, bottom: 15),
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TabBar(
                        padding: EdgeInsets.zero,
                        indicatorSize: TabBarIndicatorSize.label,
                        indicatorColor: Colors.black,
                        controller: _tabController,
                        isScrollable: true,
                        labelColor: Colors.black,
                        labelStyle: TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                        unselectedLabelColor: Colors.grey.withOpacity(0.9),
                        tabs: [
                          Tab(text: "Nike"),
                          Tab(text: "Adidas"),
                          Tab(text: "Puma"),
                          Tab(text: "Converse"),
                          Tab(text: "Ortuseight"),
                          Tab(text: "New Balance"),
                          Tab(text: "Reebok"),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.fromLTRB(25, 330, 25, 0),
                child: TabBarView(
                  controller: _tabController,
                  children: [
                    HomeWidget(
                      nike: _nike,
                      tabIndex: 0,
                    ),
                    HomeWidget(
                      nike: _adidas,
                      tabIndex: 1,
                    ),
                    HomeWidget(
                      nike: _puma,
                      tabIndex: 2,
                    ),
                    HomeWidget(
                      nike: _converse,
                      tabIndex: 3,
                    ),
                    HomeWidget(
                      nike: _ortuseight,
                      tabIndex: 4,
                    ),
                    HomeWidget(
                      nike: _newBalance,
                      tabIndex: 5,
                    ),
                    HomeWidget(
                      nike: _reebok,
                      tabIndex: 6,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
