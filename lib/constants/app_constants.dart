import 'package:ecommerce_flutter/models/categories_model.dart';
import 'package:ecommerce_flutter/services/assets_manager.dart';
import 'package:flutter/material.dart';

class AppConstants {
  static const String imageUrl =
      'https://images.unsplash.com/photo-1465572089651-8fde36c892dd?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&w=1000&q=80';
  static List<String> bannerImages = [
    AssetsManager.slide1,
    AssetsManager.slide2,
    AssetsManager.slide3,
    AssetsManager.slide4,
    AssetsManager.slide5,
    AssetsManager.slide6,
    AssetsManager.slide7,
  ];
  static List<CategoriesModel> categoriesList = [
    CategoriesModel(
        id: "Computer", 
        name: "Computer", 
        image: AssetsManager.computer
        ),
    CategoriesModel(
        id: "Books", 
        name: "Books", 
        image: AssetsManager.file
        ),
    CategoriesModel(
        id: "Flower", 
        name: "Flower", 
        image: AssetsManager.flower,
        ),
    CategoriesModel(
        id: "Mobile Phone", 
        name: "Mobile Phone", 
        image: AssetsManager.mobilephone,
        ),
    CategoriesModel(
        id: "Shoes", 
        name: "Shoes", 
        image: AssetsManager.shoes,
        ),
    CategoriesModel(
        id: "Tshirt", 
        name: "Tshirt", 
        image: AssetsManager.tshort
        ),
    CategoriesModel(
        id: "Watch", 
        name: "Watch", 
        image: AssetsManager.watch
        ),
    
  ];
}
