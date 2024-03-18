import 'package:ecommerce_flutter/models/wishlist_model.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

class WishListProvider with ChangeNotifier {
  final Map<String, WishListModel> _wishListItems = {};
  Map<String, WishListModel> get getWishLists {
    return _wishListItems;
  }

  void AddOrderRemoveWishlist({required String productId}) {

    if(_wishListItems.containsKey(productId)){
      _wishListItems.remove(productId);
    }
    else{
      _wishListItems.putIfAbsent(productId, () => WishListModel(
          wishListId: const Uuid().v4(),
          productId: productId
      )
      );
    }
    notifyListeners();
  }
  bool isProdingWishList({required String productId}){
    return _wishListItems.containsKey(productId);
  }
  void clearLocalWishList(){
    _wishListItems.clear();
    notifyListeners();
  }

}
