import 'package:flutter/material.dart';

class WishListModel with ChangeNotifier {
  final String wishListId;
  final String productId;

  WishListModel({
    required this.wishListId,
    required this.productId,
  });
}
