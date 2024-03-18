import 'package:ecommerce_flutter/providers/wishlist_provider.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:provider/provider.dart';

class HeartButtonWidget extends StatelessWidget {
  const HeartButtonWidget({
    super.key,
    this.bkgColor = Colors.transparent,
    this.size = 20,
    required this.productId,
    });

  final Color bkgColor;
  final double size;
  final String productId;

  @override
  Widget build(BuildContext context) {
    final wishListProvider = Provider.of<WishListProvider>(context);
    return Container(
      decoration: BoxDecoration(
        color: bkgColor,
        shape: BoxShape.circle,
      ),
      child: IconButton(
        style: IconButton.styleFrom(elevation: 10),
        onPressed: (){
          wishListProvider.AddOrderRemoveWishlist(productId: productId);
        },
        icon:Icon(
          wishListProvider.isProdingWishList(productId: productId)
         ? IconlyBold.heart
        : IconlyLight.heart,
          size: size,
        color: wishListProvider.isProdingWishList(productId: productId)? Colors.red
        : Colors.grey
        ),
      )
    );
  }
}
