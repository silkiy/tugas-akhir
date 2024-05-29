import 'dart:convert';

import 'package:flutter/services.dart' as the_bundle;
import 'package:http/http.dart' as http;
import 'package:tugas_akhir_frontend/models/shoes_model.dart';

import 'config.dart';

class Helper {
  static var client = http.Client();

  // nike
  Future<List<Shoes>> getNikeShoes() async {
    var url = Uri.http(Config.apiUrl, Config.shoes);

    var response = await client.get(url);

    if (response.statusCode == 200) {
      final nikeList = shoesFromJson(response.body);
      var nike = nikeList.where((element) => element.category == "Nike");
      return nike.toList();
    } else {
      throw Exception("Failed to get shoes list");
    }
  }

  //adidas
  Future<List<Shoes>> getAdidasShoes() async {
    var url = Uri.http(Config.apiUrl, Config.shoes);

    var response = await client.get(url);

    if (response.statusCode == 200) {
      final adidasList = shoesFromJson(response.body);
      var adidas = adidasList.where((element) => element.category == "Adidas");
      return adidas.toList();
    } else {
      throw Exception("Failed to get shoes list");
    }
  }

  //puma
  Future<List<Shoes>> getPumaShoes() async {
    var url = Uri.http(Config.apiUrl, Config.shoes);

    var response = await client.get(url);

    if (response.statusCode == 200) {
      final pumaList = shoesFromJson(response.body);
      var puma = pumaList.where((element) => element.category == "Puma");
      return puma.toList();
    } else {
      throw Exception("Failed to get shoes list");
    }
  }

  //converse
  Future<List<Shoes>> getConverseShoes() async {
    var url = Uri.http(Config.apiUrl, Config.shoes);

    var response = await client.get(url);

    if (response.statusCode == 200) {
      final converseList = shoesFromJson(response.body);
      var converse =
          converseList.where((element) => element.category == "Converse");
      return converse.toList();
    } else {
      throw Exception("Failed to get shoes list");
    }
  }

  //ortuseight
  Future<List<Shoes>> getOrtuseightShoes() async {
    var url = Uri.http(Config.apiUrl, Config.shoes);

    var response = await client.get(url);

    if (response.statusCode == 200) {
      final ortuseightList = shoesFromJson(response.body);
      var ortuseight =
          ortuseightList.where((element) => element.category == "Ortuseight");
      return ortuseight.toList();
    } else {
      throw Exception("Failed to get shoes list");
    }
  }

  //new balance
  Future<List<Shoes>> getNewBalanceShoes() async {
    var url = Uri.http(Config.apiUrl, Config.shoes);

    var response = await client.get(url);

    if (response.statusCode == 200) {
      final newBalanceList = shoesFromJson(response.body);
      var newBalance =
          newBalanceList.where((element) => element.category == "New Balance");
      return newBalance.toList();
    } else {
      throw Exception("Failed to get shoes list");
    }
  }

  //reebok
  Future<List<Shoes>> getReebokShoes() async {
    var url = Uri.http(Config.apiUrl, Config.shoes);

    var response = await client.get(url);

    if (response.statusCode == 200) {
      final reebokList = shoesFromJson(response.body);
      var reebok = reebokList.where((element) => element.category == "Reebok");
      return reebok.toList();
    } else {
      throw Exception("Failed to get shoes list");
    }
  }

  Future<List<Shoes>> search(String searchQuery) async {
    var url = Uri.http(Config.apiUrl, "${Config.search}/$searchQuery");

    try {
      var response = await client.get(url);

      if (response.statusCode == 200) {
        final List<dynamic> responseData = json.decode(response.body);

        // Lakukan konversi dari responseData ke List<Shoes> menggunakan model Shoes
        List<Shoes> result =
            responseData.map((data) => Shoes.fromJson(data)).toList();

        return result;
      } else {
        throw Exception("Failed to get shoes list: ${response.statusCode}");
      }
    } catch (e) {
      throw Exception("Error occurred: $e");
    }
  }
  
}
