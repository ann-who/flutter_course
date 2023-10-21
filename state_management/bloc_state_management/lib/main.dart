import 'package:bloc_state_management/business_logic_layer/cart_bloc/cart.dart';
import 'package:bloc_state_management/business_logic_layer/catalog_bloc/catalog_bloc.dart';
import 'package:bloc_state_management/business_logic_layer/order_bloc/order.dart';
import 'package:bloc_state_management/business_logic_layer/search_bloc/search.dart';
import 'package:bloc_state_management/data_layer/data_source/products_data_source.dart';
import 'package:bloc_state_management/data_layer/repository/products_repository_implementation.dart';
import 'package:flutter/material.dart';

import 'package:bloc_state_management/presentation_layer/cart/cart_page.dart';
import 'package:bloc_state_management/presentation_layer/catalog/catalog_page.dart';
import 'package:bloc_state_management/presentation_layer/orders/orders_page.dart';
import 'package:bloc_state_management/presentation_layer/utils/app_colors.dart';
import 'package:bloc_state_management/presentation_layer/utils/app_icons.dart';
import 'package:bloc_state_management/presentation_layer/utils/app_strings.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final catalogBloc = CatalogBloc(
      productsRepository: ProductsRepositoryImplementation(
        productsDataSource: ProductsDataSource(),
      ),
    );

    final searchBloc = SearchBloc(
      productsRepository: ProductsRepositoryImplementation(
        productsDataSource: ProductsDataSource(),
      ),
    );

    final cartBloc = CartBloc();

    final orderBloc = OrderBloc();

    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch().copyWith(
          secondary: AppColors.secondaryPink,
        ),
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          backgroundColor: AppColors.primaryPink,
          elevation: 0.0,
          selectedLabelStyle: TextStyle(fontWeight: FontWeight.w900),
          showSelectedLabels: true,
          showUnselectedLabels: false,
          selectedItemColor: Colors.white,
        ),
        textTheme: const TextTheme(
          bodyMedium: TextStyle(fontSize: 24.0, fontWeight: FontWeight.w700),
        ),
      ),
      home: MyHomePage(
        catalogBloc: catalogBloc,
        searchBloc: searchBloc,
        cartBloc: cartBloc,
        orderBloc: orderBloc,
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final CatalogBloc catalogBloc;
  final SearchBloc searchBloc;
  final CartBloc cartBloc;
  final OrderBloc orderBloc;

  const MyHomePage({
    required this.catalogBloc,
    required this.searchBloc,
    required this.cartBloc,
    required this.orderBloc,
    super.key,
  });

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    widget.catalogBloc.event.add(CatalogLoaded());

    super.initState();
  }

  int _selectedIndex = 1;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> pages = <Widget>[
      OrdersPage(orderBloc: widget.orderBloc),
      CatalogPage(
        catalogBloc: widget.catalogBloc,
        searchBloc: widget.searchBloc,
        cartBloc: widget.cartBloc,
      ),
      CartPage(
        cartBloc: widget.cartBloc,
        orderBloc: widget.orderBloc,
      ),
    ];

    return Scaffold(
      backgroundColor: AppColors.primaryPink,
      body: pages.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: AppIcon(path: AppIconPath.orderIcon),
            label: AppString.orders,
          ),
          BottomNavigationBarItem(
            icon: AppIcon(path: AppIconPath.catalogIcon),
            label: AppString.catalog,
          ),
          BottomNavigationBarItem(
            icon: AppIcon(path: AppIconPath.cartIcon),
            label: AppString.cart,
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }

  @override
  void dispose() {
    widget.catalogBloc.dispose();
    widget.searchBloc.dispose();
    widget.cartBloc.dispose();
    widget.orderBloc.dispose();

    super.dispose();
  }
}
