import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_shop_application/bloc/authentication/auth_bloc.dart';
import 'package:flutter_shop_application/bloc/category/category_bloc.dart';
import 'package:flutter_shop_application/constants/constants.dart';
import 'package:flutter_shop_application/data/data_source/authentication_data_source.dart';
import 'package:flutter_shop_application/data/repository/authentication_repository.dart';
import 'package:flutter_shop_application/di/di.dart';
import 'package:flutter_shop_application/screens/category_screen.dart';
import 'package:flutter_shop_application/screens/home_screen.dart';
import 'package:flutter_shop_application/screens/login_screen.dart';
import 'package:flutter_shop_application/screens/product_details_screen.dart';
import 'package:flutter_shop_application/screens/product_list_screen.dart';
import 'package:flutter_shop_application/screens/profile_screen.dart';
import 'package:flutter_shop_application/utils/auth_manager.dart';
import 'package:flutter_shop_application/widgets/banner_slider.dart';
import 'package:flutter_shop_application/widgets/horizontal_category_list.dart';
import 'package:flutter_shop_application/widgets/product_item.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await getItInit();
  runApp(const ShopApp());
}

class ShopApp extends StatefulWidget {
  const ShopApp({super.key});

  @override
  State<ShopApp> createState() => _ShopAppState();
}

class _ShopAppState extends State<ShopApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'SM'),
      home: Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
          // body: BlocProvider(
          //   create: (context) => AuthBloc(),
          //   child: CategoryScreen(),
          // ),
          body: BlocProvider(
            create: (context) => CategoryBloc(),
            child: CategoryScreen(),
          ),
        ),
      ),
    );
  }
}
