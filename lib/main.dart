import 'package:ecommerce_flutter/constants/theme_data.dart';
import 'package:ecommerce_flutter/providers/cart_provider.dart';
import 'package:ecommerce_flutter/providers/product_provider.dart';
import 'package:ecommerce_flutter/providers/theme_provider.dart';
import 'package:ecommerce_flutter/providers/user_provider.dart';
import 'package:ecommerce_flutter/providers/viewed_recently_provider.dart';
import 'package:ecommerce_flutter/providers/wishlist_provider.dart';
import 'package:ecommerce_flutter/screens/auth/forget_password.dart';
import 'package:ecommerce_flutter/screens/auth/login.dart';
import 'package:ecommerce_flutter/screens/auth/register.dart';
import 'package:ecommerce_flutter/screens/init_screen/viewed_recently.dart';
import 'package:ecommerce_flutter/screens/init_screen/wishlist.dart';
import 'package:ecommerce_flutter/screens/root_screen.dart';
import 'package:ecommerce_flutter/screens/search_screnn.dart';
import 'package:ecommerce_flutter/widgets/order/order_screen.dart';
import 'package:ecommerce_flutter/widgets/products/product_details.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<FirebaseApp>(
        future: Firebase.initializeApp(
          options: const  FirebaseOptions(
          apiKey: 'AIzaSyA_duBAB9bhvES3liAgQ4hQ8ib3CUAWH50',
          appId: '1:131255903185:web:c21e252be3a16abf9276f0', 
          messagingSenderId: '131255903185',
          projectId: 'ecommerce-flutter-b8503',
          storageBucket: "ecommerce-flutter-b8503.appspot.com"
          ),
        ),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const MaterialApp(
              debugShowCheckedModeBanner: false,
              home: Scaffold(
                body: Center(
                  child: CircularProgressIndicator(),
                ),
              ),
            );
          }
          else if(snapshot.hasError){
             return  MaterialApp(
              debugShowCheckedModeBanner: false,
              home: Scaffold(
                body: Center(
                  child: SelectableText(snapshot.error.toString()),
                ),
              ),
            );

          }
          return MultiProvider(
            providers: [
              ChangeNotifierProvider(
                create: (_) {
                  return ThemeProvider();
                },
              ),
              ChangeNotifierProvider(
                create: (_) {
                  return ProductProvider();
                },
              ),
              ChangeNotifierProvider(
                create: (_) {
                  return CartProvider();
                },
              ),
              ChangeNotifierProvider(
                create: (_) {
                  return WishListProvider();
                },
              ),
              ChangeNotifierProvider(
                create: (_) {
                  return ViewedProdProvider();
                },
              ),
              ChangeNotifierProvider(
                create: (_) {
                  return UserProvider();
                },
              ),
            ],
            child: Consumer<ThemeProvider>(
                builder: (context, themeProvider, child) {
              return MaterialApp(
                debugShowCheckedModeBanner: false,
                title: "Ecommerce",
                theme: Styles.themeData(
                    isDarkTheme: themeProvider.getIsDarkTheme,
                    context: context),
              home: const LoginScreen(),
              //  home: const RootScreen(),
                routes: {
                  ProductDetailScreen.routName: (context) => const ProductDetailScreen(),
                  RootScreen.routName: (context) => const RootScreen(),
                  WishListScreen.routName: (context) => const WishListScreen(),
                  ViewedRecentlyScreen.routName: (context) => const ViewedRecentlyScreen(),
                  RegisterScreen.routName: (context) => const RegisterScreen(),
                  OrderScreen.routName: (context) => const OrderScreen(),
                  ForgotPassword.routName: (context) => const ForgotPassword(),
                  SearchScreen.routName: (context) => const SearchScreen(),
                  LoginScreen.routName: (context) => const LoginScreen(),
                },
              );
            }),
          );
        });
  }
}
