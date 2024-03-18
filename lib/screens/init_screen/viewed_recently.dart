import 'package:dynamic_height_grid_view/dynamic_height_grid_view.dart';
import 'package:ecommerce_flutter/providers/viewed_recently_provider.dart';
import 'package:ecommerce_flutter/providers/wishlist_provider.dart';
import 'package:ecommerce_flutter/screens/cart/bottom_checkout.dart';
import 'package:ecommerce_flutter/services/assets_manager.dart';
import 'package:ecommerce_flutter/widgets/app_name_text.dart';
import 'package:ecommerce_flutter/screens/cart/cart_widget.dart';
import 'package:ecommerce_flutter/screens/cart/empty_bag.dart';
import 'package:ecommerce_flutter/widgets/products/product_widget.dart';
import 'package:ecommerce_flutter/widgets/title_text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ViewedRecentlyScreen extends StatelessWidget {
  static const routName = "/ViewedRecentlyScreen";
  const ViewedRecentlyScreen({super.key});
  final bool isEmpty = false;

  @override
  Widget build(BuildContext context) {
    final viewedProdProvider = Provider.of<ViewedProdProvider>(context);
    return viewedProdProvider.getViewedProduct.isEmpty
        ? Scaffold(
          appBar: AppBar(
              centerTitle: true,
              leading: IconButton(
                onPressed: () {
                  if (Navigator.canPop(context)) {
                    Navigator.pop(context);
                  }
                },
                icon: const Icon(
                  Icons.arrow_back,
                  size: 20,
                ),
              ),
              title:  TitleTextWidget(
                label: "Last View  ${viewedProdProvider.getViewedProduct.length}",
              ),
            ),
            body: EmptyBagWidget(
                imagePath: AssetsManager.bagimg7,
                title: "Your Last View is empty",
                subTitle: "Your Last View is empty",
                buttonText: "shop Now"),
          )
        : Scaffold(
            appBar: AppBar(
              centerTitle: true,
              leading: IconButton(
                onPressed: () {
                  if (Navigator.canPop(context)) {
                    Navigator.pop(context);
                  }
                },
                icon: const Icon(
                  Icons.arrow_back,
                  size: 20,
                ),
              ),
              title: const TitleTextWidget(
                label: "Last View",
              ),
            ),
        body: DynamicHeightGridView(
          mainAxisSpacing: 12,
          crossAxisSpacing: 12,
          builder: (context,index){
            return   Padding(
              padding:  EdgeInsets.all(8.0),
              child: ProductWidget(
                productId: viewedProdProvider.getViewedProduct.values.toList()[index].productId,
              ),

            );
          },
          itemCount: viewedProdProvider.getViewedProduct.length,
          crossAxisCount: 2,
        )
          );
  }
}
