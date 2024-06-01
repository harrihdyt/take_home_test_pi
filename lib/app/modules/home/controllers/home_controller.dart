// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
// ignore: unnecessary_import
import 'package:get/get_rx/get_rx.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:take_home_test_pi/app/modules/home/models/product_model.dart';
import 'package:http/http.dart' as http;

class HomeController extends GetxController {
  // ignore: unused_field
  LatLng? _currentPosition;
  RxString location = 'Loading...'.obs;
  final controller = ScrollController();

  @override
  void onInit() {
    controller.addListener(() {
      if (controller.position.maxScrollExtent == controller.offset) {
        fetchItems();
      }
    });
    fetchItems();
    permissionLocation();
    _getLocation();
    super.onInit();
  }

  RxList<ProductModel> items = <ProductModel>[].obs;
  var isLoading = false.obs;
  var hasMore = true.obs;
  int page = 0;
  final int limit = 4;

  void fetchItems() async {
    isLoading(true);

    String url =
        'https://api.escuelajs.co/api/v1/products?offset=$page&limit=$limit';

    var response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);

      List<ProductModel> product = [];

      for (var item in data) {
        product.add(ProductModel.fromJson(item));
      }

      if (product.length < limit) {
        hasMore.value = false;
      }

      isLoading(false);

      hasMore.value = true;

      items.addAll(product);
      page++;
    } else {
      isLoading(false);
      throw Exception();
    }
  }

  permissionLocation() async {
    // ignore: unused_local_variable
    LocationPermission permission;
    permission = await Geolocator.requestPermission();
  }

  Future<void> _getLocation() async {
    try {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
      List<Placemark> placemarks =
          await placemarkFromCoordinates(position.latitude, position.longitude);

      _currentPosition = LatLng(position.latitude, position.longitude);

      String address = placemarks.first.name ?? 'Unknown Location';

      location.value = address;

      print(position.latitude);
    } catch (e) {
      location.value = 'Error getting location';

      print(e);
    }
  }
}
