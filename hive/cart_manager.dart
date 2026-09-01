import 'package:flutter/material.dart';
import 'package:hive_ce_flutter/hive_ce_flutter.dart';
part 'cart_manager.g.dart';

@HiveType(typeId: 0)
class CartManager {
  @HiveField(0)
  final String name;
  @HiveField(1)
  final String qty;
  @HiveField(2)
  final double price;
  @HiveField(3)
  final String image;
  @HiveField(4)
  int iqty;

  CartManager({
    required this.name,
    required this.image,
    required this.price,
    required this.qty,
    this.iqty = 1,
  });

  // static double getTotalPrice() {
  //   return items.fold(0.0,(sum, item) =>sum + ((item['price'] as double) * (item['iqty'] as int)),);
  // }
}
